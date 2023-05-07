import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {this.hintText,
      this.onChanged,
      this.securedText = false,
      this.inputTupe});
  String? hintText;
  bool? securedText;
  TextInputType? inputTupe;

  Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: securedText!,
      keyboardType: inputTupe,
      // validator: (value) {
      //   if (value!.isEmpty) {
      //     return "Data is required";
      //   }
      // },
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(8)),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
