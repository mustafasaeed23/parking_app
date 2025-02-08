import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LanguageSwitcherWidget extends StatelessWidget {
  const LanguageSwitcherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    bool isArabic = context.locale.languageCode == 'ar';

    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              isArabic ? 'العربية' : 'English',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Switch(
              value: isArabic,
              onChanged: (value) {
                Locale newLocale =
                    value ? const Locale('ar', 'AE') : const Locale('en', 'US');
                context.setLocale(newLocale);
              },
            ),
          ],
        ),
      ),
    );
  }
}
