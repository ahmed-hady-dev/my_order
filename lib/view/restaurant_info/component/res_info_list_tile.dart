import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ResInfoListTile extends StatelessWidget {
  final IconData icon;
  final String iconText;
  final String trailingText;

  const ResInfoListTile({
    Key? key,
    required this.icon,
    required this.iconText,
    required this.trailingText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FaIcon(icon, color: Colors.black, size: 20),
              const SizedBox(width: 8),
              Text(
                iconText,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 16, color: Colors.black),
              ),
              const SizedBox(width: 8),
            ],
          ),
          Expanded(
            child: Text(
              trailingText,
              textAlign: TextAlign.end,
              style: const TextStyle(fontSize: 16, color: Colors.black54),
            ),
          )
        ],
      ),
    );
  }
}
