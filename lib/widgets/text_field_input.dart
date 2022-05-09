import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final String hintText;
  final TextInputType textInputType;
  const TextFieldInput({
    Key? key,
    required this.textEditingController,
    this.isPass = false,
    required this.hintText,
    required this.textInputType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderSide: BorderSide(
          color: Colors.pink.shade200
      ) ,
    );

    return TextField(
      controller: textEditingController,
      style: TextStyle(color:Colors.black),
      decoration: InputDecoration(
        hintStyle: TextStyle(
          color: Colors.black,
        ),
        hintText: hintText,
        border: inputBorder,
        focusedBorder: inputBorder,
        enabledBorder: inputBorder,
        filled: true,
        contentPadding: const EdgeInsets.all(8),
      ),
      keyboardType: textInputType,
      cursorColor: Colors.pink,
      autocorrect: true,
      obscureText: isPass,
    );
  }
}
