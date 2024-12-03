import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ecommerce_elevate/core/base/base_view_model.dart';
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/core/di/di.dart';
import 'package:ecommerce_elevate/core/providers/app_config_provider.dart';
import 'package:ecommerce_elevate/core/utils/set_image.dart';
import 'package:ecommerce_elevate/features/auth/domain/entities/edit_profile/edit_profile_request.dart';
import 'package:ecommerce_elevate/features/auth/domain/entities/edit_profile/edit_profile_response.dart';
import 'package:ecommerce_elevate/features/auth/domain/entities/user/user.dart';
import 'package:ecommerce_elevate/features/auth/domain/entities/user_info/user_info_response.dart';
import 'package:ecommerce_elevate/features/auth/domain/use_case/edit_profile_use_case.dart';
import 'package:ecommerce_elevate/features/auth/domain/use_case/get_user_info_use_case.dart';
import 'package:ecommerce_elevate/features/auth/domain/use_case/upload_profile_image_use_case.dart';
import 'package:ecommerce_elevate/features/auth/presentation/edit_profile/edit_profile_contract.dart';
import 'package:ecommerce_elevate/features/auth/presentation/signup/signup_view_model.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProfileViewModel extends BaseViewModel<ProfileViewState, ProfileAction> {
  GetUserInfoUseCase getUserInfoUseCase;
  EditProfileUseCase updateUserInfoUseCase;
  UploadProfileImageUseCase uploadProfileImageUseCase;
  // late MainViewModel mainViewModel;

  ProfileViewModel(this.getUserInfoUseCase, this.updateUserInfoUseCase,
      this.uploadProfileImageUseCase)
      : super(InitialProfileViewState());

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  Gender selectedGender = Gender.female;
  File? imageFile;

  ValueNotifier<bool> valid = ValueNotifier(false);
  User? user;

  @override
  Future<void> doIntent(ProfileAction action) async {
    switch (action) {
      case LoadDataAction():
        {
          _loadData();
        }
      case FormDataChangedAction():
        {
          _updateValidationState();
        }
      case NavigateToChangePasswordAction():
        {
          _navigateToChangePassword();
        }
      case UpdateUserAction():
        {
          _updateUserData();
        }
      case ClearAction():
        {
          _clear();
        }
      case ChangeGenderAction():
        {
          _changeGender(action.gender);
        }
      case PickImageAction():
        {
          _setImage(action.context);
        }
    }
  }

  _clear() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    valid.dispose();
  }

  void _setImage(BuildContext context) async {
    imageFile = await pickImage(context);

    emit(SetImageProfileState());
    _updateImageProfile();
  }

  Future<void> _updateImageProfile() async {
    emit(UpdateImageProfileLoadingState());
    log(imageFile.toString());
    log(imageFile!.path.split('/').last.toLowerCase());
    FormData formData = FormData.fromMap({
      if (imageFile != null)
        "photo": await MultipartFile.fromFile(
          imageFile!.path,
          //filename: 'profile.png',
        ),
    });
    var response = uploadProfileImageUseCase.call(imageFile: formData);
    switch (response) {
      case Success<String>():
        {
          emit(UpdateImageProfileSuccessState());
          _loadData();
        }
      case Failure<String>():
        {
          emit(UpdateImageProfileFailureState('error'));
        }
    }
  }

  void _loadData() async {
    emit(ProfileDataLoadingState());
    var response =
        await getUserInfoUseCase(token: getIt<AppConfigProvider>().token);
    switch (response) {
      case Success<GetUserInfoResponse>():
        {
          _initUser(response.data?.user);
          emit(ProfileDataLoadingSuccessState());
        }

      case Failure<GetUserInfoResponse>():
        {
          emit(ProfileDataLoadingFailState(
              mapExceptionToMessage(response.exception)));
          //mainViewModel.validateOnException(response.exception);
        }
    }
  }

  // validation functions
  // validate on the name if it is not empty and doesn't contain ant spacial characters
  String? nameValidation(String name) {
    if (name.isEmpty) {
      return locale!.nameCantBeEmpty;
    } else if (RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%-]').hasMatch(name)) {
      return locale!.invalidName;
    } else {
      return null;
    }
  }

  // validate on the email form
  String? emailValidation(String input) {
    if (input.isEmpty) {
      return locale!.emailCantBeEmpty;
    } else if (!RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+"
            r"@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
            r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
            r"{0,253}[a-zA-Z0-9])?)*$")
        .hasMatch(input)) {
      return locale!.enterAValidEmail;
    }
    return null;
  }

  // mobile validation function to check for the phone number
  String? phoneValidation(String value) {
    if (value.isEmpty) {
      return locale!.enterPhoneNumber;
    } else if (!RegExp(r'^\+20(10|11|12|15)\d{8}$').hasMatch(value)) {
      return locale!.enterValidMobileNumber;
    }
    return null;
  }

  void _initUser(User? data) {
    user = data;
    emailController.text = data?.email ?? "";
    phoneController.text = data?.phone ?? "";
    firstNameController.text = data?.firstName ?? "";
    lastNameController.text = data?.lastName ?? "";
    selectedGender = data?.gender == "female" ? Gender.female : Gender.male;
  }

  void _updateValidationState() {
    if (firstNameController.text.isEmpty ||
        lastNameController.text.isEmpty ||
        emailController.text.isEmpty ||
        phoneController.text.isEmpty) {
      valid.value = false;
    } else if (!formKey.currentState!.validate()) {
      valid.value = false;
    } else {
      valid.value = true;
    }
  }

  void _navigateToChangePassword() {
    appConfigProvider!.email = user?.email ?? "none";
    emit(NavigateToChangePasswordState());
  }

  void _changeGender(Gender gender) {
    selectedGender = gender;
    log('selectedGender: $selectedGender');
    emit(EditProfileChangeGenderState());
  }

  void _updateUserData() async {
    if (!valid.value) {
      return;
    }

    if (formKey.currentState!.validate()) {
      emit(ShowLoadingState());
      var response = await updateUserInfoUseCase(
        request: EditProfileRequest(
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          email: emailController.text,
          phone: phoneController.text,
          // gender: selectedGender == Gender.female ? "female" : "male",
          // photo: user?.photo,
        ),
      );
      emit(HideLoadingState());

      switch (response) {
        case Success<EditProfileResponse>():
          {
            emit(ShowSuccessMessageState());
          }
        case Failure<EditProfileResponse>():
          {
            emit(ShowFailMessageState(
                mapExceptionToMessage(response.exception)));
          }
      }
    }
  }
}
