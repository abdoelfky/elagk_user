import 'package:elagk/drawer/presentation/components/fixed_appbar_widget.dart';
import 'package:elagk/shared/utils/app_strings.dart';
import 'package:elagk/shared/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../components/about_us/about_us_content_widget.dart';
import '../components/error_screen.dart';
import '../components/loading_widget.dart';
import '../controller/about_us_controller/about_us_bloc.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          appBar: fixedAppBar(
            context: context,
            title: AppStrings.aboutUs,
          ),
          body: BlocBuilder<AboutUsBloc, AboutUsState>(
            builder: (BuildContext context, state) {
              switch (state.aboutUsFirstRequestState) {
                case RequestState.loading:
                  return const LoadingWidget(showDrawer: false);
                case RequestState.loaded:
                  return const AboutUsContent();
                case RequestState.error:
                  return const ErrorScreen();
              }return const ErrorScreen();
            },
          ),
        ),
      ),
    );
  }
}
