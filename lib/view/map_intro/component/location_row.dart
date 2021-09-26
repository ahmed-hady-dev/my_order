import 'package:flutter/material.dart';

class LocationRow extends StatelessWidget {
  const LocationRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(Icons.location_on_outlined),
        SizedBox(width: 6.0),
        Text(
          //TODO: add Location text here
          "El-Galla Street",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
        ),
      ],
    );
  }
}
