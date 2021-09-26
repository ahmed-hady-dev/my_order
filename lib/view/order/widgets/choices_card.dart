import 'package:flutter/material.dart';
import '../../home/widgets/section_header.dart';
import '../model/choices_model.dart';
import '../../../widgets/custom_shape_radio_option.dart';

class ChoicesCard extends StatefulWidget {
  final String headerText;
  final String subText;
  final bool isSubText;
  final List<ChoicesModel> list;
  const ChoicesCard({
    Key? key,
    required this.headerText,
    required this.list,
    this.subText = '',
    required this.isSubText,
  }) : super(key: key);

  @override
  State<ChoicesCard> createState() => _ChoicesCardState();
}

class _ChoicesCardState extends State<ChoicesCard> {
  double? groupValue;

  ValueChanged<double?> valueChangedHandler() {
    return (value) => setState(() => groupValue = value!);
  }

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
            itemCount: widget.list.length,
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => CustomShapeRadioOption<double>(
              value: widget.list[index].value,
              groupValue: groupValue,
              onChanged: valueChangedHandler(),
              title: widget.list[index].title,
            ),
          ),
        ),
      ],
    );
  }
}
