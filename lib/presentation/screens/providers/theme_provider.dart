import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';


// Listado de colores inmutables (nunca va a cambiar)
final colorListProvider = Provider((ref) => colors);

// Un simple boolean
final themeProvider = StateProvider<bool>((ref) => false);

// Un simple boolean
final selectedColorProvider = StateProvider((ref) => 0);