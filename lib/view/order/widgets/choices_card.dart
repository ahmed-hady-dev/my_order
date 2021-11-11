import 'package:flutter/material.dart';
import '../controller/order_cubit.dart';
import '../../home/widgets/section_header.dart';
import '../../../widgets/custom_shape_radio_option.dart';

class ChoicesCard extends StatefulWidget {
  final String headerText;
  final String subText;
  final bool isSubText;
  final List? list;
  final bool isSize;
  const ChoicesCard({
    Key? key,
    required this.headerText,
    required this.list,
    this.subText = '',
    required this.isSubText,
    required this.isSize,
  }) : super(key: key);

  @override
  State<ChoicesCard> createState() => _ChoicesCardState();
}

class _ChoicesCardState extends State<ChoicesCard> {
  int? groupValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            SectionHeader(
                headerText: widget.headerText,
                buttonText: '',
                showButton: false,
                onPressed: () {}),
            widget.isSubText
                ? Text(
                    widget.subText,
                    style: const TextStyle(color: Colors.grey, fontSize: 12.0),
                  )
                : const SizedBox(),
          ],
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: Colors.grey),
          ),
          child: ListView.builder(
            itemCount: widget.list!.length,
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => CustomShapeRadioOption<int>(
              id: widget.list![index]!.id!,
              isSize: widget.isSize,
              price: widget.list![index]!.price!,
              groupValue: groupValue,
              onChanged: (v) => OrderCubit.get(context)
                  .valueChangedHandler(widget.isSize, widget.list![index]!.id!),
              title: widget.list![index]!.name!,
            ),
          ),
        ),
      ],
    );
  }
}
