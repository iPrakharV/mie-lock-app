import 'package:flutter/material.dart';

class SecurityQuestionsScreen extends StatefulWidget {
  const SecurityQuestionsScreen({Key? key}) : super(key: key);

  @override
  _SecurityQuestionsScreenState createState() => _SecurityQuestionsScreenState();
}

class _SecurityQuestionsScreenState extends State<SecurityQuestionsScreen> {
  final TextEditingController _question1Controller = TextEditingController();
  final TextEditingController _question2Controller = TextEditingController();
  final TextEditingController _question3Controller = TextEditingController();

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
              TextField(
                controller: _question1Controller,
                decoration: const InputDecoration(
                  labelText: 'Security Question 1',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _question2Controller,
                decoration: const InputDecoration(
                  labelText: 'Security Question 2',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _question3Controller,
                decoration: const InputDecoration(
                  labelText: 'Security Question 3',
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
    // Logic to save security questions
    print('Security questions set.');
    Navigator.popUntil(context, ModalRoute.withName('/')); // Navigate back to the home screen
  }
}