// ignore_for_file: implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_order/constants/app_colors.dart';
import 'package:my_order/widgets/bold_header.dart';

import 'component/search_appbar_title.dart';
import 'controller/search_cubit.dart';
import 'model/filter_button_model.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => SearchCubit(),
        child: BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            final cubit = SearchCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                titleSpacing: 0.0,
                leadingWidth: 48.0,
                centerTitle: false,
                //TODO: handle the search function in here
                title: SearchAppBarTitle(controller: cubit.searchController),
              ),
              body: ListView(
                shrinkWrap: true,
                children: [
                  BoldHeader(text: "search.popular_search".tr()),
                  Wrap(
                    children: searchFilterButtonList
                        .map(
                          (item) => Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                primary: Colors.white,
                                side: const BorderSide(
                                    width: 0.0, color: Colors.transparent),
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
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
