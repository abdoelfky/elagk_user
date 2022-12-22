import 'package:elagk/home/presentation/components/one_order_details/one_order_details_body.dart';
import 'package:flutter/material.dart';

class OneOrderDetailsScreen extends StatelessWidget {
  const OneOrderDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: // TODO.
            // cubit.oneOrderModel != null ? const LoadingWidget() :
            OneOrderDetailsBody(),
      ),
    );
  }
}
