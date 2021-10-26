import 'package:flutter/material.dart';
import '../../../core/cacheHelper/cache_helper.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({Key? key, this.width = 70.0, this.height = 70.0})
      : super(key: key);
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(100),
      ),
      child: CircleAvatar(
        backgroundColor: Colors.grey.shade300,
        child: ClipOval(
          child: Image.network(CacheHelper.getUserInfo!.data!.image!,
              fit: BoxFit.cover),
        ),
      ),
    );
  }
}
