import 'package:architecture_pattern/core/theme/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Theme'),
          Switch(
            value: state.isDark,
            onChanged: (value) {
              context.read<ThemeCubit>().toggle();
            },
          ),
        ],
      ),
    );
  }
}