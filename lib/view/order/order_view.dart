import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../home/widgets/section_header.dart';
import 'component/order_main_header.dart';
import 'widgets/choices_card.dart';
import '../restaurant/component/food_image.dart';
import 'component/add_to_cart_button.dart';
import 'controller/order_cubit.dart';
import 'model/choices_model.dart';

class OrderView extends StatelessWidget {
  final String name;
  final double price;
  final String image;
  final String description;

  const OrderView({
    Key? key,
    required this.image,
    required this.name,
    required this.price,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<OrderCubit, OrderState>(
        builder: (context, state) {
          final cubit = OrderCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: ListView(
              children: <Widget>[
                FoodImage(image: image),
                const SizedBox(height: 24.0),
                OrderMainHeader(
                    name: name,
                    description: description,
                    orderCount: cubit.orderCount,
                    price: price),
                ChoicesCard(
                    headerText: 'Choose Size',
                    isSubText: false,
                    list: sizeChoicesModel),
                const SizedBox(height: 12.0),
                ChoicesCard(
                    headerText: 'Extras',
                    isSubText: true,
                    subText: '(Optional)',
                    list: extrasChoicesModel),
                const SizedBox(height: 12.0),
                SectionHeader(
                    headerText: 'Add notes ...',
                    buttonText: '',
                    showButton: false,
                    onPressed: () {}),
                Container(
                  height: 66.0,
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  child: const TextField(
                      autofocus: false,
                      expands: true,
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          isCollapsed: true,
                          hintText:
                              'Write any special things you want to do.')),
                ),
                const AddToCartButton(),
              ],
            ),
          );
        },
      ),
    );
  }
}
