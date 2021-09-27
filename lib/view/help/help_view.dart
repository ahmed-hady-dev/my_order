// ignore_for_file: implementation_imports

import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';

import 'component/help_expansion_tile.dart';

class HelpView extends StatelessWidget {
  const HelpView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String name = 'Ahmed';
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("help.appBar_title".tr())),
        body: ListView(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0),
          children: [
            AutoSizeText('${"help.hi".tr()}, $name ! ${"help.title".tr()}',
                style: const TextStyle(
                    fontSize: 24.0, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12.0),
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: 6,
              itemBuilder: (BuildContext context, int index) {
                return const HelpExpansionTile();
              },
            )
          ],
        ),
      ),
    );
  }
}
