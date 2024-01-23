import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

RegExp alphanumeric = RegExp(r'^[a-zA-Z0-9]+$');

class Report extends StatefulWidget {
  const Report({Key? key}) : super(key: key);

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _recipientController = TextEditingController();
  final TextEditingController _aliasController = TextEditingController();

  String _responseMessage = '';
  bool _transactionInitiated = false;

  Future<void> initiateTransaction() async {
    final apiUrl = 'http://localhost/graduation/pages/confirmtransaction.php';

    try {
      final response = await http.post(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data != null && data['status'] == 'success') {
          // Use null-aware operators to safely access the values
          final username = data['transaction_username']?['username'];
          final Amount = data['transaction_Amount']?['Amount'];
          final recipient = data['transaction_recipient']?['recipient'];
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

  void addToBlockedList() {
    // Implement your logic to add to the blocked list here
    print('Added to blocked list');
    // You can replace the print statement with your actual logic

    // Navigate to the Blocked List page
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Row(
                children: [
                  const SizedBox(width: 20),
                  const Text(
                    'Report',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 4),

              const SizedBox(height: 8), // Adjust the spacing as needed
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'The percentage of fraud occurrence by this user',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 8), // Adjust the spacing as needed
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  '1.If you have any doubts about the transaction or suspect any type of fraud, report it immediately to the service provider or the relevant authority.',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 8), // Adjust the spacing as needed
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  '2.Be cautious of unusual requests such as transferring large sums without a convincing reason or urgent money transfer requests without clarification',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 8), // Adjust the spacing as needed
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  '3.Attempt direct communication with the receiving party before making the transfer. Talk to them, request additional information, and confirm their identity.',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color(0xFF0096C7)),
                  fixedSize: MaterialStateProperty.all<Size>(Size(300, 50)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    // Show an alert with two choices
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Choose an action'),
                          content: const Text(
                              'Transfer or Add to the blocked list?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                // Implement your transfer logic here
                                // handleTransfer();
                                initiateTransaction();

                                Navigator.of(context).pop(); // Close the alert
                              },
                              child: const Text('Transfer'),
                            ),
                            TextButton(
                              onPressed: () {
                                // Implement your logic to add to the blocked list here
                                addToBlockedList();
                                Navigator.of(context).pop(); // Close the alert
                              },
                              child: const Text('Add to blocked list'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: Text(
                  'Transfer',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
