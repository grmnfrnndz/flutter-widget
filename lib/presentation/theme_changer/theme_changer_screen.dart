import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {

  static const name = 'theme_change_screen';

  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    // final isDarkMode = ref.watch(isDarkModeProvider);
    final isDarkMode = ref.watch(themeNotiferProvider).isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: const Text('ThemeChangeScreen'),
        centerTitle: true,
        actions: [
           IconButton(
            onPressed: () {
              // ref.read(isDarkModeProvider.notifier).update((state) => !state);
              ref.read(themeNotiferProvider.notifier).toggleDarkMode();

            }, 
            icon: Icon(isDarkMode ? Icons.dark_mode_outlined : Icons.light_mode_outlined)
          )
        ],
      ),
      body: _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final List<Color> colors = ref.watch(colorListProvider);
    // final int selectedColor = ref.watch(selectedColorProvider);
    final int selectedColor = ref.watch(themeNotiferProvider).selectedColor;

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final Color color = colors[index];

        return RadioListTile(
          title: Text('This Color', style: TextStyle(color: color),),
          subtitle: Text('Color: ${color.value}'),
          activeColor: color,
          value: index, 
          groupValue: selectedColor, 
          onChanged: (value) {
            if (value == null) return;

            // ref.read(selectedColorProvider.notifier).update((state) => value);
            ref.read(themeNotiferProvider.notifier).changeColorIndex(value);

          });
      },
    );
  }
}