import 'package:anaglyph_test/ui/general_page.dart';
import 'package:flutter/material.dart';

class AnaglyphTestApp extends StatelessWidget {
  const AnaglyphTestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
