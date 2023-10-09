import 'package:flutter/material.dart';
import 'package:flutter_widgets/config/router/app_router.dart';
import 'package:flutter_widgets/config/theme/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widgets/presentation/providers/theme_provider.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    // final isDarkMode = ref.watch(isDarkModeProvider);
    // final selectedColor = ref.watch(selectedColorProvider);
    final AppTheme apptheme = ref.watch(themeNotifierProvider);

    return MaterialApp.router(
      darkTheme: ThemeData.dark(),
      title: 'Flutter Widgets',
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: apptheme.getTheme(),
    );
  }
}
