import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widgets/config/theme/app_theme.dart';

//Variable para cambiar el icono del tema usando RiverPod
final isDarkModeProvider = StateProvider((ref) => false);

//Listado de colores que no va a cambiar
final colorListProvider = Provider((ref) => colorList);

//variable para cambiar el color seleccionado para los temas darkMode
final selectedColorProvider = StateProvider((ref) => 0);

//Manera mas eficiente de cambiar el tema usando RiverPod
//Creamos un objeto customizado de tipo AppTheme que se llama themeNotifierProvider el cual es una clase de
// StateNotifierProvider, esta maneja 2 elementos, 1 el que controla el estado (ThemeNotifier) y el otro
// (AppTheme) que es la clase personalizada del StateNotifierProvider
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  //definimos en la referencia el ThemeNotifier para que sea aceptado los cambios del estado de StateNotifierProvider
  (ref) => ThemeNotifier(),
);

class ThemeNotifier extends StateNotifier<AppTheme> {
  //STATE = Estado = new AppTheme() en donde podremos crear una nueva instancia y podremos tener acceso
  //a todo lo que hay dentro de AppTheme()
  ThemeNotifier() : super(AppTheme());

  void toggleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColorIndex(int colorIndex) {
    state = state.copyWith(selectedColor: colorIndex);
  }
}
