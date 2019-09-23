import 'package:flutter/material.dart';
import 'package:pokedex_flutter/views/home_page.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: HomePage(title: 'Pokedex Flutter '),
      debugShowCheckedModeBanner: false,
    );
  }
}
