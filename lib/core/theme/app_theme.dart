import 'package:architecture_pattern/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.lightBackground,
    appBarTheme: _lightAppBarTheme,
    textTheme: _lightTextTheme,
    colorScheme: _lightColorScheme,
    inputDecorationTheme: _lightInputDecorationTheme,
    elevatedButtonTheme: _lightElevatedButtonTheme,
    outlinedButtonTheme: _lightOutlinedButtonTheme,
    textButtonTheme: _lightTextButtonTheme,
    iconButtonTheme: _lightIconButtonTheme,
    floatingActionButtonTheme: _lightFloatingActionButtonTheme,
    cardTheme: _lightCardTheme,
    dialogTheme: _lightDialogTheme,
    bottomSheetTheme: _lightBottomSheetTheme,
    snackBarTheme: _lightSnackBarTheme,
    listTileTheme: _lightListTileTheme,
    switchTheme: _lightSwitchTheme,
    sliderTheme: _lightSliderTheme,
    tabBarTheme: _lightTabBarTheme,
    chipTheme: _lightChipTheme,
    progressIndicatorTheme: _lightProgressIndicatorTheme,
    popupMenuTheme: _lightPopupMenuTheme,
    tooltipTheme: _lightTooltipTheme,
    navigationBarTheme: _lightNavigationBarTheme,
    drawerTheme: _lightDrawerTheme,
    expansionTileTheme: _lightExpansionTileTheme,
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.darkBackground,
    appBarTheme: _darkAppBarTheme,
    textTheme: _darkTextTheme,
    colorScheme: _darkColorScheme,
    inputDecorationTheme: _darkInputDecorationTheme,
    elevatedButtonTheme: _darkElevatedButtonTheme,
    outlinedButtonTheme: _darkOutlinedButtonTheme,
    textButtonTheme: _darkTextButtonTheme,
    iconButtonTheme: _darkIconButtonTheme,
    floatingActionButtonTheme: _darkFloatingActionButtonTheme,
    cardTheme: _darkCardTheme,
    dialogTheme: _darkDialogTheme,
    bottomSheetTheme: _darkBottomSheetTheme,
    snackBarTheme: _darkSnackBarTheme,
    listTileTheme: _darkListTileTheme,
    switchTheme: _darkSwitchTheme,
    sliderTheme: _darkSliderTheme,
    tabBarTheme: _darkTabBarTheme,
    chipTheme: _darkChipTheme,
    progressIndicatorTheme: _darkProgressIndicatorTheme,
    popupMenuTheme: _darkPopupMenuTheme,
    tooltipTheme: _darkTooltipTheme,
    navigationBarTheme: _darkNavigationBarTheme,
    drawerTheme: _darkDrawerTheme,
    expansionTileTheme: _darkExpansionTileTheme,
  );
}


// Light theme configurations
const AppBarTheme _lightAppBarTheme = AppBarTheme(
  backgroundColor: AppColors.lightSurface,
  foregroundColor: AppColors.lightOnSurface,
  elevation: 0,
  titleTextStyle: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.lightOnSurface,
  ),
);

const TextTheme _lightTextTheme = TextTheme(
  displayLarge: TextStyle(color: AppColors.lightOnSurface),
  displayMedium: TextStyle(color: AppColors.lightOnSurface),
  displaySmall: TextStyle(color: AppColors.lightOnSurface),
  headlineMedium: TextStyle(color: AppColors.lightOnSurface),
  headlineSmall: TextStyle(color: AppColors.lightOnSurface),
  titleLarge: TextStyle(color: AppColors.lightOnSurface),
  titleMedium: TextStyle(color: AppColors.lightOnSurface),
  titleSmall: TextStyle(color: AppColors.lightOnSurface),
  bodyLarge: TextStyle(color: AppColors.lightOnSurface),
  bodyMedium: TextStyle(color: AppColors.lightOnSurface),
  bodySmall: TextStyle(color: AppColors.lightOnSurface),
  labelLarge: TextStyle(color: AppColors.lightOnSurface),
  labelMedium: TextStyle(color: AppColors.lightOnSurface),
  labelSmall: TextStyle(color: AppColors.lightOnSurface),
);

final ColorScheme _lightColorScheme = ColorScheme.light(
  primary: AppColors.primary,
  primaryContainer: AppColors.primary.withOpacity(0.1),
  onPrimary: AppColors.lightOnPrimary,
  secondary: AppColors.secondary,
  onSecondary: AppColors.lightOnPrimary,
  error: AppColors.error,
  onError: AppColors.onError,
  surfaceBright: AppColors.lightBackground,
  onBackground: AppColors.lightOnSurface,
  surface: AppColors.lightSurface,
  onSurface: AppColors.lightOnSurface,
  outline: AppColors.lightDivider,
  onSurfaceVariant: AppColors.lightOnSurface.withOpacity(0.6),
  shadow: Colors.black.withOpacity(0.1),
);

