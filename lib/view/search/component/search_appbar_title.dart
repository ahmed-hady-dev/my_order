// ignore_for_file: implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';

class SearchAppBarTitle extends StatelessWidget {
  const SearchAppBarTitle({
    Key? key,
    required this.controller,
    required this.onFieldSubmitted,
  }) : super(key: key);

  final TextEditingController controller;
  final Function(String)? onFieldSubmitted;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsetsDirectional.only(end: 16.0, top: 8.0),
        child: TextFormField(
          keyboardType: TextInputType.text,
          controller: controller,
          onFieldSubmitted: onFieldSubmitted,
          validator: (value) {
            if (value!.isEmpty) {
              return "search.search_empty".tr();
            } else {
              return null;
            }
          },
          decoration: InputDecoration(
            suffixIconConstraints: const BoxConstraints(),
            suffixIcon: IconButton(
              onPressed: () => controller.clear(),
              icon: const Icon(Icons.clear),
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              constraints: const BoxConstraints(),
            ),
            isDense: true,
            contentPadding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
            hintText: "search.search_bar".tr(),
          ),
        ),
      ),
    );
  }
}
