import 'package:ecommerce_elevate/core/assets/app_colors.dart';
import 'package:ecommerce_elevate/core/assets/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;

    return Scaffold(
        appBar: AppBar(
          title: Text(locale.aboutUs),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //--------> App Logo
                Center(
                  child: Image.asset(
                    AppImages.logo,
                    height: 45,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 20),

                ///-------> About Us
                Text(
                  locale.aboutUsQuestion,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: AppColors.pink[AppColors.colorCode40]),
                ),

                const SizedBox(height: 20),
                //--------> About Us description
                Expanded(
                  child: SingleChildScrollView(
                    child: Text(
                      locale.aboutDescription,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