final InputDecorationTheme _lightInputDecorationTheme = InputDecorationTheme(
  filled: true,
  fillColor: AppColors.lightSurface,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: const BorderSide(color: AppColors.lightDivider),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: const BorderSide(color: AppColors.lightDivider),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: const BorderSide(color: AppColors.primary, width: 2),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: const BorderSide(color: AppColors.error),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: const BorderSide(color: AppColors.error, width: 2),
  ),
  hintStyle: TextStyle(color: AppColors.lightOnSurface.withOpacity(0.5)),
  labelStyle: TextStyle(color: AppColors.lightOnSurface.withOpacity(0.7)),
);

final ElevatedButtonThemeData _lightElevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    backgroundColor: AppColors.primary,
    foregroundColor: AppColors.lightOnPrimary,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    elevation: 2,
    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
    textStyle: const TextStyle(fontWeight: FontWeight.bold),
  ),
);

final OutlinedButtonThemeData _lightOutlinedButtonTheme = OutlinedButtonThemeData(
  style: OutlinedButton.styleFrom(
    foregroundColor: AppColors.primary,
    side: const BorderSide(color: AppColors.primary),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
  ),
);

final TextButtonThemeData _lightTextButtonTheme = TextButtonThemeData(
  style: TextButton.styleFrom(
    foregroundColor: AppColors.primary,
    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
  ),
);

final IconButtonThemeData _lightIconButtonTheme = IconButtonThemeData(
  style: IconButton.styleFrom(
    foregroundColor: AppColors.lightOnSurface,
    backgroundColor: AppColors.lightSurface,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  ),
);

final FloatingActionButtonThemeData _lightFloatingActionButtonTheme = FloatingActionButtonThemeData(
  backgroundColor: AppColors.primary,
  foregroundColor: AppColors.lightOnPrimary,
  elevation: 4,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
);

final CardTheme _lightCardTheme = CardTheme(
  color: AppColors.lightSurface,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  elevation: 2,
  margin: const EdgeInsets.all(8),
);

final DialogTheme _lightDialogTheme = DialogTheme(
  backgroundColor: AppColors.lightSurface,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  elevation: 8,
);

const BottomSheetThemeData _lightBottomSheetTheme = BottomSheetThemeData(
  backgroundColor: AppColors.lightSurface,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
  ),
  elevation: 8,
);

final SnackBarThemeData _lightSnackBarTheme = SnackBarThemeData(
  backgroundColor: AppColors.lightSurface,
  contentTextStyle: const TextStyle(color: AppColors.lightOnSurface),
  actionTextColor: AppColors.primary,
  elevation: 4,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
);

const ListTileThemeData _lightListTileTheme = ListTileThemeData(
  tileColor: AppColors.lightSurface,
  iconColor: AppColors.primary,
  textColor: AppColors.lightOnSurface,
  horizontalTitleGap: 16,
  minVerticalPadding: 8,
);

final SwitchThemeData _lightSwitchTheme = SwitchThemeData(
  thumbColor: WidgetStateProperty.resolveWith((states) {
    if (states.contains(WidgetState.selected)) {
      return AppColors.lightOnPrimary;
    }
    return AppColors.lightOnSurface.withOpacity(0.5);
  }),
  trackColor: WidgetStateProperty.resolveWith((states) {
    if (states.contains(WidgetState.selected)) {
      return AppColors.primary.withOpacity(0.5);
    }
    return AppColors.lightDivider;
  }),
);

final SliderThemeData _lightSliderTheme = SliderThemeData(
  activeTrackColor: AppColors.primary,
  inactiveTrackColor: AppColors.lightDivider,
  thumbColor: AppColors.primary,
  overlayColor: AppColors.primary.withOpacity(0.1),
  valueIndicatorColor: AppColors.primary,
);

final TabBarTheme _lightTabBarTheme = TabBarTheme(
  labelColor: AppColors.primary,
  unselectedLabelColor: AppColors.lightOnSurface.withOpacity(0.6),
  indicatorColor: AppColors.primary,
  indicatorSize: TabBarIndicatorSize.tab,
  dividerColor: Colors.transparent,
);

final ChipThemeData _lightChipTheme = ChipThemeData(
  backgroundColor: AppColors.primary.withOpacity(0.1),
  selectedColor: AppColors.primary.withOpacity(0.2),
  checkmarkColor: AppColors.primary,
  labelStyle: const TextStyle(color: AppColors.primary),
  secondaryLabelStyle: const TextStyle(color: AppColors.secondary),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
);

const ProgressIndicatorThemeData _lightProgressIndicatorTheme = ProgressIndicatorThemeData(
  color: AppColors.primary,
  circularTrackColor: AppColors.lightDivider,
  linearTrackColor: AppColors.lightDivider,
);

