import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transactionapp/pages/report.dart';

class Transaction extends StatefulWidget {
  @override
  _TransactionState createState() => _TransactionState();
}

class _TransactionState extends State<Transaction> {
  String? loggedInUser;
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _recipientController = TextEditingController();
  final TextEditingController _aliasController = TextEditingController();

  String _responseMessage = '';
  bool _transactionInitiated = false;

  @override
  void initState() {
    super.initState();
    _checkLoggedInUser();
  }

  Future<void> _checkLoggedInUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    loggedInUser = prefs.getString('username');
    setState(() {});
  }

  void navigateToSuccessPage() {
    // Navigate to another page on successful transaction
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => Report()), // Replace with your success page
    );
  }

  // Future<void> initiateTransaction() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();

  //   // Retrieve data from the text controllers
  //   final String alias = _aliasController.text;
  //   final String amount = _amountController.text;
  //   final String recipient = _recipientController.text;

  //   // Store data in shared preferences
  //   prefs.setString('transaction_alias', alias);
  //   prefs.setString('transaction_amount', amount);
  //   prefs.setString('transaction_recipient', recipient);

  //   // Make the API call to your PHP server
  //   final response = await http.post(
  //     Uri.parse(
  //         'http://localhost/graduation/pages/transaction.php'), // Replace with your PHP server URL
  //     body: {
  //       'username': loggedInUser!,
  //       'Amount': amount,
  //       'recipient': recipient,
  //     },
  //   );

  //   if (response.statusCode == 200) {
  //     // Transaction successful
  //     setState(() {
  //       _responseMessage = 'Transaction successful';
  //       _transactionInitiated = true;
  //     });
  //     navigateToSuccessPage();
  //   } else {
  //     // Transaction failed
  //     setState(() {
  //       _responseMessage = 'Transaction failed';
  //       _transactionInitiated = false;
  //     });
  //   }
  // }

  Future<void> initiateTransaction() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('transaction_alias', _aliasController.text);
    prefs.setString('transaction_amount', _amountController.text);
    prefs.setString('transaction_recipient', _recipientController.text);
    final apiUrl = 'http://localhost/graduation/pages/transaction.php';
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: {
          'username': loggedInUser!,
          'Amount': _amountController.text,
          'recipient': _recipientController.text,
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['status'] == 'success') {
          setState(() {
            _responseMessage = 'Transaction successful';
            _transactionInitiated = true;
                  navigateToSuccessPage();


          });
        } else {
          setState(() {
            _responseMessage = 'Transaction failed: ${data['message']}';
            _transactionInitiated = false;
          });
        }
      } else {
        setState(() {
          _responseMessage = 'HTTP Error: ${response.statusCode}';
          _transactionInitiated = false;
        });
      }
    } catch (e) {
      setState(() {
        _responseMessage = 'Error: $e';
        _transactionInitiated = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (loggedInUser == null) {
      return Center(child: CircularProgressIndicator());
    }
    return Scaffold(
      appBar: AppBar(title: const Text('Transaction')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: _aliasController,
              decoration: const InputDecoration(labelText: 'Alias'),
            ),
            TextFormField(
              controller: _amountController,
              decoration: const InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: _recipientController,
              decoration: const InputDecoration(labelText: 'Recipient'),
            ),
            ElevatedButton(
              onPressed: _transactionInitiated ? null : initiateTransaction,
              child: const Text('Send Money'),
            ),
            const SizedBox(height: 16),
            Text(
              _responseMessage,
              style: TextStyle(
                color: _transactionInitiated ? Colors.green : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
