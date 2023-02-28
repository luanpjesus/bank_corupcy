import 'package:flutter/material.dart';

import 'Moedas_base.dart';

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
