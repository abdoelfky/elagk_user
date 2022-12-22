import 'package:elagk_pharmacy/core/utils/app__fonts.dart';
import 'package:elagk_pharmacy/core/utils/app_values.dart';
import 'package:flutter/material.dart';

class ContactUsContainer extends StatelessWidget {
  const ContactUsContainer({
    Key? key,
    required this.title,
    required this.imageSrc,
    required this.details,
    required this.onTap,
  }) : super(key: key);
  final String imageSrc;
  final String title;
  final String details;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: AppSize.s70,
      padding: const EdgeInsets.all(AppPadding.p10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppSize.s10),
      ),
      child: Row(children: [
        Image.asset(
          imageSrc,
          width: AppSize.s26,
          height: AppSize.s26,
          fit: BoxFit.cover,
        ),
        const SizedBox(width: AppSize.s15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Text(
                title,
                maxLines: AppSize.si2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Colors.black,
                    ),
              ),
            ),
            Flexible(
              child: InkWell(
                onTap: onTap,
                child: FittedBox(
                  child: Text(
                    details,
                    maxLines: AppSize.si2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          fontWeight: FontWeightManager.medium,
                        ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
