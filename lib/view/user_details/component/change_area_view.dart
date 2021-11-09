// ignore_for_file: implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_order/core/router/router.dart';
import 'package:my_order/view/register/components/area_of_city_drop_down_button.dart';
import 'package:my_order/view/register/components/city_drop_down_button.dart';
import 'package:my_order/view/register/components/shimmer_drop_down_button.dart';
import 'package:my_order/view/splash/splash_view.dart';
import 'package:my_order/view/user_details/controller/user_details_cubit.dart';
import 'package:my_order/widgets/header_text.dart';
import 'package:my_order/widgets/loading_widget.dart';
import 'package:my_order/widgets/main_button.dart';

class ChangeAreaView extends StatelessWidget {
  const ChangeAreaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<UserDetailsCubit, UserDetailsState>(
        listener: (context, state) {
          if (state is UpdateUserAreaSuccess) {
            if (state.userModel.status == 1) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("change_area.area_updated".tr()),
                  backgroundColor: Colors.green,
                ),
              );
            }
          }
        },
        builder: (context, state) {
          final cubit = UserDetailsCubit.get(context);
          return Scaffold(
            appBar: AppBar(title: Text("change_area.appBar_title".tr())),
            body: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: [
                HeaderText(
                  text: "change_area.city".tr(),
                  bottom: 12.0,
                ),
                cubit.cityModel == null
                    ? const ShimmerDropDownButton()
                    : CityDropDownButton(
                        itemsList: cubit.cityModel!.data!,
                        value: cubit.cityDropDownValue,
                        onChanged: (value) {
                          cubit.changeCityDropDown(value: value);
                          debugPrint(value);
                          cubit.areaOfCityDropDownValue = null;
                          cubit.getAreaOfCityById(areaId: int.parse(value!));
                        }),
                cubit.cityDropDownValue == null
                    ? const SizedBox()
                    : HeaderText(
                        text: "change_area.area".tr(),
                        bottom: 12.0,
                      ),
                cubit.cityDropDownValue == null
                    ? const SizedBox()
                    : state is GetAreaOfCityLoading
                        ? const ShimmerDropDownButton()
                        : AreaOfCityDropDownButton(
                            itemsList: cubit.areaOfCityModel!.data!,
                            value: cubit.areaOfCityDropDownValue,
                            onChanged: (value) {
                              cubit.changeAreaOfCityDropDown(value: value);
                            },
                          ),
                const SizedBox(height: 22.0),
                state is UpdateUserAreaLoading
                    ? const LoadingWidget()
                    : MainButton(
                        text: "user_details.edit".tr(),
                        onPressed: () async {
                          debugPrint(cubit.areaOfCityDropDownValue);
                          if (cubit.cityDropDownValue == null) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content:
                                    Text("register.please_choose_city".tr())));
                            return;
                          }
                          if (cubit.areaOfCityDropDownValue == null &&
                              cubit.areaOfCityModel != null) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content:
                                    Text("register.please_choose_area".tr())));
                            return;
                          }
                          if (cubit.areaOfCityDropDownValue != null) {
                            await cubit
                                .updateUserArea(
                                    areaId: int.parse(
                                        cubit.areaOfCityDropDownValue!))
                                .then((value) => MagicRouter.navigateAndPopAll(
                                    const SplashView()));
                          }
                        },
                      )
              ],
            ),
          );
        },
      ),
    );
  }
}
