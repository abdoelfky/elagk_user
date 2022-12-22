import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../auth/presentation/components/MainTextFormField.dart';
import '../../../auth/presentation/components/screen_background.dart';
import '../../../shared/global/app_colors.dart';
import '../../../shared/utils/app_strings.dart';
import '../../../shared/utils/app_values.dart';
import '../components/complaints/wide_button_widget.dart';
import '../components/fixed_appbar_widget.dart';
import '../controller/complaints_controller/complaints_bloc.dart';

class ComplaintsScreen extends StatelessWidget {
  const ComplaintsScreen({Key? key}) : super(key: key);
  static final _formKey = GlobalKey<FormState>();
  static final _titleController = TextEditingController();
  static final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => <ComplaintsBloc>(),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: fixedAppBar(
              context: context,
              title: AppStrings.suggestionsAndComplaints,
            ),
            body: ScreenBackground(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(AppPadding.p10),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(height: mediaQueryHeight(context) / AppSize.s30),
                      MainTextFormField(
                        controller: _titleController,
                        obscure: false,
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
                      SizedBox(height: mediaQueryHeight(context) / AppSize.s40),
                      MainTextFormField(
                        controller: _descriptionController,
                        obscure: false,
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
                      SizedBox(height: mediaQueryHeight(context) / AppSize.s30),
                      // cubit.isLoadingAuth ? const Center(child: CircularProgressIndicator(color: AppColors.primary),) :
                      BlocBuilder<ComplaintsBloc, ComplaintsState>(
                        builder: (context, state) {
                          return WideButton(
                            title: AppStrings.sendRequest,
                            color: AppColors.offBlue,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                context.read<ComplaintsBloc>().add(
                                  SendComplaintEvent(
                                    context: context,
                                    issueType: _titleController.text,
                                    issueDescription: _descriptionController.text,
                                  ),
                                );
                              }
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
