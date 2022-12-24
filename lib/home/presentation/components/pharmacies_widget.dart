import 'package:elagk/home/presentation/components/pharmacy_item.dart';
import 'package:elagk/shared/utils/app_strings.dart';
import 'package:flutter/material.dart';

class PharmaciesWidget extends StatelessWidget {
  const PharmaciesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children:
    [
      Row(
        children: [
          Text(AppStrings.pharmacies,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
      ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
          itemBuilder: (context,index)=>PharmacyItem(context),
          separatorBuilder: (context,index)=>SizedBox(height: 20,),
          itemCount: 10)
    ],);
  }
}
