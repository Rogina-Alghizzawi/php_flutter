// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:transactionapp/Dashboard/dashboard.dart';
// import 'package:transactionapp/auth/signup.dart';
// import 'package:transactionapp/componant/Customtextform.dart';

// class Login extends StatefulWidget {
//   const Login({Key? key}) : super(key: key);

//   @override
//   _LoginState createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   TextEditingController usernameController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   List<SignStyle> signStyleWidgets = [];

//   @override
//   void initState() {
//     super.initState();
//     signStyleWidgets = [
//       SignStyle(
//         hint: "username",
//         myController: usernameController,
//         obscureText: false,
//       ),
//       SignStyle(
//         hint: "password",
//         myController: passwordController,
//         obscureText: true,
//       ),
//     ];
//   }

//   Future<void> loginUser() async {
//     final String apiUrl = 'http://localhost/graduation/pages/login.php';

//     try {
//       if (!_validateForm()) {
//         return;
//       }

//       var data = {
//         "username": usernameController.text,
//         "password": passwordController.text,
//       };

//       final response = await http.post(Uri.parse(apiUrl), body: data);

//       print('Response status: ${response.statusCode}');
//       print('Response body: ${response.body}');

//       if (response.statusCode == 200) {
//         var responseData = json.decode(response.body);
//         if (responseData["status"] == "success") {
//           // Store user information in shared preferences
//           SharedPreferences prefs = await SharedPreferences.getInstance();
//           prefs.setString('username', responseData["user"]["username"]);
//           prefs.setString('password', responseData["user"]["password"]);

//           final newBalance = responseData["user"]["newbalance"];

//           if (newBalance is int) {
//             prefs.setDouble('newbalance', newBalance.toDouble());
//           } else if (newBalance is double) {
//             prefs.setDouble('newbalance', newBalance);
//           } else {
//             print("Error: Failed to parse 'newbalance' as int or double.");
//           }

//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => Dashboard()),
//           );

//           // Example: Fetch additional data after successful login
//           // You can call your fetchData function here if needed
//         } else {
//           // Login failed, show an error message or handle accordingly
//           print("Error: ${responseData["message"]}");
//         }
//       } else {
//         // Server returned an error
//         print('Error: Server returned an error.');
//       }
//     } catch (e) {
//       // Handle other exceptions
//       print('Error: $e');
//     }
//   }

//   bool _validateForm() {
//     return _validateUsername() && _validatePassword();
//   }

//   bool _validateUsername() {
//     if (usernameController.text.isEmpty) {
//       _showError('username', 'Username is required.');
//       return false;
//     }

//     RegExp usernameRegex = RegExp(r'^[a-zA-Z0-9_]+$');
//     if (!usernameRegex.hasMatch(usernameController.text)) {
//       _showError('username', 'Invalid username format.');
//       return false;
//     }

//     return true;
//   }

//   bool _validatePassword() {
//     if (passwordController.text.length < 6) {
//       _showError('password', 'Password must be at least 6 characters.');
//       return false;
//     }
//     return true;
//   }

