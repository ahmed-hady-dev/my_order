// ignore_for_file: implementation_imports

import 'package:flutter/material.dart';
import 'component/location_card.dart';

class MapIntro extends StatelessWidget {
  const MapIntro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Center(
                  child: Text(
                    'Map Here',
                    style: TextStyle(fontSize: 24.0),
                  ),
                ),
              ],
            ),
            const LocationCard(),
          ],
        ),
      ),
    );
  }
}
