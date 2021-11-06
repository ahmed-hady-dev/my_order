import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../cubit.dart';
import '../model/cart.dart';

import '../../order/widgets/change_order_button.dart';

class CartOrderCounterRow extends StatefulWidget {
  const CartOrderCounterRow({
    Key? key,
    required this.orderCount,
    required this.item,
    required this.storeId,
  }) : super(key: key);

  final Item item;
  final int orderCount;
  final int storeId;
  @override
  State<CartOrderCounterRow> createState() => _CartOrderCounterRowState();
}

class _CartOrderCounterRowState extends State<CartOrderCounterRow> {
  late int counter;

  @override
  void initState() {
    counter = widget.orderCount;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ChangeOrderButton(
            iconSize: 20.0,
            constraints: const BoxConstraints(),
            onPressed: () {
              if (counter == 1) {
                debugPrint("remove");
              } else {
                counter--;
                setState(() {});
                CartCubit.of(context).updateCart(
                    storeId: widget.storeId,
                    quantity: counter,
                    itemId: widget.item.id!,
                    sizeId: widget.item.pivot!.itemSizeId!.id!,
                    extraId: widget.item.pivot!.extras != null &&
                            widget.item.pivot!.extras!.isNotEmpty
                        ? widget.item.pivot!.extras!.first.id!
                        : null);
              }
            },
            icon: FontAwesomeIcons.minusCircle),
        SizedBox(
          width: 24.0,
          child: Text(
            counter.toString(),
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
        ),
        ChangeOrderButton(
            iconSize: 20.0,
            constraints: const BoxConstraints(),
            onPressed: () {
              counter++;
              setState(() {});
              CartCubit.of(context).updateCart(
                  storeId: widget.item.id!,
                  quantity: counter,
                  itemId: widget.item.id!,
                  sizeId: widget.item.pivot!.itemSizeId!.id!,
                  extraId: widget.item.pivot!.extras != null &&
                          widget.item.pivot!.extras!.isNotEmpty
                      ? widget.item.pivot!.extras!.first.id!
                      : null);
            },
            icon: FontAwesomeIcons.plusCircle),
      ],
    );
  }
}
