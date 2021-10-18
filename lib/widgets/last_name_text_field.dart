// ignore_for_file: implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';

class LastNameTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final Function(String)? onFieldSubmitted;

  const LastNameTextField(
      {Key? key,
      required this.hintText,
      required this.controller,
      required this.onFieldSubmitted})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value!.isEmpty) {
          return "validation.last_name".tr();
        } else {
          return null;
        }
      },
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
          hintText: hintText, prefixIcon: const Icon(Icons.person_outlined)),
    );
  }
}
