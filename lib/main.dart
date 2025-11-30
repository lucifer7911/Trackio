import 'package:flutter/material.dart';
import 'package:expense_create/widgets/expenses.dart';

final kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 28, 9, 201),
  brightness: Brightness.dark,
);

final kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 4, 34, 58),
);

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,

      darkTheme: ThemeData.dark().copyWith(
        // ignore: deprecated_member_use
        useMaterial3: true,
        colorScheme: kDarkColorScheme,
        cardTheme: CardThemeData(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
      ),

      theme: ThemeData().copyWith(
        // ignore: deprecated_member_use
        useMaterial3: true,
        colorScheme: kColorScheme,

        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
            foregroundColor: kDarkColorScheme.onPrimaryContainer,
          ),
        ),

        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
            fontWeight: FontWeight.w500,
            color: kColorScheme.onSecondaryContainer,
            fontSize: 16,
          ),
        ),
      ),

      home: const Expenses(),
    ),
  );
}
