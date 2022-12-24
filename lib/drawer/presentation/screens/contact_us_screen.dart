import 'package:elagk/drawer/presentation/components/fixed_appbar_widget.dart';
import 'package:elagk/shared/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
    // return Directionality(
    //   textDirection: TextDirection.rtl,
    //   child: SafeArea(
    //     child: Scaffold(
    //       appBar: fixedAppBar(
    //         context: context,
    //         title: AppStrings.contactUs,
    //       ),
    //       body: BlocBuilder<AboutUsBloc, AboutUsState>(
    //         builder: (BuildContext context, state) {
    //           switch (state.contactUsRequestState) {
    //             case RequestState.loading:
    //               return const LoadingWidget(showDrawer: false);
    //             case RequestState.loaded:
    //               return const ContactUsContent();
    //             case RequestState.error:
    //               return const ErrorScreen();
    //           }
    //         },
    //       ),
    //     ),
    //   ),
    // );
  }
}
