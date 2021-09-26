import 'package:flutter/material.dart';
import '../../search/model/filter_button_model.dart';
import '../../../constants/app_colors.dart';
import '../controller/filter_cubit.dart';

class DealsAndOffersFilters extends StatelessWidget {
  const DealsAndOffersFilters({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  final FilterCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: dealsAndOffersButtonList
          .map(
            (item) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  primary: Colors.white,
                  side: const BorderSide(width: 0.0, color: Colors.transparent),
                  backgroundColor: item.isSelected
                      ? AppColors.redColor
                      : AppColors.redColor.withOpacity(0.5),
                ),
                onPressed: () {
                  item.isSelected = !item.isSelected;
                  cubit.changeSelectedFilterButton();
                  //TODO : add filter button functionality here
                },
                child: Text(item.text),
              ),
            ),
          )
          .toList(),
    );
  }
}