//   void _showError(String field, String errorMessage) {
//     switch (field) {
//       case "username":
//         setState(() {
//           signStyleWidgets[0].errorMessage = errorMessage;
//         });
//         break;
//       case "password":
//         setState(() {
//           signStyleWidgets[1].errorMessage = errorMessage;
//         });
//         break;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         padding: EdgeInsets.all(20),
//         child: ListView(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Center(
//                 child: Form(
//                   child: Column(
//                     children: [
//                       Container(
//                         margin: EdgeInsets.all(20),
//                         child: const Text(
//                           'LogIn',
//                           style: TextStyle(
//                             fontSize: 30,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black,
//                           ),
//                         ),
//                       ),
//                       for (var widget in signStyleWidgets)
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             widget,
//                             SizedBox(height: 10),
//                             Text(
//                               widget.errorMessage ?? "",
//                               style: TextStyle(color: Colors.red),
//                             ),
//                           ],
//                         ),
//                       MaterialButton(
//                         color: Colors.blue,
//                         textColor: Colors.white,
//                         padding:
//                             EdgeInsets.symmetric(horizontal: 30, vertical: 10),
//                         onPressed: () async {
//                           await loginUser();
//                         },
//                         child: Text("LogIn"),
//                       ),
//                       SizedBox(height: 10),
// InkWell(
//   onTap: () {
//     Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (context) => Signup(),
//       ),
//     );
//   },
// child: Text(
//   "Sign Up",
//   style: TextStyle(
//     color: Colors.blue,
//     decoration: TextDecoration.underline,
//   ),
// ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// Updated login.dart with restyled elements

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transactionapp/Dashboard/dashboard.dart';
import 'package:transactionapp/auth/signup.dart';
import 'package:transactionapp/componant/Customtextform.dart'; // Importing Customtextform

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  List<SignStyle> signStyleWidgets = [];
  String? usernameError;
  String? passwordError;

  void _showError(String field, String errorMessage) {
    setState(() {
      if (field == "username") {
        usernameError = errorMessage;
      } else if (field == "password") {
        passwordError = errorMessage;
      }
    });
  }

  @override
  void initState() {
    super.initState();
  }

  Future<void> loginUser() async {
    final String apiUrl = 'http://localhost/graduation/pages/login.php';

    try {
      if (!_validateForm()) {
        return;
      }

      var data = {
        "username": usernameController.text,
        "password": passwordController.text,
      };

      final response = await http.post(Uri.parse(apiUrl), body: data);

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        if (responseData["status"] == "success") {
          // Store user information in shared preferences
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('username', responseData["user"]["username"]);
          prefs.setString('password', responseData["user"]["password"]);

          final newBalance = responseData["user"]["newbalance"];

          if (newBalance is int) {
            prefs.setDouble('newbalance', newBalance.toDouble());
          } else if (newBalance is double) {
            prefs.setDouble('newbalance', newBalance);
          } else {
            print("Error: Failed to parse 'newbalance' as int or double.");
          }

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Dashboard()),
          );

          // Example: Fetch additional data after successful login
          // You can call your fetchData function here if needed
        } else {
          // Login failed, show an error message or handle accordingly
          print("Error: ${responseData["message"]}");
        }
      } else {
        // Server returned an error
        print('Error: Server returned an error.');
      }
    } catch (e) {
      // Handle other exceptions
      print('Error: $e');
    }
  }

  bool _validateForm() {
    return _validateUsername() && _validatePassword();
  }

  bool _validateUsername() {
    if (usernameController.text.isEmpty) {
      _showError('username', 'Username is required.');
      return false;
    }

    RegExp usernameRegex = RegExp(r'^[a-zA-Z0-9_]+$');
    if (!usernameRegex.hasMatch(usernameController.text)) {
      _showError('username', 'Invalid username format.');
      return false;
    }

    return true;
  }

  bool _validatePassword() {
    if (passwordController.text.length < 6) {
      _showError('password', 'Password must be at least 6 characters.');
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // To ensure responsiveness
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Logo or Image can be placed here
              SizedBox(height: 20),
              Text('Login',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold)), // Updated font styling
              SizedBox(height: 20),
              // Use SignStyle for text fields
              SignStyle(
                hint: 'Username',
                myController: usernameController,
                obscureText: false,
                errorMessage: usernameError,
              ),
              SizedBox(height: 10),
              SignStyle(
                hint: 'Password',
                myController: passwordController,
                obscureText: true,
                errorMessage: passwordError,
              ),
              // Rest of the existing code...

              // Button Styling
              ElevatedButton(
                onPressed: () async {
                  await loginUser();
                },
                child: Text('Login'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Button color
                  foregroundColor: Colors.white, // Text color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Signup(),
                    ),
                  );
                },
                child: Text("Don't have an account? Sign up"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
