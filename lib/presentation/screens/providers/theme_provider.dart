import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';


// Listado de colores inmutables (nunca va a cambiar)
final colorListProvider = Provider((ref) => colors);

// Un simple boolean
final themeProvider = StateProvider<bool>((ref) => false);

// Un simple boolean
final selectedColorProvider = StateProvider((ref) => 0);



// Un objeto de tipo AppTheme (custom)
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier()
);

// Controller o Notifier
class ThemeNotifier extends StateNotifier<AppTheme> {
  // ThemeNotifier(super.state);

  // STATE = Estado = new AppTheme();
  ThemeNotifier() : super(AppTheme());

  void toggleDarkMode(){
    state = state.copyWith( isDarkmode: !state.isDarkmode );
  }

  void changeIndexColor( int indexColor ){
    state = state.copyWith(selectedColor: indexColor);
  }

}