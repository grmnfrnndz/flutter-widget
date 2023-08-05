import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../config/theme/app_theme.dart';

// state colorsscheme theme global
final colorListProvider = StateProvider((ref) => colorList);

// isDarkMode
final isDarkModeProvider = StateProvider((ref) => false);

// color selected
final selectedColorProvider = StateProvider((ref) => 0);


// object custom AppTheme
final themeNotiferProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier(),
  );


// controller or notifier
class ThemeNotifier extends StateNotifier<AppTheme> {
  
  // state = state = new AppTheme();
  ThemeNotifier(): super(AppTheme());


  void toggleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColorIndex(int colorIndex) {
    state = state.copyWith(selectedColor: colorIndex);
  }

}