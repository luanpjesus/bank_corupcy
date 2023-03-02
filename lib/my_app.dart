import 'package:bank_corrupcy/pages/moedas_base.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Moedasbase",
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const MoedasPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
