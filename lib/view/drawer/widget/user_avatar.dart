import 'package:flutter/material.dart';
import 'package:my_order/constants/constants.dart';
import 'package:my_order/core/getStorageHelper/get_storage_helper.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70.0,
      height: 70.0,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(50),
        image: DecorationImage(
          image: NetworkImage(
            GetStorageHelper.storage.read(userImage),
          ),
        ),
      ),
    );
  }
}
