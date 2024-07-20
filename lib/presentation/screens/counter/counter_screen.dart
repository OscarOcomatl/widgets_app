import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/screens/providers/counter_provider.dart';
import 'package:widgets_app/presentation/screens/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget { //Riverpod clase 
  const CounterScreen({super.key});

  static const String name = 'counter_screen';

  @override
  Widget build(BuildContext context, WidgetRef ref) { // Recine el WidgetRef
  
  final int clickCounter = ref.watch(counterProvider);
  final bool isDarkMode = ref.watch(themeProvider);
  
  return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
        actions: [
          IconButton(
            icon:Icon(isDarkMode ? Icons.dark_mode_outlined : Icons.light_mode_outlined),
            onPressed: (){
              ref.read(themeProvider.notifier).update((isDarkMode) => !isDarkMode);
            } 
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Contador', style: Theme.of(context).textTheme.titleLarge),
            Text('$clickCounter', style: Theme.of(context).textTheme.titleMedium)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          // ref.read(counterProvider.notifier).update((state) => state + 1);
          ref.read(counterProvider.notifier).state++;
        },
        child: const Icon(Icons.plus_one),
      ),
    );
  }
}