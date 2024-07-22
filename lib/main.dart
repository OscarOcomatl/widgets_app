import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/router/app_router.dart';
import 'package:widgets_app/config/theme/app_theme.dart';
import 'package:widgets_app/presentation/screens/providers/theme_provider.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MainApp()
    )
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, ref) {

    final bool isDarkMode = ref.watch(themeProvider);
    final int selectedColor = ref.watch(selectedColorProvider);

    return MaterialApp.router(
      title: 'Flutter Widgets',
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: selectedColor, isDarkMode: isDarkMode).getTheme(),
      routerConfig: appRouter,
      // home: const HomeScreen(),
      // routes: {
      //   '/buttons' : (context) => const ButtonsScreen(),
      //   '/cards'   : (context) => const CardsScreen()
      // },
    );
  }
}
