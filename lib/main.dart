import 'package:flutter/foundation.dart'
    show debugDefaultTargetPlatformOverride;
import 'package:flutter/material.dart';
import 'package:pokedex_flutter/views/home_page.dart';

void main() {
  // See https://github.com/flutter/flutter/wiki/Desktop-shells#target-platform-override
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  runApp(new App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex Flutter',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: HomePage(title: 'Pokedex Flutter '),
      debugShowCheckedModeBanner: false,
    );
  }
}
