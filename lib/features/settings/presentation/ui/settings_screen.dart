import 'package:flutter/material.dart';
import '../widgets/language_switch.dart';
import '../widgets/theme_switch.dart';
import '../widgets/logout_button.dart';
import '../widgets/profile_section.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          ProfileSection(),
          SizedBox(height: 16),
          LanguageSwitch(),
          SizedBox(height: 16),
          ThemeSwitch(),
          SizedBox(height: 16),
          LogoutButton(),
        ],
      ),
    );
  }
}