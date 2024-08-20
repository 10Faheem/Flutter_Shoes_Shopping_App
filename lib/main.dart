import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/data_provider.dart';
import 'package:shop_app/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DataProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 73, 191, 238)),
          primaryColor: const Color.fromARGB(255, 73, 191, 238),
          fontFamily: 'Lato',
          inputDecorationTheme: const InputDecorationTheme(
            hintStyle: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 17,
              fontFamily: 'Lato',
            ),
            prefixIconColor: Color.fromRGBO(119, 119, 119, 1),
          ),
          textTheme: const TextTheme(
            titleLarge: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 40,
            ),
            titleMedium: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Lato',
            ),
            titleSmall:
                TextStyle(fontFamily: 'Lato', fontWeight: FontWeight.bold),
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromARGB(255, 226, 246, 252),
            foregroundColor: Colors.black,
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w600,
              fontFamily: 'Lato',
            ),
          ),
        ),
        home: const HomePage(),
      ),
    );
  }
}

