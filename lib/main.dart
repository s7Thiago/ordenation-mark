import 'package:flutter/material.dart';
import 'package:ordenation_mark/pages/home_page.dart';
import 'package:ordenation_mark/shared/providers/navigation.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const OrdenationMarkApp());
}

class OrdenationMarkApp extends StatelessWidget {
  const OrdenationMarkApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NavigationProvider>(
          create: (context) => NavigationProvider(),
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );
  }
}
