import 'package:flutter/material.dart';

class SecurityQuestionsScreen extends StatefulWidget {
  const SecurityQuestionsScreen({Key? key}) : super(key: key);

  @override
  _SecurityQuestionsScreenState createState() => _SecurityQuestionsScreenState();
}

class _SecurityQuestionsScreenState extends State<SecurityQuestionsScreen> {
  // Predefined list of security questions
  final List<String> _questions = [
    "What was your first pet's name?",
    "What was the model of your first car?",
    "In what city were you born?",
    "What is your mother's maiden name?",
    "What was the name of your first school?"
  ];

  String? _selectedQuestion1;
  String? _selectedQuestion2;
  String? _selectedQuestion3;
  final TextEditingController _answer1Controller = TextEditingController();
  final TextEditingController _answer2Controller = TextEditingController();
  final TextEditingController _answer3Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text('Set Security Questions'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DropdownButtonFormField<String>(
                value: _selectedQuestion1,
                decoration: const InputDecoration(
                  labelText: 'Select your first security question',
                  border: OutlineInputBorder(),
                ),
                items: _questions.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedQuestion1 = newValue;
                  });
                },
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _answer1Controller,
                decoration: const InputDecoration(
                  labelText: 'Answer',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: _selectedQuestion2,
                decoration: const InputDecoration(
                  labelText: 'Select your second security question',
                  border: OutlineInputBorder(),
                ),
                items: _questions.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedQuestion2 = newValue;
                  });
                },
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _answer2Controller,
                decoration: const InputDecoration(
                  labelText: 'Answer',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: _selectedQuestion3,
                decoration: const InputDecoration(
                  labelText: 'Select your third security question',
                  border: OutlineInputBorder(),
                ),
                items: _questions.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedQuestion3 = newValue;
                  });
                },
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _answer3Controller,
                decoration: const InputDecoration(
                  labelText: 'Answer',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _setupComplete(),
                child: const Text('Complete Setup'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _setupComplete() {
    // Logic to save security questions and answers
    print('Security questions set with answers.');
    Navigator.popUntil(context, ModalRoute.withName('/')); // Navigate back to the home screen
  }
}