import 'package:flutter/material.dart';
import 'package:ordenation_mark/pages/home_page.dart';
import 'package:ordenation_mark/shared/providers/comparing_table_provider.dart';
import 'package:ordenation_mark/shared/providers/method_selection.dart';
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
        ),
        ChangeNotifierProvider<MethodSelection>(
          create: (context) => MethodSelection(),
        ),
        ChangeNotifierProvider<ComparingTableProvider>(
          create: (context) => ComparingTableProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: const TextTheme(
              bodyText1: TextStyle(
                color: Colors.white,
              ),
              bodyText2: TextStyle(
                color: Colors.white,
              )),
        ),
        home: const Home(),
      ),
    );
  }
}
