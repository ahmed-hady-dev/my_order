import 'package:flutter/material.dart';

class AboutView extends StatelessWidget {
  const AboutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Center(child: Text('About us', style: TextStyle())),
      ),
    );
  }
}
