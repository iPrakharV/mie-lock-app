import 'package:flutter/material.dart';

class SecurityQuestionsScreen extends StatefulWidget {
  const SecurityQuestionsScreen({Key? key}) : super(key: key);

  @override
  _SecurityQuestionsScreenState createState() => _SecurityQuestionsScreenState();
}

class _SecurityQuestionsScreenState extends State<SecurityQuestionsScreen> {
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
              _buildDropdownButtonFormField(
                value: _selectedQuestion1,
                labelText: 'Select your first security question',
                items: _questions,
                onChanged: (value) => setState(() {
                  _selectedQuestion1 = value;
                }),
              ),
              const SizedBox(height: 20),
              _buildTextField(controller: _answer1Controller, labelText: 'Answer'),
              const SizedBox(height: 20),
              _buildDropdownButtonFormField(
                value: _selectedQuestion2,
                labelText: 'Select your second security question',
                items: _questions,
                onChanged: (value) => setState(() {
                  _selectedQuestion2 = value;
                }),
              ),
              const SizedBox(height: 20),
              _buildTextField(controller: _answer2Controller, labelText: 'Answer'),
              const SizedBox(height: 20),
              _buildDropdownButtonFormField(
                value: _selectedQuestion3,
                labelText: 'Select your third security question',
                items: _questions,
                onChanged: (value) => setState(() {
                  _selectedQuestion3 = value;
                }),
              ),
              const SizedBox(height: 20),
              _buildTextField(controller: _answer3Controller, labelText: 'Answer'),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _setupComplete,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  textStyle: const TextStyle(fontSize: 16),
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Complete Setup'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownButtonFormField({
    required String? value,
    required String labelText,
    required List<String> items,
    required void Function(String?) onChanged,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(),
      ),
      items: items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(),
      ),
    );
  }

  void _setupComplete() {
    Navigator.popUntil(context, ModalRoute.withName('/'));
  }
}