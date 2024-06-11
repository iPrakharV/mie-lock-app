import 'package:flutter/material.dart';
import 'otp_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: LoginForm(),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildTextField(
          controller: _usernameController,
          labelText: 'Username',
        ),
        const SizedBox(height: 20),
        _buildTextField(
          controller: _passwordController,
          labelText: 'Password',
          obscureText: true,
        ),
        if (_errorMessage != null) 
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              _errorMessage!,
              style: TextStyle(color: Colors.red),
            ),
          ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            if (_usernameController.text.isEmpty || _passwordController.text.isEmpty) {
              setState(() {
                _errorMessage = 'Please enter both username and password.';
              });
            } else {
              setState(() {
                _errorMessage = null;
              });
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OTPScreen()),
              );
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            textStyle: const TextStyle(fontSize: 16),
            minimumSize: const Size(double.infinity, 50), // Adjust button height
          ),
          child: const Text('Login'),
        ),
      ],
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    bool obscureText = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(),
      ),
    );
  }
}