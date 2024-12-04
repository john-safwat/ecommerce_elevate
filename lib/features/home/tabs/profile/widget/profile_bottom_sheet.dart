// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

// 🌎 Project imports:
import 'package:ecommerce_elevate/core/assets/app_colors.dart';
import 'package:ecommerce_elevate/core/constants/constants.dart';
import 'package:ecommerce_elevate/core/providers/language_provider.dart';

// ignore: must_be_immutable
class ProfileBottomSheet extends StatefulWidget {
  const ProfileBottomSheet({super.key});

  @override
  State<ProfileBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ProfileBottomSheet> {
  late AppLocalizations localizations;

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<LanguageProvider>(context);
    localizations = AppLocalizations.of(context)!;
    return Consumer<LanguageProvider>(
      builder: (context, value, child) => Container(
        width: double.infinity,
        color: Theme.of(context).scaffoldBackgroundColor,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Wrap(
          direction: Axis.horizontal,
          children: [
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      languageProvider.changeLocale(Constants.arabicLocaleKey);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: languageProvider.isEn()
                            ? Theme.of(context).scaffoldBackgroundColor
                            : Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          width: 1,
                          color: AppColors.pink,
                        ),
                      ),
                      child: Text(
                        localizations.arabic,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: languageProvider.isEn()
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).scaffoldBackgroundColor,
                            ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      languageProvider.changeLocale(Constants.englishLocaleKey);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: !languageProvider.isEn()
                            ? Theme.of(context).scaffoldBackgroundColor
                            : Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          width: 1,
                          color: AppColors.pink,
                        ),
                      ),
                      child: Text(
                        localizations.english,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: !languageProvider.isEn()
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).scaffoldBackgroundColor,
                            ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
