import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_order/constants/app_colors.dart';
import 'package:my_order/core/cacheHelper/cache_helper.dart';
import 'package:my_order/view/user_details/controller/user_details_cubit.dart';

class UserProfileImage extends StatelessWidget {
  const UserProfileImage({
    Key? key,
    required this.cubit,
  }) : super(key: key);
  final UserDetailsCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      children: [
        Align(
          alignment: Alignment.center,
          child: Container(
            height: 120.0,
            width: 120.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  CacheHelper.getUserInfo!.data!.image!,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0.0,
          right: 0.0,
          left: 80.0,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.grey.shade300, shape: BoxShape.circle),
            child: IconButton(
                onPressed: () async {
                  final image = await cubit.pickImageFromGallery();
                  await cubit.uploadUserImage(path: image);
                },
                icon: const FaIcon(
                  FontAwesomeIcons.edit,
                  color: AppColors.redColor,
                  size: 16.0,
                )),
          ),
        )
      ],
    );
  }
}
