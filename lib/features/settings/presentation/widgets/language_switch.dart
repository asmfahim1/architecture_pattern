import 'package:architecture_pattern/core/localization/language_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguageSwitch extends StatelessWidget {
  const LanguageSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, LanguageState>(
      builder: (context, state) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Language'),
          DropdownButton<String>(
            value: state.languageCode,
            items: const [
              DropdownMenuItem(child: Text('English'), value: 'en'),
              DropdownMenuItem(child: Text('Bangla'), value: 'bn'),
            ],
            onChanged: (langCode) {
              if (langCode != null) {
                context.read<LanguageCubit>().switchTo(langCode);
              }
            },
          ),
        ],
      ),
    );
  }
}