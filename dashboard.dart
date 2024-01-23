// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:transactionapp/Screens/Transaction.dart';

// class Dashboard extends StatefulWidget {
//   const Dashboard({Key? key}) : super(key: key);

//   @override
//   _DashboardState createState() => _DashboardState();
// }

// class _DashboardState extends State<Dashboard> {
//   double? newBalance;

//   @override
//   void initState() {
//     super.initState();
//     loadNewBalance();
//   }

//   Future<void> loadNewBalance() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();

//     setState(() {
//       newBalance = prefs.getDouble('newbalance');
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Dashboard'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'Welcome to the Dashboard!',
//               style: TextStyle(fontSize: 20),
//             ),
//             SizedBox(height: 20),
//             newBalance != null
//                 ? Text(
//                     'New Balance: \$${newBalance.toString()}',
//                     style: TextStyle(fontSize: 18),
//                   )
//                 : CircularProgressIndicator(), // Show a loading indicator while new balance is being fetched
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => Transaction()),
//                 );
//               },
//               child: Text(' Transaction '),
//             ),
//             SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: () {},
//               child: Text('Blocked List'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:transactionapp/Screens/Transaction.dart';

// class Dashboard extends StatefulWidget {
//   const Dashboard({Key? key}) : super(key: key);

//   @override
//   _DashboardState createState() => _DashboardState();
// }

// class _DashboardState extends State<Dashboard> {
//   double? newBalance;

//   @override
//   void initState() {
//     super.initState();
//     loadNewBalance();
//   }

//   Future<void> loadNewBalance() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();

//     setState(() {
//       newBalance = prefs.getDouble('newbalance');
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Dashboard'),
//         backgroundColor: Colors.blueAccent, // Updated color
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0), // Added padding
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text(
//                 'Welcome to the Dashboard!',
//                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 20),
//               newBalance != null
//                   ? Text(
//                       'New Balance: \$${newBalance.toString()}', // Added toStringAsFixed for formatting
//                       style: TextStyle(
//                           fontSize: 20, color: Colors.green), // Updated style
//                     )
//                   : CircularProgressIndicator(
//                       valueColor: AlwaysStoppedAnimation<Color>(
//                           Colors.blueAccent), // Customized color
//                     ),
//               SizedBox(height: 30),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => Transaction()),
//                   );
//                 },
//                 child: Text('Transaction'),
//                 style: ElevatedButton.styleFrom(
//                   primary: Colors.blue, // Updated button color
//                   onPrimary: Colors.white, // Text color
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30.0),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 16),
//               ElevatedButton(
//                 onPressed: () {},
//                 child: Text('Blocked List'),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor:
//                       Colors.red, // Different color for different action
//                   foregroundColor: Colors.white,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30.0),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:transactionapp/Screens/Transaction.dart';

// class Dashboard extends StatefulWidget {
//   const Dashboard({Key? key}) : super(key: key);

//   @override
//   _DashboardState createState() => _DashboardState();
// }

// class _DashboardState extends State<Dashboard> {
//   double? newBalance;

//   @override
//   void initState() {
//     super.initState();
//     loadNewBalance();
//   }

//   Future<void> loadNewBalance() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       newBalance = prefs.getDouble('newbalance');
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Dashboard'),
//         backgroundColor: Colors.deepPurpleAccent, // Enhanced color
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text(
//                 'Welcome to the Dashboard!',
//                 style: TextStyle(
//                     fontSize: 26,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.deepPurple),
//               ),
//               SizedBox(height: 20),
//               newBalance != null
//                   ? Card(
//                       elevation: 4,
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(15)),
//                       child: Padding(
//                         padding: const EdgeInsets.all(15.0),
//                         child: Text(
//                           'New Balance: \$${newBalance.toString()}',
//                           style: TextStyle(
//                               fontSize: 22, color: Colors.greenAccent),
//                         ),
//                       ),
//                     )
//                   : CircularProgressIndicator(
//                       valueColor:
//                           AlwaysStoppedAnimation<Color>(Colors.deepPurple),
//                     ),
//               SizedBox(height: 30),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => Transaction()));
//                 },
//                 child: Text('Transaction'),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.purple, // Enhanced button color
//                   foregroundColor: Colors.white,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30.0),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 16),
//               ElevatedButton(
//                 onPressed: () {},
//                 child: Text('Blocked List'),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.orange, // Different color
//                   foregroundColor: Colors.white,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30.0),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:transactionapp/Screens/Transaction.dart';

// class Dashboard extends StatefulWidget {
//   const Dashboard({Key? key}) : super(key: key);

//   @override
//   _DashboardState createState() => _DashboardState();
// }

// class _DashboardState extends State<Dashboard> {
//   double? newBalance;

//   @override
//   void initState() {
//     super.initState();
//     loadNewBalance();
//   }

//   Future<void> loadNewBalance() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       newBalance = prefs.getDouble('newbalance');
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor:
//           const Color(0xFF396afc), // Background color of the whole screen
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.only(top: 20.0, left: 16.0, right: 16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               IconButton(
//                 icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
//                 onPressed: () => Navigator.of(context).pop(),
//               ),
//               Expanded(
//                 // Changed from Spacer to Expanded to fill the available space
//                 child: Align(
//                   alignment: Alignment.centerLeft,
//                   child: Container(
//                     padding: const EdgeInsets.symmetric(
//                         vertical: 20.0, horizontal: 20.0),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(25),
//                       gradient: LinearGradient(
//                         begin: Alignment.topLeft,
//                         end: Alignment.bottomRight,
//                         colors: [
//                           Color(0xFF396afc), // Light blue
//                           Color(0xFF2948ff), // Dark blue
//                         ],
//                       ),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black26,
//                           blurRadius: 10,
//                           offset: Offset(0, 4),
//                         ),
//                       ],
//                     ),
//                     child: IntrinsicHeight(
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: <Widget>[
//                           Text(
//                             'Available on card',
//                             style: TextStyle(
//                               color: Colors.white70,
//                               fontSize: 16,
//                             ),
//                           ),
//                           const SizedBox(
//                               width: 10), // Provide some horizontal spacing
//                           VerticalDivider(
//                               color: Colors
//                                   .white54), // Vertical Divider for the text
//                           Text(
//                             '\$${newBalance != null ? newBalance.toString() : '--'}',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 48,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Text(
//                             ' USD',
//                             style: TextStyle(
//                               color: Colors.white70,
//                               fontSize: 16,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transactionapp/Screens/Transaction.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  double? newBalance;
  final Size squareSize = Size(70, 100);

  @override
  void initState() {
    super.initState();
    loadNewBalance();
  }

  Future<void> loadNewBalance() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      newBalance = prefs.getDouble('newbalance');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(
          255, 252, 253, 255), // Background color of the whole screen
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 16.0, right: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                onPressed: () => Navigator.of(context).pop(),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20.0),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF396afc), // Light blue
                      Color(0xFF2948ff), // Dark blue
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Available on card',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                        width: 10), // Provide some horizontal spacing
                    VerticalDivider(
                        color: Colors.white54), // Vertical Divider for the text
                    Text(
                      '\$${newBalance != null ? newBalance.toString() : '--'}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'JOD',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Transaction()),
                          );
                        },
                        child: Text('Transaction'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue, // Button color
                          foregroundColor: Colors.white, // Text color
                          fixedSize:
                              squareSize, // Set both width and height equally
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('Blocked List'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red, // Button color
                          foregroundColor: Colors.white, // Text color
                          fixedSize: squareSize,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
