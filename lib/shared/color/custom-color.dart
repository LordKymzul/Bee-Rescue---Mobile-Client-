import 'package:flutter/material.dart';

/// Extension on BuildContext to provide easy access to ColorScheme properties.
extension ColorSchemeExtension on BuildContext {
  Color get backgroundColor => Theme.of(this).colorScheme.background;
  Color get onBackgroundColor => Theme.of(this).colorScheme.onBackground;
  Color get primaryColor => Theme.of(this).colorScheme.primary;
  Color get onPrimaryColor => Theme.of(this).colorScheme.onPrimary;
  Color get surfaceColor => Theme.of(this).colorScheme.surface;
  Color get onSurfaceColor => Theme.of(this).colorScheme.onSurface;
  Color get secondaryColor => Theme.of(this).colorScheme.secondary;
  Color get onSecondaryColor => Theme.of(this).colorScheme.onSecondary;
  Color get errorColor => Theme.of(this).colorScheme.error;
  Color get onErrorColor => Theme.of(this).colorScheme.onError;
  Color get primaryVariantColor => Theme.of(this).colorScheme.primaryVariant;
  Color get secondaryVariantColor =>
      Theme.of(this).colorScheme.secondaryVariant;
  Color get blueColor => const Color(0xFF0066FF);
  Color get greenColor => const Color(0xFF319F43);
  Color get orangeColor => const Color(0xFFFF7A00);
  Color get maroonColor => const Color(0xFF9F313E);
  Color get greyColor => const Color(0xFFCACACA);
  Color get redColor => Colors.red;
}

class CustomColor {
  static ColorScheme getLightColorScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      background: Color(0xFFFBFBFB),
      onBackground: Color(0xFF121212),
      primary: Color(0xFFFFC300),
      onPrimary: Color(0xFFFBFBFB),
      surface: Colors.white,
      onSurface: Color(0xFF121212),
      secondary: Colors.blue, // You can customize this as needed
      onSecondary: Colors.white, // You can customize this as needed
      error: Colors.red, // You can customize this as needed
      onError: Colors.white, // You can customize this as needed
      primaryVariant: Color(0xFFB28900), // You can customize this as needed
      secondaryVariant: Colors.blueGrey, // You can customize this as needed
    );
  }

  static ColorScheme getDarkColorScheme() {
    return ColorScheme(
      brightness: Brightness.dark,
      background: const Color(0xFF121212),
      onBackground: const Color(0xFFFBFBFB),
      primary: const Color(0xFFFFC300),
      onPrimary: const Color(0xFFFBFBFB),
      surface: Colors.grey[850]!,
      onSurface: const Color(0xFFFBFBFB),
      secondary: Colors.blue[700]!,
      onSecondary: const Color(0xFFFBFBFB),
      error: const Color(0xFFCF6679),
      onError: const Color(0xFFFBFBFB),
      primaryVariant: const Color(0xFFFFA000),
      secondaryVariant: Colors.blueGrey[700]!,
    );
  }
}
