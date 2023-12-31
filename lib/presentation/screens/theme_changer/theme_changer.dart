import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widgets/config/theme/app_theme.dart';
import 'package:flutter_widgets/presentation/providers/theme_provider.dart';

class ThemeChangeScreen extends ConsumerWidget {
  static const name = 'theme-changer';

  const ThemeChangeScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    // definimos isDarkMode para ver el estado actual del provider, en este caso si es true o false
    final isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Theme'),
        actions: [
          IconButton(
              onPressed: () {
                // ref.read(isDarkModeProvider.notifier).update((state) => !state);
                ref.read(themeNotifierProvider.notifier).toggleDarkMode();
              },
              icon: Icon(isDarkMode
                  ? Icons.light_mode_outlined
                  : Icons.dark_mode_outlined))
        ],
      ),
      body: const _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    final List<Color> colors = ref.watch(colorListProvider);
    // final int selectedColor = ref.watch(selectedColorProvider);
    final selectedColor = ref.watch(themeNotifierProvider).selectedColor;

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final Color color = colors[index];
        return RadioListTile(
            title: Text('Este Color', style: TextStyle(color: color)),
            subtitle: Text('${color.value}'),
            activeColor: color,
            value: index,
            groupValue: selectedColor,
            onChanged: (value) {
              // TODO: Modificar el cambio
              ref.read(themeNotifierProvider.notifier).changeColorIndex(index);
            });
      },
    );
  }
}
