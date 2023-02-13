import 'package:bioanalise_app/controllers/cadastro.dart';
import 'package:bioanalise_app/controllers/login.dart';
import 'package:bioanalise_app/views/foto.dart';
import 'package:bioanalise_app/views/home/home.dart';
import 'package:bioanalise_app/views/photo_library.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bioanálise',
      theme: ThemeData(
        primaryColor: Colors.blue,
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          elevation: 0
        ),
      ),

      debugShowCheckedModeBanner: false,

      initialRoute: '/',
      
      routes: {
        '/' :(context) => Login(),
        '/home' :(context) => Home(),
        '/fotos' :(context) => Fotos(),
        '/cadastro':(context) => Cadastro(),
        //'/gallery' :(context) => Galeria(),
        '/library' :(context) => Library()
      }
    );
  }
}