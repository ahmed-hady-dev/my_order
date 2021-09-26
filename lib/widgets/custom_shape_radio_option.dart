import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../constants/app_colors.dart';

class CustomShapeRadioOption<T> extends StatelessWidget {
  final double value;
  final double? groupValue;
  final String title;
  final ValueChanged<double?> onChanged;

  const CustomShapeRadioOption({
    Key? key,
    required this.value,
    required this.groupValue,
    required this.title,
    required this.onChanged,
  }) : super(key: key);

  Widget _buildLabel() {
    final bool isSelected = value == groupValue;
    return Container(
      width: 32.0,
      height: 20.0,
      decoration: isSelected
          ? BoxDecoration(
              color: AppColors.redColor,
              borderRadius: BorderRadius.circular(4.0),
            )
          : BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4.0),
              border: Border.all(color: Colors.grey)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(value);
        Fluttertoast.showToast(msg: value.toString());
      },
      splashColor: AppColors.redColor.withOpacity(0.2),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: <Widget>[
                _buildLabel(),
                TitleText(title: title),
              ],
            ),
            ValueText(value: value),
          ],
        ),
      ),
    );
  }
}

//===============================================================
class TitleText extends StatelessWidget {
  final String title;
  const TitleText({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Text(
          title,
          style: const TextStyle(
              fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black),
        ));
  }
}

//===============================================================
class ValueText extends StatelessWidget {
  final double value;
  const ValueText({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0),
      child: Text(
        "${value.toString()} EGP",
        style: const TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
