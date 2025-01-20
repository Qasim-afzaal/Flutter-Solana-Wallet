import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:bip39/bip39.dart' as bip39;

class InputPhrases extends StatefulWidget {
  const InputPhrases({super.key});

  @override
  State<InputPhrases> createState() => _InputPhrasesState();
}

class _InputPhrasesState extends State<InputPhrases> {
  final _formKey = GlobalKey<FormState>();
  final _words = List<String>.filled(12, '');
  bool validationFailed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildInstructions(),
            _buildRecoveryPhraseForm(),
            _buildContinueButton(context),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 0,
      title: const Text(
        'Recovery Phrase',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
    );
  }

  Widget _buildInstructions() {
    return Column(
      children: const [
        Text(
          'Please enter your 12-word recovery phrase',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }

  Widget _buildRecoveryPhraseForm() {
    return Form(
      key: _formKey,
      child: GridView.builder(
        padding: const EdgeInsets.all(8),
        shrinkWrap: true,
        itemCount: 12,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return _buildRecoveryPhraseInput(index);
        },
      ),
    );
  }

  Widget _buildRecoveryPhraseInput(int index) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[850],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        hintText: '${index + 1}',
        hintStyle: const TextStyle(color: Colors.white54),
      ),
      style: const TextStyle(color: Colors.white),
      textAlign: TextAlign.center,
      onSaved: (value) {
        _words[index] = value?.trim() ?? '';
      },
    );
  }

  Widget _buildContinueButton(BuildContext context) {
    return Column(
      children: [
        if (validationFailed)
          const Text(
            'Invalid recovery phrase. Please try again.',
            style: TextStyle(
              color: Colors.red,
              fontSize: 14,
            ),
          ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => _onSubmit(context),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              backgroundColor: const Color(0xFF14F195),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'Continue',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _onSubmit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final wordsString = _words.join(' ');
      if (bip39.validateMnemonic(wordsString)) {
        GoRouter.of(context).go("/passwordSetup/$wordsString");
      } else {
        setState(() {
          validationFailed = true;
        });
      }
    }
  }
}
