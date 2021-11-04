// ignore_for_file: implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_order/constants/app_colors.dart';
import 'package:my_order/core/router/router.dart';
import 'package:my_order/view/offers/offers_view.dart';
import 'package:my_order/widgets/clickable_small_text.dart';

class OfferButton extends StatelessWidget {
  const OfferButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          const FaIcon(
            FontAwesomeIcons.tag,
            color: AppColors.redColor,
            size: 16.0,
          ),
          const SizedBox(width: 4.0),
          ClickableSmallText(
            text: "restaurant.offer_of_the_restaurant".tr(),
            onTap: () {
              MagicRouter.navigateTo(const OffersView());
            },
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
            decorationThickness: 2.0,
          ),
        ],
      ),
    );
  }
}
