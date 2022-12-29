import 'package:bloc/bloc.dart';
import 'package:elagk/drawer/data/models/about_us_model.dart';
import 'package:elagk/drawer/data/models/contact_us_model.dart';
import 'package:elagk/shared/network/api_constants.dart';
import 'package:elagk/shared/network/dio_helper.dart';
import 'package:elagk/shared/utils/app_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import 'about_us_state.dart';

class AboutUsCubit extends Cubit<AboutUsState> {
  AboutUsCubit() : super(AboutUsCubitInitialState());

  static AboutUsCubit get(context) => BlocProvider.of(context);

  AboutUsModel? vision;
  AboutUsModel? whoWeAre;
  Future<void> getAboutUs() async {
    emit(GetAboutUsLoadingState());

    await DioHelper
        .getData(
        url: ApiConstants.aboutUsTypePath('vision'))
        .then((value) async {
      vision = AboutUsModel.fromJson(value.data);
      await DioHelper
          .getData(
          url: ApiConstants.aboutUsTypePath('whoAreWe'));
      whoWeAre = AboutUsModel.fromJson(value.data);

      emit(GetAboutUsSuccessState());
      // print(contactUsModel!.address!);
    }).catchError((onError) {
      emit(GetAboutUsErrorState(onError.toString()));
    });

  }


}
