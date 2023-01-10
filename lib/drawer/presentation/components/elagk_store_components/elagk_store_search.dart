import 'package:advanced_search/advanced_search.dart';
import 'package:elagk/drawer/presentation/controller/elagk_store_controller/elagk_store_cubit.dart';
import 'package:elagk/pharmacy/presentation/pharmacy_controllers/pharmacy_producties_controller/pharmacy_producties_cubit.dart';
import 'package:elagk/pharmacy/presentation/pharmacy_controllers/pharmacy_producties_controller/pharmacy_producties_state.dart';
import 'package:elagk/shared/global/app_colors.dart';
import 'package:elagk/shared/utils/app_strings.dart';
import 'package:elagk/shared/utils/app_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ElagkStoreSearch extends StatelessWidget {
  final List<String> searchableList = [];
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return BlocBuilder<ElagkStoreCubit, ElagkStoreState>(
      builder: (context, state) {

        ElagkStoreCubit.get(context).products.forEach((element) {
          searchableList.add(element.productName!.toLowerCase());

        });

        return Flexible(
          flex: 1,

          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Row(
              children: [
                Container(
                  color: Color(0x35a9a3),
                  width: width * .75,
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
                      ElagkStoreCubit.get(context)
                          .changeSearchWord(word: value.toString());

                      FocusScope.of(context).unfocus();

                    },
                    onSearchClear: () {
                      print("Cleared Search");
                      ElagkStoreCubit.get(context)
                          .deleteSearch();


                    },
                    onSubmitted: (value, value2) {
                      print("Submitted: " + value);
                      ElagkStoreCubit.get(context)
                          .changeSearchWord(word: value.toString());

                    },
                    onEditingProgress: (value, value2) {
                      print("TextEdited: " + value);

                      ElagkStoreCubit.get(context)
                          .changeSearchWord(word: value.toString());
                    },
                  ),
                ),
                InkWell(
                  onTap: ()
                  {
                    FocusScope.of(context).unfocus();

                    ElagkStoreCubit.get(context).search();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.yellow,
                    ),
                    width: 37,
                    height: 37,
                    child: const Center(
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                        )),
                  ),
                ),
              ],
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
