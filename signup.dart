// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:transactionapp/auth/login.dart';
// import 'package:transactionapp/componant/Customtextform.dart';
// import 'package:http/http.dart' as http;

// class Signup extends StatefulWidget {
//   const Signup({Key? key}) : super(key: key);

//   @override
//   _SignupState createState() => _SignupState();
// }

// class _SignupState extends State<Signup> {
//   TextEditingController usernameController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   TextEditingController phoneNumberController = TextEditingController();

//   List<SignStyle> signstyleWidgets = [];

//   @override
//   void initState() {
//     super.initState();
//     signstyleWidgets = [
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
//       SignStyle(
//         hint: "phonenumber",
//         myController: phoneNumberController,
//         obscureText: false,
//       ),
//     ];
//   }

//   Future<void> signUp() async {
//     final String phpUrl = 'http://localhost/graduation/pages/signup.php';

//     try {
//       if (!_validateForm()) {
//         return;
//       }

//       var data = {
//         "username": usernameController.text,
//         "password": passwordController.text,
//         "phonenumber": phoneNumberController.text,
//       };

//       final response = await http.post(Uri.parse(phpUrl), body: data);

//       print('Response status: ${response.statusCode}');
//       print('Response body: ${response.body}');

//       if (response.statusCode == 200) {
//         var responseData = json.decode(response.body);
//         if (responseData["status"] == "fail") {
//           if (responseData.containsKey("errorFields")) {
//             for (var field in responseData["errorFields"]) {
//               _showError(field, 'Error: Required fields are missing or empty.');
//             }
//           }
//         } else if (responseData["status"] == "success") {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => const Login()),
//           );
//           print("Success: Signed up successfully!");
//         }
//       } else {
//         print('Error: Server returned an error.');
//       }
//     } catch (e) {
//       print('Error: $e');
//     }
//   }

//   bool _validateForm() {
//     return _validateUsername() && _validatePassword() && _validatePhoneNumber();
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

//   bool _validatePhoneNumber() {
//     RegExp phoneNumberRegex = RegExp(r'^[0-9]+$');

//     if (phoneNumberController.text.isEmpty) {
//       _showError('phonenumber', 'Phone number is required.');
//       return false;
//     } else if (!phoneNumberRegex.hasMatch(phoneNumberController.text)) {
//       _showError('phonenumber', 'Invalid phone number format.');
//       return false;
//     }

//     return true;
//   }

//   void _showError(String field, String errorMessage) {
//     switch (field) {
//       case "username":
//         setState(() {
//           signstyleWidgets[0].errorMessage = errorMessage;
//         });
//         break;
//       case "password":
//         setState(() {
//           signstyleWidgets[1].errorMessage = errorMessage;
//         });
//         break;
//       case "phonenumber":
//         setState(() {
//           signstyleWidgets[2].errorMessage = errorMessage;
//         });
//         break;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final GlobalKey<FormState> formState = GlobalKey();

//     return Scaffold(
//       body: Container(
//         padding: EdgeInsets.all(20),
//         child: ListView(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Center(
//                 child: Form(
//                   key: formState,
//                   child: Column(
//                     children: [
//                       Container(
//                         margin: EdgeInsets.all(20),
//                         child: const Text(
//                           'Sign Up',
//                           style: TextStyle(
//                             fontSize: 30,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black,
//                           ),
//                         ),
//                       ),
//                       for (var widget in signstyleWidgets) widget,
//                       MaterialButton(
//                         color: Colors.blue,
//                         textColor: Colors.white,
//                         padding:
//                             EdgeInsets.symmetric(horizontal: 30, vertical: 10),
//                         onPressed: () async {
//                           await signUp();
//                         },
//                         child: Text("Sign Up"),
//                       ),
//                       SizedBox(height: 20),
//                       InkWell(
//                         onTap: () {
//                           Navigator.of(context).pop();
//                         },
//                         child: Text(
//                           "Already have an account? Log in",
//                           style: TextStyle(
//                             color: Colors.blue,
//                             decoration: TextDecoration.underline,
//                           ),
//                         ),
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

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:transactionapp/auth/login.dart';
import 'package:transactionapp/componant/Customtextform.dart'; // Importing Customtextform
import 'package:http/http.dart' as http;

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  String? usernameError;
  String? passwordError;
  String? phoneNumberError;

  List<SignStyle> signstyleWidgets = [];
  void initState() {
    super.initState();
  }

  Future<void> signUp() async {
    final String phpUrl = 'http://localhost/graduation/pages/signup.php';

    try {
      if (!_validateForm()) {
        return;
      }

      var data = {
        "username": usernameController.text,
        "password": passwordController.text,
        "phonenumber": phoneNumberController.text,
      };

      final response = await http.post(Uri.parse(phpUrl), body: data);

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        if (responseData["status"] == "fail") {
          if (responseData.containsKey("errorFields")) {
            for (var field in responseData["errorFields"]) {
              _showError(field, 'Error: Required fields are missing or empty.');
            }
          }
        } else if (responseData["status"] == "success") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Login()),
          );
          print("Success: Signed up successfully!");
        }
      } else {
        print('Error: Server returned an error.');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  bool _validateForm() {
    return _validateUsername() && _validatePassword() && _validatePhoneNumber();
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

  bool _validatePhoneNumber() {
    RegExp phoneNumberRegex = RegExp(r'^[0-9]+$');

    if (phoneNumberController.text.isEmpty) {
      _showError('phonenumber', 'Phone number is required.');
      return false;
    } else if (!phoneNumberRegex.hasMatch(phoneNumberController.text)) {
      _showError('phonenumber', 'Invalid phone number format.');
      return false;
    }

    return true;
  }

  void _showError(String field, String errorMessage) {
    setState(() {
      if (field == "username") {
        usernameError = errorMessage;
      } else if (field == "password") {
        passwordError = errorMessage;
      } else if (field == "phonenumber") {
        phoneNumberError = errorMessage;
      }
    });
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
              Text('Sign Up',
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
                hint: 'PhoneNumber',
                myController: phoneNumberController,
                obscureText: false,
                errorMessage: phoneNumberError,
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
                onPressed: signUp, // Invoke signUp method
                child: Text('Sign Up'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),

              SizedBox(height: 20),
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Text('Already have an account? Log in'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
