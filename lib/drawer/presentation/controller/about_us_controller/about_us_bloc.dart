import 'dart:async';
import 'dart:io';

import 'package:elagk_pharmacy/core/usecase/base_usecase.dart';
import 'package:elagk_pharmacy/core/utils/app_constants.dart';
import 'package:elagk_pharmacy/core/utils/app_strings.dart';
import 'package:elagk_pharmacy/core/utils/enums.dart';
import 'package:elagk_pharmacy/drawer/domain/entities/about_us_entity.dart';
import 'package:elagk_pharmacy/drawer/domain/entities/contact_us_entity.dart';
import 'package:elagk_pharmacy/drawer/domain/usecases/get_about_us_first_usecase.dart';
import 'package:elagk_pharmacy/drawer/domain/usecases/get_about_us_second_usecase.dart';
import 'package:elagk_pharmacy/drawer/domain/usecases/get_contact_us_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

part 'about_us_event.dart';

part 'about_us_state.dart';

class AboutUsBloc extends Bloc<AboutUsEvent, AboutUsState> {
  final GetContactUsUseCase getContactUsUseCase;
  final GetAboutUsFirstUseCase getAboutUsFirstUseCase;
  final GetAboutUsSecondUseCase getAboutUsSecondUseCase;

  AboutUsBloc(this.getContactUsUseCase, this.getAboutUsFirstUseCase,
      this.getAboutUsSecondUseCase)
      : super(const AboutUsState()) {
    on<GetContactUsEvent>(_getContactUs);
    on<GetAboutUsFirstEvent>(_getAboutUsFirst);
    on<GetAboutUsSecondEvent>(_getAboutUsSecond);
    on<ContactUsViaCallEvent>(_contactUsViaCall);
    on<ContactUsViaLocationEvent>(_contactUsViaLocation);
    on<ContactUsViaEmailEvent>(_contactUsViaEmail);
    on<ContactUsViaWhatsappEvent>(_contactUsViaWhatsApp);
    on<ContactUsViaFacebookEvent>(_contactUsViaFacebook);
    on<ContactUsViaInstagramEvent>(_contactUsViaInstagram);
  }

  // Contact us screen methods.
  FutureOr<void> _getContactUs(
    GetContactUsEvent event,
    Emitter<AboutUsState> emit,
  ) async {
    final result = await getContactUsUseCase(const NoParameters());
    result.fold(
      (l) {
        emit(
          state.copyWith(
            contactUsRequestState: RequestState.error,
            contactUsMessage: l.message,
          ),
        );
      },
      (r) {
        emit(
          state.copyWith(
            contactUsRequestState: RequestState.loaded,
            contactUs: r,
          ),
        );
      },
    );
  }

  FutureOr<void> _contactUsViaCall(
    ContactUsViaCallEvent event,
    Emitter<AboutUsState> emit,
  ) async {
    final Uri launchUri = Uri(
      scheme: AppConstants.telScheme,
      path: state.contactUs!.phoneNumber,
    );
    await launchUrl(launchUri);
  }

  FutureOr<void> _contactUsViaLocation(
    ContactUsViaLocationEvent event,
    Emitter<AboutUsState> emit,
  ) async {
    if (await canLaunchUrl(
        Uri.parse(AppConstants.locationUrl(event.latitude, event.longitude)))) {
      await launchUrl(
          Uri.parse(AppConstants.locationUrl(event.latitude, event.longitude)));
    }
  }

  FutureOr<void> _contactUsViaEmail(
    ContactUsViaEmailEvent event,
    Emitter<AboutUsState> emit,
  ) async {
    if (await canLaunchUrl(Uri.parse(AppConstants.emailUrl(event.email)))) {
      await launchUrl(Uri.parse(AppConstants.emailUrl(event.email)));
    }
  }

  FutureOr<void> _contactUsViaWhatsApp(
    ContactUsViaWhatsappEvent event,
    Emitter<AboutUsState> emit,
  ) async {
    if (Platform.isIOS) {
      // for iOS phone only
      if (await canLaunchUrl(
          Uri.parse(AppConstants.whatsappUrlIos(event.whatsApp)))) {
        await launchUrl(Uri.parse(AppConstants.whatsappUrlIos(event.whatsApp)));
      } else {
        ScaffoldMessenger.of(event.context).showSnackBar(
          const SnackBar(
            content: Text(AppStrings.whatsappIsNotInstalled),
          ),
        );
      }
    } else {
      // android
      if (await canLaunchUrl(
          Uri.parse(AppConstants.whatsappUrlAndroid(event.whatsApp)))) {
        await launchUrl(
            Uri.parse(AppConstants.whatsappUrlAndroid(event.whatsApp)));
      } else {
        ScaffoldMessenger.of(event.context).showSnackBar(
          const SnackBar(
            content: Text(AppStrings.whatsappIsNotInstalled),
          ),
        );
      }
    }
  }

  FutureOr<void> _contactUsViaFacebook(
    ContactUsViaFacebookEvent event,
    Emitter<AboutUsState> emit,
  ) async {
    if (await canLaunchUrl(
        Uri.parse(AppConstants.facebookUrl(event.facebook)))) {
      await launchUrl(Uri.parse(AppConstants.facebookUrl(event.facebook)));
    }
  }

  FutureOr<void> _contactUsViaInstagram(
    ContactUsViaInstagramEvent event,
    Emitter<AboutUsState> emit,
  ) async {
    if (await canLaunchUrl(
        Uri.parse(AppConstants.instagramUrl(event.instagram)))) {
      await launchUrl(Uri.parse(AppConstants.instagramUrl(event.instagram)));
    }
  }

  // About us screen methods.
  FutureOr<void> _getAboutUsFirst(
    GetAboutUsFirstEvent event,
    Emitter<AboutUsState> emit,
  ) async {
    final result = await getAboutUsFirstUseCase(const GetAboutUsFirstParameters(
        whoAreWe: AppConstants.whoAreWeParameter));
    result.fold(
      (l) {
        emit(
          state.copyWith(
            aboutUsFirstRequestState: RequestState.error,
            aboutUsFirstMessage: l.message,
          ),
        );
      },
      (r) {
        emit(
          state.copyWith(
            aboutUsFirstRequestState: RequestState.loaded,
            aboutUsFirst: r,
          ),
        );
      },
    );
  }

  FutureOr<void> _getAboutUsSecond(
    GetAboutUsSecondEvent event,
    Emitter<AboutUsState> emit,
  ) async {
    final result = await getAboutUsSecondUseCase(
        const GetAboutUsSecondParameters(vision: AppConstants.visionParameter));
    result.fold(
      (l) {
        emit(
          state.copyWith(
            aboutUsSecondRequestState: RequestState.error,
            aboutUsSecondMessage: l.message,
          ),
        );
      },
      (r) {
        emit(
          state.copyWith(
            aboutUsSecondRequestState: RequestState.loaded,
            aboutUsSecond: r,
          ),
        );
      },
    );
  }
}
