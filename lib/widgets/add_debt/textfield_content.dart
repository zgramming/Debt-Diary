import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextfieldContent extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final List<TextInputFormatter> inputFormatter;
  TextfieldContent(
      {this.label, this.controller, this.keyboardType, this.inputFormatter});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: TextFormField(
        keyboardType: keyboardType,
        inputFormatters: inputFormatter,
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
