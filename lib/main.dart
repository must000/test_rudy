import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_rudy/loginpage.dart';
import 'package:test_rudy/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: ((context) => HomeProvider()))],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:const LoginPage(),
    );
  }
}
