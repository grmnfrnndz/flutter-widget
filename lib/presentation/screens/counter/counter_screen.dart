import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/counter_provider.dart';
import '../../providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {

  static const String name = 'counter_screen';

  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final titleLarge = Theme.of(context).textTheme.titleLarge;
    final int counter = ref.watch(counterProvider);
    final bool isDarkMode = ref.watch(isDarkModeProvider);


    return Scaffold(
      appBar: AppBar(
        title: const Text('CounterScreen'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              ref.read(isDarkModeProvider.notifier).update((state) => !state);
            }, 
            icon: Icon(isDarkMode ? Icons.dark_mode_outlined : Icons.light_mode_outlined)
          )
        ],
      ),
      body: Center(
        child: Text('Counter: $counter', style: titleLarge),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 1 mode
          ref.read(counterProvider.notifier).state++;

          // 2 mode
          // ref.read(counterProvider.notifier).update((state) => state +1);
        },
        child: const Icon(Icons.plus_one_outlined),
      ),
    );
  }
}