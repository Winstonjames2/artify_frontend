import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import '../services/auth_service.dart';
import '../models/login_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  bool _isLoading = false;

  // Function to handle login process
  Future<void> _login() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _isLoading = true;
      });

      _formKey.currentState?.save();

      final url =
          Uri.parse('http://10.0.2.2:8000/login/'); // Adjust backend URL here
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'email': _email,
          'password': _password,
        }),
      );

      setState(() {
        _isLoading = false;
      });

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        String token = responseData['token'];

        // Save the token using AuthService
        print('token here');
        print(token);
        AuthService authService = AuthService();
        await authService.saveToken(token);
        // Update login state
        Provider.of<LoginState>(context, listen: false).login(token);

        Fluttertoast.showToast(msg: 'Login successful!');

        // Navigate to another page, pass token or session information
        Navigator.pushReplacementNamed(context, '/');
      } else {
        Fluttertoast.showToast(msg: 'Invalid login credentials');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Welcome to Artify',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 30),
                _buildLoginForm(),
                SizedBox(height: 20),
                _isLoading
                    ? CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: _login,
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(
                              horizontal: 40.0, vertical: 15.0),
                          textStyle: TextStyle(
                            fontSize: 16.0,
                          ),
                          backgroundColor: Colors.black,
                        ),
                        child: Text('Login'),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Email',
              prefixIcon: Icon(Icons.email),
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
            onSaved: (value) {
              _email = value ?? '';
            },
          ),
          SizedBox(height: 15),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Password',
              prefixIcon: Icon(Icons.lock),
              border: OutlineInputBorder(),
            ),
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
            onSaved: (value) {
              _password = value ?? '';
            },
          ),
        ],
      ),
    );
  }
}
