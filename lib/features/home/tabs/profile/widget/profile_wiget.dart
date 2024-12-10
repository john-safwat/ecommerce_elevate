// 🐦 Flutter imports:
// 📦 Package imports:
import 'package:cached_network_image/cached_network_image.dart';
// 🌎 Project imports:
import 'package:ecommerce_elevate/core/assets/app_colors.dart';
import 'package:ecommerce_elevate/core/assets/app_images.dart';
import 'package:ecommerce_elevate/core/constants/constants.dart';
import 'package:ecommerce_elevate/core/constants/routes.dart';
import 'package:ecommerce_elevate/features/home/tabs/profile/view_model/profile_tab_actions.dart';
import 'package:ecommerce_elevate/features/home/tabs/profile/view_model/profile_tab_state.dart';
import 'package:ecommerce_elevate/features/home/tabs/profile/view_model/profile_tab_view_model.dart';
import 'package:ecommerce_elevate/features/home/tabs/profile/widget/list_tile_widget.dart';
import 'package:ecommerce_elevate/features/home/tabs/profile/widget/profile_bottom_sheet.dart';
import 'package:ecommerce_elevate/features/saved_address/saved_addresses_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({super.key});

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  bool isOn = false;

  late ProfileTabViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    viewModel = BlocProvider.of<ProfileTabViewModel>(context);
    var user = (viewModel.state.userProfileState as ProfileSuccessState).user;
    return ListView(
      children: [
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipOval(
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                height: 100,
                width: 100,
                imageUrl: user.photo ?? "",
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                ),
              ),
            ),
          ],
        ),
        Text(user.firstName ?? "",
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: AppColors.black)),
        Text(
          user.email ?? "",
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(color: AppColors.gray),
        ),
        const SizedBox(height: 32),
        ListTileWidget(
          prefixWidget: const ImageIcon(
            AssetImage(AppImages.myOrders),
            color: AppColors.black,
            size: 20,
          ),
          suffixWidget: const Icon(Icons.arrow_forward_ios_rounded),
          title: viewModel.locale?.myOrders,
        ),
        ListTileWidget(
          onPress: (){
            Navigator.push(context,MaterialPageRoute(builder: (context) => SavedAddressesView(viewModel:viewModel ,  title: viewModel.locale!.savedAddress,),));
          },
          prefixWidget: const ImageIcon(AssetImage(AppImages.location)),
          suffixWidget: const Icon(Icons.arrow_forward_ios_rounded),
          title: viewModel.locale?.savedAddress,
        ),
        const Divider(),
        ListTileWidget(
          prefixWidget: Switch(
            value: isOn,
            onChanged: (value) {
              setState(() {
                isOn = value;
              });
            },
            activeTrackColor: AppColors.pink,
            activeColor: AppColors.white,
          ),
          suffixWidget: const Icon(Icons.arrow_forward_ios_rounded),
          title: viewModel.locale?.notification,
        ),
        const Divider(),
        ListTileWidget(
          prefixWidget: const ImageIcon(AssetImage(AppImages.translate)),
          title: viewModel.locale?.language,
          suffixWidget: TextButton(
              onPressed: () {
                showLanguageBottomSheet();
              },
              child: Text(viewModel.languageProvider!.getLocal() ==
                      Constants.arabicLocaleKey
                  ? viewModel.locale!.arabic
                  : viewModel.locale!.english)),
        ),
        ListTileWidget(
          title: viewModel.locale?.aboutUs,
          suffixWidget: const Icon(Icons.arrow_forward_ios_rounded),
          onPress: () {
            viewModel.doIntent(NavigateToAboutUsAction());
          },
        ),
        ListTileWidget(
          title: viewModel.locale?.termsAndConditions,
          suffixWidget: const Icon(Icons.arrow_forward_ios_rounded),
          onPress: () {
            viewModel.doIntent(NavigatorToTermsAndConditionsAction());
          },
        ),
        const Divider(),
        ListTileWidget(
          onPress: () {
            viewModel.doIntent(LogoutConfirmationAction());

          },
          title: viewModel.locale?.logout,
          suffixWidget: const Icon(Icons.logout_outlined),
          prefixWidget: const Icon(Icons.logout_outlined),
        ),
      ],
    );
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return const ProfileBottomSheet();
      },
    );
  }
}
