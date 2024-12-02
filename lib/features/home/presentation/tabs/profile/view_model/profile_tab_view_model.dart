// 🐦 Flutter imports:
import 'package:ecommerce_elevate/core/di/di.dart';
import 'package:ecommerce_elevate/core/providers/app_config_provider.dart';
import 'package:ecommerce_elevate/features/home/domain/entities/profile_info/profile_response.dart';
import 'package:ecommerce_elevate/features/home/domain/use_case/logged_user_info_use_case.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:geocode/geocode.dart';
import 'package:injectable/injectable.dart';
import 'package:location/location.dart';

// 🌎 Project imports:
import 'package:ecommerce_elevate/core/base/base_view_model.dart';
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/features/home/domain/entities/category/category.dart';
import 'package:ecommerce_elevate/features/home/domain/entities/occasions/occasion.dart';
import 'package:ecommerce_elevate/features/home/domain/entities/products/product.dart';
import 'package:ecommerce_elevate/features/home/domain/use_case/get_categories_list_use_case.dart';
import 'package:ecommerce_elevate/features/home/domain/use_case/get_most_selling_products_list_use_case.dart';
import 'package:ecommerce_elevate/features/home/domain/use_case/get_occasions_list_use_case.dart';
import 'profile_tab_actions.dart';
import 'profile_tab_state.dart';

@injectable
class ProfileTabViewModel extends BaseViewModel<ProfileTabState, ProfileTabActions> {
final LoggedUserInfoUseCase loggedUserInfoUseCase;


  ProfileTabViewModel(
      this.loggedUserInfoUseCase)
      : super(ProfileInitialState());


  @override
  Future<void> doIntent(ProfileTabActions action) async {
    switch (action) {

      case LoadLoggedUserInfo():{
        _getLoggedUser();
      }
    }
  }


Future<void> _getLoggedUser() async {
  emit(ProfileLoadingState());

  final Results<ProfileResponse?> profile =
  await loggedUserInfoUseCase.call("Bearer ${getIt<AppConfigProvider>().token}");

  switch (profile) {
    case Success<ProfileResponse?>():
      {
        emit(ProfileSuccessState(profile.data!.user!));
      }
    case Failure<ProfileResponse?>():{
      emit(ProfileFailState(
        mapExceptionToMessage(profile.exception),
        profile.exception,
      ));
    }
  }
}}