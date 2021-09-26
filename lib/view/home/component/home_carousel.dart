import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';
import '../controller/home_cubit.dart';

class HomeCarousel extends StatelessWidget {
  final HomeCubit cubit;
  const HomeCarousel({Key? key, required this.cubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CarouselSlider(
          items: cubit.carouselImage.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.asset(
                    i.toString(),
                    fit: BoxFit.cover,
                  ),
                );
              },
            );
          }).toList(),
          options: CarouselOptions(
            height: 200,
            viewportFraction: 1,
            initialPage: cubit.carouselIndex,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 4),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.linearToEaseOut,
            onPageChanged: (index, reason) {
              cubit.changeCarouselIndex(index: index);
            },
            scrollDirection: Axis.horizontal,
          ),
        ),
        DotsIndicator(
          dotsCount: cubit.carouselImage.length,
          position: cubit.carouselIndex.toDouble(),
          decorator: DotsDecorator(
            color: AppColors.redColor.withOpacity(0.5),
            activeColor: AppColors.redColor,
          ),
        )
      ],
    );
  }
}
