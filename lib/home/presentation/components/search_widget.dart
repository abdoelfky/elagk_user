import 'package:advanced_search/advanced_search.dart';
import 'package:elagk/home/presentation/controllers/home_screen_controller/home_screen_cubit.dart';
import 'package:elagk/home/presentation/controllers/home_screen_controller/home_screen_state.dart';
import 'package:elagk/shared/global/app_colors.dart';
import 'package:elagk/shared/utils/app_routes.dart';
import 'package:elagk/shared/utils/app_strings.dart';
import 'package:elagk/shared/utils/app_values.dart';
import 'package:elagk/shared/utils/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchWidget extends StatelessWidget {

  List<String> searchableList = [];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery
        .of(context)
        .size
        .width;
    var height = MediaQuery.of(context).size.height;

    return BlocBuilder<HomeScreenCubit, HomeScreenState>(
      builder: (context, state) {


        HomeScreenCubit.get(context).pharmacies.forEach((element) {
          searchableList.add(element.pharmacyName!.toLowerCase());

        });
        return Flexible(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
              color: Color(0x35a9a3),
              width: width * .85,
              padding: EdgeInsets.all(AppPadding.p15),
              child: AdvancedSearch(
                searchItems: searchableList,
                maxElementsToDisplay: 10,
                singleItemHeight: 50,
                minLettersForSearch: 0,
                selectedTextColor: Color(0xFF3363D9),
                fontSize: 14,
                borderRadius: 10.0,
                hintText: AppStrings.search,
                cursorColor: Colors.white,
                autoCorrect: false,
                focusedBorderColor: Colors.blue,
                searchResultsBgColor: Color(0xFAFAFA),
                disabledBorderColor: Colors.cyan,
                enabledBorderColor: Color(0x35a9a3),
                enabled: true,
                caseSensitive: true,
                inputTextFieldBgColor: Colors.white10,
                clearSearchEnabled: true,
                itemsShownAtStart: 10,
                searchMode: SearchMode.CONTAINS,
                showListOfResults: true,
                unSelectedTextColor: Colors.white,
                verticalPadding: 15,
                horizontalPadding: 20,
                hideHintOnTextInputFocus: true,
                hintTextColor: Colors.white,
                searchItemsWidget: searchWidget,
                onItemTap: (index, value) {
                  print("selected item Index is $index");
                  HomeScreenCubit.get(context).searchWord=value;
                  HomeScreenCubit.get(context).search();


                },
                onSearchClear: () {
                  print("Cleared Search");
                  HomeScreenCubit.get(context).searchWord='';
                  HomeScreenCubit.get(context).searchResult=[];
                  print(HomeScreenCubit.get(context).searchResult.length);
                  HomeScreenCubit.get(context).search();

                },
                onSubmitted: (value, value2) {
                  print("Submitted: " + value);
                  HomeScreenCubit.get(context).searchWord=value;
                  HomeScreenCubit.get(context).search();

                },
                onEditingProgress: (value, value2) {
                  print("TextEdited: " + value);
                  HomeScreenCubit.get(context).searchWord=value;
                  print("LENGTH: " + value2.length.toString());
                  HomeScreenCubit.get(context).search();
                },
              ),
            ),
          ),
        );
      },
    );
  }

  Widget searchWidget(String text) {
    return ListTile(
      title:  Text(
        text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 18,
          color: Colors.white,
        ),
      ),
    );
  }
}
