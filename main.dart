import 'package:flutter/material.dart';
import 'package:transactionapp/Dashboard/dashboard.dart';
import 'package:transactionapp/Screens/Transaction.dart';
import 'package:transactionapp/auth/login.dart';
import 'package:transactionapp/auth/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transactionapp/pages/report.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SharedPreferences.getInstance();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({superkey});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Transaction app',
      initialRoute: "/login",
      routes: {
        "/Report": (context) => Report(),
        "/login": (context) => Login(),
        "/signup": (context) => Signup(),
        "/Transaction": (context) => Transaction(),
        "/Dashboard": (context) => Dashboard()
      },
    );
  }
}
