
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_elevate/core/assets/app_colors.dart';
import 'package:ecommerce_elevate/core/assets/app_images.dart';
import 'package:ecommerce_elevate/core/base/base_view.dart';
import 'package:ecommerce_elevate/core/constants/constants.dart';
import 'package:ecommerce_elevate/core/utils/app_dialogs.dart';
import 'package:ecommerce_elevate/features/home/domain/entities/profile_info/user/logged_user.dart';
import 'package:ecommerce_elevate/features/home/presentation/tabs/profile/view_model/logout/logout_states.dart';
import 'package:ecommerce_elevate/features/home/presentation/tabs/profile/view_model/logout/logout_view_model.dart';
import 'package:ecommerce_elevate/features/home/presentation/tabs/profile/view_model/profile_tab_view_model.dart';
import 'package:ecommerce_elevate/features/home/presentation/tabs/profile/widget/list_tile_widget.dart';
import 'package:ecommerce_elevate/features/home/presentation/tabs/profile/widget/profile_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/constants/routes.dart';
import '../../../../../../core/di/di.dart';
import '../view_model/logout/logout_actions.dart';

class ProfileWidget extends StatefulWidget {
  final LoggedUser user;
  final ProfileTabViewModel viewModel;
  final VoidCallback onLogoutSuccess;

  const ProfileWidget({required this.user, required this.viewModel, required this.onLogoutSuccess, super.key});

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends BaseState<ProfileWidget, LogoutViewModel> {


  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       const SizedBox(
          height: 16,
        ),


            ClipOval(
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                height: 100,
                width: 100,
                imageUrl: widget.user.photo ?? "",
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                ),
              ),
            ),
        Text(widget.user.firstName ?? "",
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: AppColors.black)),
        Text(
          widget.user.email ?? "",
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(color: AppColors.gray),
        ),
       const SizedBox(height: 32),
        ListTileWidget(
          prefixImageIcon: const ImageIcon(
            AssetImage(AppImages.myOrders),
            color: AppColors.black,
            size: 20,
          ),
          suffixIcon: const Icon(Icons.arrow_forward_ios_rounded),
          title: widget.viewModel.locale?.myOrders,
        ),
        ListTileWidget(
          prefixImageIcon: const ImageIcon(AssetImage(AppImages.location)),
          suffixIcon: const Icon(Icons.arrow_forward_ios_rounded),
          title: widget.viewModel.locale?.savedAddress,
        ),
        Container(
          height: 1,
          color: AppColors.lightGray,
        ),
        ListTileWidget(
          switchWidget: Switch(
            value: isOn,
            onChanged: (value) {
              setState(() {
                isOn = value;
              });
            },
            activeTrackColor: AppColors.pink,
            activeColor: AppColors.white,
          ),
          suffixIcon: const Icon(Icons.arrow_forward_ios_rounded),
          title: widget.viewModel.locale?.notification,
        ),
        Container(
          height: 1,
          color: AppColors.lightGray,
        ),
        ListTileWidget(
          prefixImageIcon: const ImageIcon(AssetImage(AppImages.translate)),
          title: widget.viewModel.locale?.language,
          textButton: TextButton(
              onPressed: () {
                showLanguageBottomSheet();
              },
              child: Text(widget.viewModel.languageProvider!.getLocal() ==
                      Constants.arabicLocaleKey
                  ? widget.viewModel.locale!.arabic
                  : widget.viewModel.locale!.english)),
        ),
        ListTileWidget(
          title: widget.viewModel.locale?.aboutUs,
          suffixIcon: const Icon(Icons.arrow_forward_ios_rounded),
        ),
        ListTileWidget(
          title: widget.viewModel.locale?.termsAndConditions,
          suffixIcon: const Icon(Icons.arrow_forward_ios_rounded),
        ),
        Container(
          height: 1,
          color: AppColors.lightGray,
        ),

        BlocProvider<LogoutViewModel>(
          create: (context) => viewModel,
          child: InkWell(
            onTap: () {
                AppDialogs.showInfoDialog(message: widget.viewModel.locale!.areYouSureYouWantToLogout, context: context,
                    posActionTitle:  widget.viewModel.locale!.yes,
                    posAction: () {
                     viewModel.doIntent(LogoutUser());
                     widget.onLogoutSuccess();

                    },negativeActionTitle: widget.viewModel.locale?.no
                );


            },
            child: ListTileWidget(
              title: widget.viewModel.locale?.logout,
              suffixIcon: const Icon(Icons.logout_outlined),
              prefixIcon: const Icon(Icons.logout_outlined),
            ),
          ),
        ),
    BlocListener<LogoutViewModel, LogoutStates>(
      bloc: viewModel,

    listener: (context, state) {

      if (state is LogoutSuccessState) {
        Navigator.pop(context);
        AppDialogs.showSuccessDialog(
          message: widget.viewModel.locale!.loggedOutSuccessfully,
          context: context,
          posActionTitle: widget.viewModel.locale?.ok,
          posAction: (){
            Navigator.pushReplacementNamed(context, Routes.loginRoute);
          }

        );
      }
    if (state is LogoutLoadingState) {
    AppDialogs.showLoading(
    message: widget.viewModel.locale!.loading, context: context);
    }  if (state is LogoutFailState) {
      Navigator.pop(context);
    AppDialogs.showFailDialog(
    message: state.message,
    context: context,
    posActionTitle: widget.viewModel.locale?.ok,
    );
    }
    },
      child: Container(),
    ),

      ],
    );
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ProfileBottomSheet(widget.viewModel);
      },
    );
  }

  @override
  LogoutViewModel initViewModel() {
    return getIt<LogoutViewModel>();
  }
}
