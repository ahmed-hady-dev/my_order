import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void loadingDialog(BuildContext context) {
  showDialog(
    context: context,
    useSafeArea: true,
    barrierDismissible: false,
    barrierColor: Colors.black12,
    builder: (context) {
      return AlertDialog(
        // alignment: Alignment.center,
        elevation: 1.0,
        contentPadding: const EdgeInsets.symmetric(vertical: 50),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        content: Container(
          height: 50.0,
          width: 50.0,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(50.0)),
          child: const Center(
            child: CupertinoActivityIndicator(
              radius: 16.0,
              animating: true,
            ),
          ),
        ),
      );
    },
  );
}
