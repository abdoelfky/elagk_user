import 'package:elagk/shared/utils/app_routes.dart';
import 'package:elagk/shared/utils/navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HomeScreenItem extends StatelessWidget {
  const HomeScreenItem({Key? key,required this.name,
    required this.image}) : super(key: key);
  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  InkWell(
      onTap: () {
        navigateTo(
            context: context,
            screenRoute: Routes.categories);
      },
      child: Container(
        width: size.width * .4,
        height: size.height * .2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: Colors.blue,
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(
                image,
              ),
              width: size.width * .27,
              height: size.height * .1,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              name,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}


