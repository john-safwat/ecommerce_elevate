import 'package:ecommerce_elevate/core/assets/app_colors.dart';
import 'package:ecommerce_elevate/features/auth/presentation/edit_profile/edit_profile_contract.dart';
import 'package:ecommerce_elevate/features/auth/presentation/edit_profile/edit_profile_view_model.dart';
import 'package:ecommerce_elevate/features/auth/presentation/edit_profile/widgets/image_profile_and_edit_icon.dart';
import 'package:ecommerce_elevate/features/auth/presentation/signup/signup_view_model.dart';
import 'package:ecommerce_elevate/features/auth/presentation/signup/widgets/radio_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class UserForm extends StatelessWidget {
  ProfileViewModel viewModel;

  UserForm(this.viewModel, {super.key});
  @override
  Widget build(BuildContext context) {
    viewModel = BlocProvider.of<ProfileViewModel>(context);
    return Form(
      onChanged: () => viewModel.doIntent(FormDataChangedAction()),
      key: viewModel.formKey,
      child: ListView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: const EdgeInsets.all(16),
        children: [
          ///-------------> User Image
          Center(
            child: ImageProfileAndEditIcon(
              imageUrl: viewModel.user?.photo ?? '',
              deitIconOnTap: () {
                viewModel.doIntent(PickImageAction(context: context));
              },
            ),
          ),
          const SizedBox(height: 24),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) => viewModel.nameValidation(value ?? ""),
                  keyboardType: TextInputType.name,
                  controller: viewModel.firstNameController,
                  decoration: InputDecoration(
                    label: Text(viewModel.locale!.firstName),
                    hintText: viewModel.locale!.enterFirstName,
                  ),
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) => viewModel.nameValidation(value ?? ""),
                  keyboardType: TextInputType.name,
                  controller: viewModel.lastNameController,
                  decoration: InputDecoration(
                    label: Text(viewModel.locale!.lastName),
                    hintText: viewModel.locale!.enterLastName,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) => viewModel.emailValidation(value ?? ""),
            keyboardType: TextInputType.emailAddress,
            controller: viewModel.emailController,
            decoration: InputDecoration(
              label: Text(viewModel.locale!.email),
              hintText: viewModel.locale!.enterEmail,
            ),
          ),
          const SizedBox(height: 24),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            obscuringCharacter: "*",
            readOnly: true,
            initialValue: "------------------",
            decoration: InputDecoration(
              suffixIcon: InkWell(
                onTap: () {
                  viewModel.doIntent(NavigateToChangePasswordAction());
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        viewModel.locale!.change,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: AppColors.pink),
                      ),
                    ),
                  ],
                ),
              ),
              label: Text(viewModel.locale!.password),
              hintText: viewModel.locale!.enterPassword,
            ),
          ),
          const SizedBox(height: 24),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) => viewModel.phoneValidation(value ?? ""),
            keyboardType: TextInputType.phone,
            controller: viewModel.phoneController,
            decoration: InputDecoration(
              label: Text(viewModel.locale!.phone),
              hintText: viewModel.locale!.enterPhone,
            ),
          ),
          //--------------------------> Gender
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                viewModel.locale!.gender,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontSize: 18),
              ),
              const SizedBox(width: 40),
              Expanded(
                child: RadioWidget(
                  value: Gender.female,
                  groupValue: viewModel.selectedGender,
                  onChangeGender: (gender) {
                    viewModel.doIntent(ChangeGenderAction(gender: gender));
                  },
                  title: viewModel.locale!.female,
                ),
              ),
              Expanded(
                child: RadioWidget(
                  value: Gender.male,
                  groupValue: viewModel.selectedGender,
                  onChangeGender: (value) {
                    viewModel.doIntent(ChangeGenderAction(gender: value));
                  },
                  title: viewModel.locale!.male,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          //-------------------------->update button
          ValueListenableBuilder(
            valueListenable: viewModel.valid,
            builder: (context, value, child) => ElevatedButton(
                onPressed: () {
                  viewModel.doIntent(UpdateUserAction());
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: value
                        ? AppColors.pink
                        : AppColors.black[AppColors.colorCode30]),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(viewModel.locale!.editProfile),
                )),
          ),
        ],
      ),
    );
  }
}
