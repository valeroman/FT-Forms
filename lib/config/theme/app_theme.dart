

import 'package:flutter/material.dart';

class AppTheme {

  ThemeData getTheme() {

    const seedColor = Colors.deepPurple;

    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: seedColor,
      // * Asociar el color del seedColor al listTileTheme
      // * Le coloca el color del seedColor al icono
      listTileTheme: const ListTileThemeData(
        iconColor: seedColor
      )
    );
  }

}