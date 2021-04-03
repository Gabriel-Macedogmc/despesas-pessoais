import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class AdapTativeTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final Function(String) onSubmit;

  AdapTativeTextField({
    this.controller,
    this.keyboardType = TextInputType.text,
    this.label,
    this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Padding(
            padding: const EdgeInsets.only(
              bottom: 10,
            ),
            child: CupertinoTextField(
              controller: controller,
              placeholder: '$label',
              onSubmitted: onSubmit,
              keyboardType: keyboardType,
              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 12),
            ),
          )
        : TextField(
            controller: controller,
            decoration: InputDecoration(labelText: '$label'),
            onSubmitted: onSubmit,
            keyboardType: keyboardType,
          );
  }
}
