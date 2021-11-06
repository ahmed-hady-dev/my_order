import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../core/router/router.dart';
import '../../store/controller/restaurant_cubit.dart';
import '../../../widgets/loading_indicator.dart';
import '../../../widgets/main_button.dart';

showRateDialog(int storeId, RestaurantCubit cubit) {
  showGeneralDialog(
    context: MagicRouter.currentContext!,
    pageBuilder: (context, animation, secondaryAnimation) => _Dialog(
      storeId: storeId,
      cubit: cubit,
    ),
  );
}

class _Dialog extends StatefulWidget {
  const _Dialog({Key? key, required this.storeId, required this.cubit})
      : super(key: key);
  final int storeId;
  final RestaurantCubit cubit;
  @override
  State<_Dialog> createState() => _DialogState();
}

class _DialogState extends State<_Dialog> {
  bool isLoading = false;
  double rateValue = 3.0;
  String? comment;

  void rate() async {
    if (comment == null || comment!.isEmpty) return;
    isLoading = true;
    setState(() {});
    await widget.cubit.addReview(widget.storeId, rateValue, comment!);
    MagicRouter.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RatingBar.builder(
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                rateValue = rating;
              },
            ),
            _TextField(
              onChanged: (v) {
                comment = v;
              },
            ),
            isLoading
                ? const LoadingIndicator()
                : MainButton(
                    text: "Rate",
                    onPressed: rate,
                  ),
          ],
        ),
      ),
    );
  }
}

class _TextField extends StatelessWidget {
  const _TextField({Key? key, required this.onChanged}) : super(key: key);
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: TextFormField(
        keyboardType: TextInputType.text,
        onChanged: onChanged,
        validator: (value) {
          if (value!.isEmpty) {
            return "Empty!";
          }
          return null;
        },
        autovalidateMode: AutovalidateMode.always,
        decoration: const InputDecoration(hintText: "Comment"),
      ),
    );
  }
}
