import 'package:advanced_search/advanced_search.dart';
import 'package:elagk/shared/global/app_colors.dart';
import 'package:elagk/shared/utils/app_strings.dart';
import 'package:elagk/shared/utils/app_values.dart';
import 'package:flutter/material.dart';

class SearchCategoriesWidget extends StatelessWidget {
  final List<String> searchableList = [
    "Orange",
    "Apple",
    "Banana",
    "Mango Orange",
    "Carrot Apple",
    "Yellow Watermelon",
    "Zhe Fruit",
    "White Oats",
    "Dates",
    "Raspberry Blue",
    "Green Grapes",
    "Red Grapes",
    "Dragon Fruit"
  ];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Flexible(
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
                },
                onSearchClear: () {
                  print("Cleared Search");
                },
                onSubmitted: (value, value2) {
                  print("Submitted: " + value);
                },
                onEditingProgress: (value, value2) {
                  print("TextEdited: " + value);
                  print("LENGTH: " + value2.length.toString());
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.yellow,
              ),
              width: width * .1,
              height: height * .05,
              child: const Center(
                  child: Icon(
                Icons.search,
                color: Colors.white,
              )),
            ),
          ],
        ),
      ),
    );
  }

  Widget searchWidget(String text) {
    return ListTile(
      title: Text(
        text.length > 3 ? text.substring(0, 3) : text,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.indigoAccent),
      ),
      subtitle: Text(
        text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 12,
          color: Colors.white,
        ),
      ),
    );
  }
}
