import 'package:bloc/bloc.dart';
import 'package:elagk/drawer/data/models/contact_us_model.dart';
import 'package:elagk/shared/network/api_constants.dart';
import 'package:elagk/shared/network/dio_helper.dart';
import 'package:elagk/shared/utils/app_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import 'contact_us_state.dart';

class ContactUsCubit extends Cubit<ContactUsState> {
  ContactUsCubit() : super(ContactUsCubitInitialState());

  static ContactUsCubit get(context) => BlocProvider.of(context);

  ContactUsModel? contactUsModel;

  Future<void> getContactUs() async {
    emit(GetContactUsLoadingState());

    await DioHelper.getData(url: ApiConstants.contactUs).then((value) {
      contactUsModel = ContactUsModel.fromJson(value.data);
      emit(GetContactUsSuccessState());
      // print(contactUsModel!.address!);
    }).catchError((onError) {
      emit(GetContactUsErrorState(onError.toString()));
    });
  }

  Future<void> openMap(double latitude, double longitude) async {
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }


void phoneCall()
{
  launch("tel:${contactUsModel!.phoneNumber}");
}


  void whatsApp()
  {
    launch("https://wa.me/+20${contactUsModel!.whatsApp}?text=${AppConstants.whatsappMessage}");
  }

  void faceBook()
  {
    launch("https://www.facebook.com/${contactUsModel!.facebook}");
  }

  void instagram()
  {
    launch("  https://www.instagram.com/${contactUsModel!.instagram}/");
  }


  Future<void> gmail()
  async {
    final String subject = "Subject:";

    final String stringText = "Same Message:";

    String uri = 'mailto:elagk@gmail.com?subject=${Uri.encodeComponent(subject)}&body=${Uri.encodeComponent(stringText)}';
    if (await canLaunch(uri)) {
  await launch(uri);
  } else {
  print( 'Could not launch $uri');
  }  }




}
