import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../config/theme/app_theme.dart';

// state colorsscheme theme global
final colorListProvider = StateProvider((ref) => colorList);

// isDarkMode
final isDarkModeProvider = StateProvider((ref) => false);

final selectedColorProvider = StateProvider((ref) => 0);
