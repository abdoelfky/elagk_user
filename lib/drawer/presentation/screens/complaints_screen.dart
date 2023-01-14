import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:elagk/auth/presentation/components/MainTextFormField.dart';
import 'package:elagk/auth/presentation/components/screen_background.dart';
import 'package:elagk/drawer/presentation/components/complaints_components/wide_button_widget.dart';
import 'package:elagk/drawer/presentation/components/fixed_appbar_widget.dart';
import 'package:elagk/drawer/presentation/controller/complaints_controller/complaints_cubit.dart';
import 'package:elagk/home/presentation/components/app_bar_basket_icon.dart';
import 'package:elagk/shared/components/alert_dialoge.dart';
import 'package:elagk/shared/components/toast_component.dart';
import 'package:elagk/shared/global/app_colors.dart';
import 'package:elagk/shared/utils/app_assets.dart';
import 'package:elagk/shared/utils/app_routes.dart';
import 'package:elagk/shared/utils/app_strings.dart';
import 'package:elagk/shared/utils/app_values.dart';
import 'package:elagk/shared/utils/navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class ComplaintsScreen extends StatelessWidget {
  ComplaintsScreen({Key? key}) : super(key: key);
  static final _formKey = GlobalKey<FormState>();
  static final _titleController = TextEditingController();
  static final _descriptionController = TextEditingController();
  bool _hasInternet = false;

  @override
  Widget build(BuildContext context) {
    return ScreenBackground(
      textDirection: TextDirection.rtl,

      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: fixedAppBar(
            context: context,
            title: AppStrings.suggestionsAndComplaints,
            actionWidget: const AppBarBasketIcon(),
            onTap: () {
              navigateTo(
                context: context,
                screenRoute: Routes.basketScreen,
              );
            },
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(AppPadding.p10),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: mediaQueryHeight(context) / AppSize.s30),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: MainTextFormField(
                      controller: _titleController,
                      textDirection: TextDirection.rtl,
                      isObsecured: false,
                      validator: (value) {
                        if (value!.length < AppSize.s3) {
                          return AppStrings.enterValidComplaintTitle;
                        } else {
                          return null;
                        }
                      },
                      inputType: TextInputType.text,
                      label: AppStrings.complaintTitle,
                    ),
                  ),
                  SizedBox(height: mediaQueryHeight(context) / AppSize.s40),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: MainTextFormField(
                      controller: _descriptionController,
                      textDirection: TextDirection.rtl,
                      isObsecured: false,
                      maxLines: AppSize.si5,
                      validator: (value) {
                        if (value!.length < AppSize.s3) {
                          return AppStrings.enterValidComplaintDetails;
                        } else {
                          return null;
                        }
                      },
                      inputType: TextInputType.multiline,
                      label: AppStrings.complaintDetails,
                    ),
                  ),

                  SizedBox(height: mediaQueryHeight(context) / AppSize.s30),
                  // cubit.isLoadingAuth ? const Center(child: CircularProgressIndicator(color: AppColors.primary),) :
                  BlocConsumer<ComplaintsCubit, ComplaintsState>(
                    listener: (context, state) {
                      if (state is SendComplaintSuccessState) {
                        // showToast(
                        //     text: 'Complaint Sent Successfully',
                        //     state: ToastStates.SUCCESS);
                        showDialog(
                            context: context,
                            builder: (_) {
                              return alertDialog(
                                imageSrc: JsonAssets.complaints,
                                text:
                                    'شكرا ليك يسعدنا دايما انك معانا وهنرد على شكاوك في اقرب وقت',
                              );
                            });
                        _titleController.text = '';
                        _descriptionController.text = '';
                      } else if (state is SendComplaintErrorState) {
                        showToast(
                            text: "${state.error}", state: ToastStates.ERROR);
                      }
                    },
                    builder: (context, state) {
                      return ConditionalBuilder(
                          condition: (state is SendComplaintLoadingState),
                          builder: (BuildContext context) =>
                              CircularProgressIndicator(),
                          fallback: (BuildContext context) => WideButton(
                              title: AppStrings.sendRequest,
                              color: AppColors.offBlue,
                              onPressed: () async {
                                _hasInternet =
                                    await InternetConnectionChecker()
                                        .hasConnection;
                                if (_hasInternet) {
                                  if (_formKey.currentState!.validate()) {
                                    ComplaintsCubit.get(context)
                                        .sendComplaint(
                                            issueType: _titleController.text,
                                            issueDescription:
                                                _descriptionController.text);
                                  }
                                }
                              }));
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
