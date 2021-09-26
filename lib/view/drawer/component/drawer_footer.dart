import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerFooter extends StatelessWidget {
  const DrawerFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(
          child: Text(
            "Contact us",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const FaIcon(
                FontAwesomeIcons.facebookF,
                color: Colors.white,
              ),
              //TODO: add facebook link here
              onPressed: () => Fluttertoast.showToast(msg: 'Facebook Button'),
            ),
            IconButton(
              icon: const FaIcon(
                FontAwesomeIcons.instagram,
                color: Colors.white,
              ),
              //TODO: add instagram link here
              onPressed: () => Fluttertoast.showToast(msg: 'Instagram Button'),
            ),
            IconButton(
              icon: const FaIcon(
                FontAwesomeIcons.twitter,
                color: Colors.white,
              ),
              //TODO: add twitter link here
              onPressed: () => Fluttertoast.showToast(msg: 'Twitter Button'),
            ),
          ],
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}
