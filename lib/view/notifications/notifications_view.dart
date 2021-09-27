// ignore_for_file: implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:my_order/view/notifications/widgets/notification_tile.dart';

import 'model/notification_model.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("notification.appBar_title".tr())),
        body: ListView(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0),
          physics: const BouncingScrollPhysics(),
          children: [
            const SizedBox(height: 12.0),
            ListView.separated(
              separatorBuilder: (context, index) => const Divider(),
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: notificationList.length,
              itemBuilder: (BuildContext context, int index) {
                return NotificationTile(
                    headerText: notificationList[index].headerText,
                    bodyText: notificationList[index].bodyText);
              },
            )
          ],
        ),
      ),
    );
  }
}