final PopupMenuThemeData _lightPopupMenuTheme = PopupMenuThemeData(
  color: AppColors.lightSurface,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  elevation: 8,
);

final TooltipThemeData _lightTooltipTheme = TooltipThemeData(
  decoration: BoxDecoration(
    color: AppColors.lightOnSurface,
    borderRadius: BorderRadius.circular(8),
  ),
  textStyle: const TextStyle(color: Colors.white),
);

final NavigationBarThemeData _lightNavigationBarTheme = NavigationBarThemeData(
  backgroundColor: AppColors.lightSurface,
  labelTextStyle: WidgetStateProperty.resolveWith((states) {
    if (states.contains(WidgetState.selected)) {
      return const TextStyle(fontWeight: FontWeight.bold);
    }
    return null;
  }),
  indicatorColor: AppColors.primary.withOpacity(0.1),
  height: 64,
);

final DrawerThemeData _lightDrawerTheme = DrawerThemeData(
  backgroundColor: AppColors.lightSurface,
  elevation: 8,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
);

final ExpansionTileThemeData _lightExpansionTileTheme = ExpansionTileThemeData(
  iconColor: AppColors.primary,
  collapsedIconColor: AppColors.lightOnSurface.withOpacity(0.6),
  backgroundColor: AppColors.lightSurface,
);

// Dark theme configurations (differences from light theme)
const AppBarTheme _darkAppBarTheme = AppBarTheme(
  backgroundColor: AppColors.darkSurface,
  foregroundColor: AppColors.darkOnSurface,
  elevation: 0,
  titleTextStyle: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.darkOnSurface,
  ),
);

const TextTheme _darkTextTheme = TextTheme(
  displayLarge: TextStyle(color: AppColors.darkOnSurface),
  displayMedium: TextStyle(color: AppColors.darkOnSurface),
  displaySmall: TextStyle(color: AppColors.darkOnSurface),
  headlineMedium: TextStyle(color: AppColors.darkOnSurface),
  headlineSmall: TextStyle(color: AppColors.darkOnSurface),
  titleLarge: TextStyle(color: AppColors.darkOnSurface),
  titleMedium: TextStyle(color: AppColors.darkOnSurface),
  titleSmall: TextStyle(color: AppColors.darkOnSurface),
  bodyLarge: TextStyle(color: AppColors.darkOnSurface),
  bodyMedium: TextStyle(color: AppColors.darkOnSurface),
  bodySmall: TextStyle(color: AppColors.darkOnSurface),
  labelLarge: TextStyle(color: AppColors.darkOnSurface),
  labelMedium: TextStyle(color: AppColors.darkOnSurface),
  labelSmall: TextStyle(color: AppColors.darkOnSurface),
);

final ColorScheme _darkColorScheme = ColorScheme.dark(
  primary: AppColors.primary,
  primaryContainer: AppColors.primary.withOpacity(0.2),
  onPrimary: AppColors.darkOnPrimary,
  secondary: AppColors.secondary,
  onSecondary: AppColors.darkOnPrimary,
  error: AppColors.error,
  onError: AppColors.onError,
  background: AppColors.darkBackground,
  onBackground: AppColors.darkOnSurface,
  surface: AppColors.darkSurface,
  onSurface: AppColors.darkOnSurface,
  outline: AppColors.darkDivider,
  onSurfaceVariant: AppColors.darkOnSurface.withOpacity(0.7),
  shadow: Colors.black,
);

final InputDecorationTheme _darkInputDecorationTheme = InputDecorationTheme(
  filled: true,
  fillColor: AppColors.darkSurface,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: const BorderSide(color: AppColors.darkDivider),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: const BorderSide(color: AppColors.darkDivider),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: const BorderSide(color: AppColors.primary, width: 2),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: const BorderSide(color: AppColors.error),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: const BorderSide(color: AppColors.error, width: 2),
  ),
  hintStyle: TextStyle(color: AppColors.darkOnSurface.withOpacity(0.5)),
  labelStyle: TextStyle(color: AppColors.darkOnSurface.withOpacity(0.7)),
);

final ElevatedButtonThemeData _darkElevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    backgroundColor: AppColors.primary,
    foregroundColor: AppColors.darkOnPrimary,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    elevation: 4,
    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
    textStyle: const TextStyle(fontWeight: FontWeight.bold),
  ),
);

final OutlinedButtonThemeData _darkOutlinedButtonTheme = OutlinedButtonThemeData(
  style: OutlinedButton.styleFrom(
    foregroundColor: AppColors.primary,
    side: const BorderSide(color: AppColors.primary),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
  ),
);

final TextButtonThemeData _darkTextButtonTheme = TextButtonThemeData(
  style: TextButton.styleFrom(
    foregroundColor: AppColors.primary,
    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
  ),
);

