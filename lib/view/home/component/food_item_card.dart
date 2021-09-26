import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../constants/app_colors.dart';
import '../../../core/router/router.dart';
import '../model/food_card_model.dart';
import '../../restaurant/restaurant_view.dart';

class FoodItemCard extends StatelessWidget {
  final List<FoodCardModel> foodCardModel;
  const FoodItemCard({
    Key? key,
    required this.foodCardModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.0,
      child: ListView.builder(
        addAutomaticKeepAlives: false,
        addRepaintBoundaries: false,
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: foodCardModel.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () => MagicRouter.navigateTo(RestaurantView(
              name: foodCardModel[index].name,
              image: foodCardModel[index].image,
              price: foodCardModel[index].deliveryPrice,
              time: foodCardModel[index].time,
              stars: foodCardModel[index].stars,
              distance: foodCardModel[index].distance,
              status: foodCardModel[index].status,
            )),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    width: 200,
                    height: 132.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      image: DecorationImage(
                        image: AssetImage(foodCardModel[index].image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: Wrap(children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          foodCardModel[index].name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ]),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Delivery: ${foodCardModel[index].deliveryPrice.toString()} EGP',
                              style: const TextStyle(
                                  fontSize: 8.0, fontWeight: FontWeight.normal),
                            ),
                            RatingBar.builder(
                              minRating: 1,
                              maxRating: 5.0,
                              initialRating: 3,
                              itemSize: 14.0,
                              allowHalfRating: true,
                              ignoreGestures: true,
                              direction: Axis.horizontal,
                              itemCount: 5,
                              itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: AppColors.redColor),
                              onRatingUpdate: (rating) {},
                            )
                          ],
                        ),
                        Row(
                          children: [
                            const FaIcon(
                              FontAwesomeIcons.clock,
                              size: 12.0,
                            ),
                            const SizedBox(width: 4.0),
                            Text(
                              foodCardModel[index].time,
                              style: const TextStyle(
                                  fontSize: 8.0, fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
