import 'package:elagk/pharmacy/data/pharmacy_model.dart';
import 'package:elagk/pharmacy/presentation/pharmacy_controllers/categories_controller/categories_cubit.dart';
import 'package:elagk/pharmacy/presentation/pharmacy_controllers/categories_controller/categories_state.dart';
import 'package:elagk/shared/global/app_colors.dart';
import 'package:elagk/shared/utils/app_routes.dart';
import 'package:elagk/shared/utils/app_strings.dart';
import 'package:elagk/shared/utils/app_values.dart';
import 'package:elagk/shared/utils/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class PharmacyItem extends StatelessWidget {
  final PharmacyModel pharmacy;
  const PharmacyItem({Key? key, required this.pharmacy}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit,CategoriesStates>(
  builder: (context, state) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: InkWell(
        onTap: () {
          CategoriesCubit.get(context).changeStringsToDef();
          navigateTo(context: context,
              screenRoute:Routes.pharmacy,
              arguments:pharmacy );
        },
        child: Container(
          width: mediaQueryWidth(context) * .4,
          height: mediaQueryHeight(context) * .09,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  color: Colors.white
              )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image(
                image: NetworkImage(
                  pharmacy.imageUrl!,
                ),
                width: mediaQueryWidth(context) * .35,
                height: mediaQueryHeight(context) * .12,
              ),
              SizedBox(
                height: 10,
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pharmacy.pharmacyName!,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:
                    [
                      const Icon(Icons.location_on_outlined,color: Colors.green,size: 18,),
                      const SizedBox(width: 5,),
                      Text('الاسكندريه-الشاطئ النيل',
                        style: Theme.of(context).textTheme.bodyMedium,
                      )
                    ],
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  },
);
  }
}