final IconButtonThemeData _darkIconButtonTheme = IconButtonThemeData(
  style: IconButton.styleFrom(
    foregroundColor: AppColors.darkOnSurface,
    backgroundColor: AppColors.darkSurface,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  ),
);

final FloatingActionButtonThemeData _darkFloatingActionButtonTheme = FloatingActionButtonThemeData(
  backgroundColor: AppColors.primary,
  foregroundColor: AppColors.darkOnPrimary,
  elevation: 6,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
);

final CardTheme _darkCardTheme = CardTheme(
  color: AppColors.darkSurface,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  elevation: 4,
  margin: const EdgeInsets.all(8),
);

final DialogTheme _darkDialogTheme = DialogTheme(
  backgroundColor: AppColors.darkSurface,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  elevation: 12,
);

const BottomSheetThemeData _darkBottomSheetTheme = BottomSheetThemeData(
  backgroundColor: AppColors.darkSurface,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
  ),
  elevation: 12,
);

final SnackBarThemeData _darkSnackBarTheme = SnackBarThemeData(
  backgroundColor: AppColors.darkSurface,
  contentTextStyle: const TextStyle(color: AppColors.darkOnSurface),
  actionTextColor: AppColors.primary,
  elevation: 6,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
);

const ListTileThemeData _darkListTileTheme = ListTileThemeData(
  tileColor: AppColors.darkSurface,
  iconColor: AppColors.primary,
  textColor: AppColors.darkOnSurface,
  horizontalTitleGap: 16,
  minVerticalPadding: 8,
);

final SwitchThemeData _darkSwitchTheme = SwitchThemeData(
  thumbColor: MaterialStateProperty.resolveWith((states) {
    if (states.contains(MaterialState.selected)) {
      return AppColors.darkOnPrimary;
    }
    return AppColors.darkOnSurface.withOpacity(0.5);
  }),
  trackColor: MaterialStateProperty.resolveWith((states) {
    if (states.contains(MaterialState.selected)) {
      return AppColors.primary.withOpacity(0.5);
    }
    return AppColors.darkDivider;
  }),
);

final SliderThemeData _darkSliderTheme = SliderThemeData(
  activeTrackColor: AppColors.primary,
  inactiveTrackColor: AppColors.darkDivider,
  thumbColor: AppColors.primary,
  overlayColor: AppColors.primary.withOpacity(0.2),
  valueIndicatorColor: AppColors.primary,
);

final TabBarTheme _darkTabBarTheme = TabBarTheme(
  labelColor: AppColors.primary,
  unselectedLabelColor: AppColors.darkOnSurface.withOpacity(0.7),
  indicatorColor: AppColors.primary,
  indicatorSize: TabBarIndicatorSize.tab,
  dividerColor: Colors.transparent,
);

final ChipThemeData _darkChipTheme = ChipThemeData(
  backgroundColor: AppColors.primary.withOpacity(0.2),
  selectedColor: AppColors.primary.withOpacity(0.3),
  checkmarkColor: AppColors.primary,
  labelStyle: const TextStyle(color: AppColors.primary),
  secondaryLabelStyle: const TextStyle(color: AppColors.secondary),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
);

const ProgressIndicatorThemeData _darkProgressIndicatorTheme = ProgressIndicatorThemeData(
  color: AppColors.primary,
  circularTrackColor: AppColors.darkDivider,
  linearTrackColor: AppColors.darkDivider,
);

final PopupMenuThemeData _darkPopupMenuTheme = PopupMenuThemeData(
  color: AppColors.darkSurface,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  elevation: 12,
);

final TooltipThemeData _darkTooltipTheme = TooltipThemeData(
  decoration: BoxDecoration(
    color: AppColors.darkOnSurface,
    borderRadius: BorderRadius.circular(8),
  ),
  textStyle: const TextStyle(color: Colors.black),
);

final NavigationBarThemeData _darkNavigationBarTheme = NavigationBarThemeData(
  backgroundColor: AppColors.darkSurface,
  labelTextStyle: MaterialStateProperty.resolveWith((states) {
    if (states.contains(MaterialState.selected)) {
      return const TextStyle(fontWeight: FontWeight.bold);
    }
    return null;
  }),
  indicatorColor: AppColors.primary.withOpacity(0.2),
  height: 64,
);

final DrawerThemeData _darkDrawerTheme = DrawerThemeData(
  backgroundColor: AppColors.darkSurface,
  elevation: 12,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
);

final ExpansionTileThemeData _darkExpansionTileTheme = ExpansionTileThemeData(
  iconColor: AppColors.primary,
  collapsedIconColor: AppColors.darkOnSurface.withOpacity(0.7),
  backgroundColor: AppColors.darkSurface,
);