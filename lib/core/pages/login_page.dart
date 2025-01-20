import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _storage = const FlutterSecureStorage();

  bool _validationFailed = false;
  bool _loading = true;
  String? _password;
  String? _mnemonic;

  @override
  void initState() {
    super.initState();
    _initializeLogin();
  }

  Future<void> _initializeLogin() async {
    final credentialsFound = await _checkForSavedLogin();
    if (!credentialsFound) {
      GoRouter.of(context).go("/setup");
    } else {
      setState(() {
        _loading = false;
      });
    }
  }

  Future<bool> _checkForSavedLogin() async {
    _mnemonic = await _storage.read(key: 'mnemonic');
    _password = await _storage.read(key: 'password');
    return _mnemonic != null && _password != null;
  }

  void _onSubmit() {
    if (_formKey.currentState!.validate()) {
      GoRouter.of(context).go("/home");
    }
  }

  Future<void> _onDifferentAccountPressed() async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Warning'),
        content: const Text(
          'Access to the current account will be lost if the seed phrase is not saved.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              GoRouter.of(context).go("/setup");
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      controller: _passwordController,
      obscureText: true,
      decoration: const InputDecoration(
        labelText: 'Password',
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value != _password) {
          setState(() {
            _validationFailed = true;
          });
          return 'Invalid Password';
        }
        return null;
      },
    );
  }

  Widget _buildLoadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildLoginForm() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Center(
              child: Text(
                "SOLANA LOGIN",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Login',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  _buildPasswordField(),
                  if (_validationFailed)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        'Invalid Password',
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _onSubmit,
                    child: const Text('Login'),
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: _onDifferentAccountPressed,
                    child: const Text('Use Different Account'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _loading ? _buildLoadingIndicator() : _buildLoginForm(),
    );
  }
}
