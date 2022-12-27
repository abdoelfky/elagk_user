import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../shared/utils/app_routes.dart';
import '../../../shared/utils/app_values.dart';
import '../../../shared/utils/navigation.dart';
class CategoriesItem extends StatelessWidget {
  final String name;
  final String image;

  const CategoriesItem(BuildContext context,
      {Key? key,
        required this.name,
        required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: () {
        navigateFinalTo(
            context: context,
            screenRoute: Routes.categories);
      },
      child: Container(
        width: double.infinity,
        height: AppSize.s60,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: Colors.white
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              children: [
                Row(

                  mainAxisAlignment: MainAxisAlignment.center,

                  children:
                   [
                    const SizedBox(width: 15,),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Text(name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30
                        ),
                      ),
                    ),
                  ],
                ),

              ],
            ),
            Spacer(),
              CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                image,
              //  'assets/images/make-up.jpg',
              ),
            )

          ],
        ),
      ),
    );
  }
}

