import 'package:ecommerce_elevate/core/assets/app_colors.dart';
import 'package:ecommerce_elevate/core/constants/constants.dart';
import 'package:ecommerce_elevate/features/home/presentation/tabs/profile/view_model/profile_tab_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/providers/language_provider.dart';

class ProfileBottomSheet extends StatefulWidget {
  final ProfileTabViewModel viewModel;

  const ProfileBottomSheet(this.viewModel);
  @override
  State<ProfileBottomSheet> createState() => _ThemeBottomSheetState();

}

class _ThemeBottomSheetState extends State<ProfileBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
              onTap: (){
                widget.viewModel.languageProvider?.changeLocale(Constants.arabicLocaleKey);
              },
              child: widget.viewModel.languageProvider!.isEn()?
              getUnselectedItem(
                  unselectedThemeName: widget.viewModel.locale!.arabic):
              getSelectedItem(selectedThemeName:widget.viewModel.locale!.arabic)),
          SizedBox(
            height: 15,
          ),
          InkWell(
              onTap: (){
                widget.viewModel.languageProvider?.changeLocale(Constants.englishLocaleKey);
              },
              child:
              widget.viewModel.languageProvider!.isEn()?
              getSelectedItem(selectedThemeName:widget.viewModel.locale!.english):
              getUnselectedItem(
                  unselectedThemeName: widget.viewModel.locale!.english)),



        ],
      ),
    );
  }

  Widget getSelectedItem({required String selectedThemeName}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          selectedThemeName,
          style: const  TextStyle(fontSize: 25, color: AppColors.pink,fontWeight: FontWeight.bold
          ),
        ),
        const  Icon(
          Icons.check,
          color:AppColors.pink,
        )
      ],
    );
  }

  Widget getUnselectedItem({required String unselectedThemeName}) {
    return Container(
      width: double.infinity,
      child: Text(unselectedThemeName,
          style: TextStyle(
            fontSize: 25,
          )),
    );
  }
}
