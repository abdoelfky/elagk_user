import 'package:elagk/pharmacy/data/pharmacy_model.dart';
import 'package:elagk/pharmacy/presentation/pharmacy_controllers/pharmacy_producties_controller/pharmacy_producties_cubit.dart';
import 'package:elagk/pharmacy/presentation/pharmacy_controllers/pharmacy_producties_controller/pharmacy_producties_state.dart';
import 'package:elagk/shared/utils/app_routes.dart';
import 'package:elagk/shared/utils/navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenItem extends StatelessWidget {
  const HomeScreenItem(
      {Key? key,
      required this.name,
      required this.image,
      required this.SuperCategoryId,
      required this.pharmacyModel,})
      : super(key: key);
  final String name;
  final PharmacyModel pharmacyModel;
  final String image;
  final int SuperCategoryId;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<PharmacyProductiesCubit, PharmacyProductiesStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return InkWell(
          onTap: () {
            PharmacyProductiesCubit.get(context)
                .getCategories(SuperCategoryId: SuperCategoryId,
                )
                .then((value) {
              navigateTo(
                context: context,
                screenRoute: Routes.categories,
                arguments: pharmacyModel,

              );
            });
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
      },
    );
  }
}
