import 'package:flutter/material.dart';
// Asegúrate de importar el modelo del carrito
import 'package:p1_donut_app_daniel_rodriguez/car_model.dart';
import 'package:p1_donut_app_daniel_rodriguez/pages/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartModel()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData( 
        tabBarTheme: const TabBarTheme(indicatorColor: Colors.pink)),
    );
  }
}