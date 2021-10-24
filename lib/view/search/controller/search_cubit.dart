import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_order/constants/constants.dart';
import 'package:my_order/core/dioHelper/dio_helper.dart';
import 'package:my_order/view/search/model/search_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  static SearchCubit get(context) => BlocProvider.of(context);
  //===============================================================
  TextEditingController searchController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  SearchModel? searchModel;
  //===============================================================
  Future<void> searchStore({required String query}) async {
    emit(SearchLoadingState());
    final response = await DioHelper.getData(
        url: search, query: {'store': query.toLowerCase()});
    try {
      searchModel = SearchModel.fromJson(response.data);
      emit(SearchSuccessState(searchModel: searchModel!));
    } on DioError catch (e) {
      debugPrint(e.error.toString());
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      emit(SearchErrorState());
    }
  }
  // changeSelectedFilterButton() {
  //   emit(ChangeSelectedFilterButton());
  // }
  //===============================================================
  //search part
  // String? selectedTerm;
  // static const historyLength = 5;
  // final List<String> searchHistory = [];
  // List<String> filteredSearchHistory = [];
  // FloatingSearchBarController floatingSearchBarController =
  //     FloatingSearchBarController();
  // // Future<List<String>> get searchHistory async {
  // //   return await CacheHelper.readSomeThing(key: 'searchHistory')
  // //       as List<String>;
  // // }
  // // getSearchHistory() async {
  // //   searchHistory =
  // //       await CacheHelper.readSomeThing(key: 'searchHistory') as List<String>;
  // // }
  //
  // List<String> filterSearchTerms({
  //   required String? filter,
  // }) {
  //   if (filter != null && filter.isNotEmpty) {
  //     emit(FilterSearchTermsState());
  //     CacheHelper.cacheSomeThing(key: 'searchHistory', value: searchHistory);
  //     return searchHistory.reversed
  //         .where((term) => term.startsWith(filter))
  //         .toList();
  //   } else {
  //     emit(FilterSearchTermsState());
  //     return searchHistory.reversed.toList();
  //   }
  // }
  //
  // void addSearchTerm(String term) {
  //   if (searchHistory.contains(term)) {
  //     putSearchTermFirst(term);
  //     CacheHelper.cacheSomeThing(key: 'searchHistory', value: searchHistory);
  //     emit(AddSearchTermState());
  //     return;
  //   }
  //
  //   searchHistory.add(term);
  //   if (searchHistory.length > historyLength) {
  //     searchHistory.removeRange(0, searchHistory.length - historyLength);
  //   }
  //
  //   filteredSearchHistory = filterSearchTerms(filter: null);
  //   CacheHelper.cacheSomeThing(key: 'searchHistory', value: searchHistory);
  //   emit(AddSearchTermState());
  // }
  //
  // void deleteSearchTerm(String term) {
  //   searchHistory.removeWhere((t) => t == term);
  //   filteredSearchHistory = filterSearchTerms(filter: null);
  //   CacheHelper.cacheSomeThing(key: 'searchHistory', value: searchHistory);
  //   emit(DeleteSearchTermState());
  // }
  //
  // void putSearchTermFirst(String term) {
  //   deleteSearchTerm(term);
  //   addSearchTerm(term);
  //   CacheHelper.cacheSomeThing(key: 'searchHistory', value: searchHistory);
  //   emit(PutSearchTermFirstState());
  // }
}
