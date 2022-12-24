import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ComplaintsScreen extends StatelessWidget {
  const ComplaintsScreen({Key? key}) : super(key: key);
  static final _formKey = GlobalKey<FormState>();
  static final _titleController = TextEditingController();
  static final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container();
    // return BlocProvider(
    //   create: (context) => sl<ComplaintsBloc>(),
    //   child: Directionality(
    //     textDirection: TextDirection.rtl,
    //     child: SafeArea(
    //       child: Scaffold(
    //         resizeToAvoidBottomInset: true,
    //         appBar: fixedAppBar(
    //           context: context,
    //           title: AppStrings.suggestionsAndComplaints,
    //         ),
    //         body: ScreenBackground(
    //           child: SingleChildScrollView(
    //             padding: const EdgeInsets.all(AppPadding.p10),
    //             child: Form(
    //               key: _formKey,
    //               child: Column(
    //                 children: [
    //                   SizedBox(height: mediaQueryHeight(context) / AppSize.s30),
    //                   MainTextFormField(
    //                     controller: _titleController,
    //                     obscure: false,
    //                     validator: (value) {
    //                       if (value!.length < AppSize.s3) {
    //                         return AppStrings.enterValidComplaintTitle;
    //                       } else {
    //                         return null;
    //                       }
    //                     },
    //                     inputType: TextInputType.text,
    //                     label: AppStrings.complaintTitle,
    //                   ),
    //                   SizedBox(height: mediaQueryHeight(context) / AppSize.s40),
    //                   MainTextFormField(
    //                     controller: _descriptionController,
    //                     obscure: false,
    //                     maxLines: AppSize.si5,
    //                     validator: (value) {
    //                       if (value!.length < AppSize.s3) {
    //                         return AppStrings.enterValidComplaintDetails;
    //                       } else {
    //                         return null;
    //                       }
    //                     },
    //                     inputType: TextInputType.multiline,
    //                     label: AppStrings.complaintDetails,
    //                   ),
    //                   SizedBox(height: mediaQueryHeight(context) / AppSize.s30),
    //                   // cubit.isLoadingAuth ? const Center(child: CircularProgressIndicator(color: AppColors.primary),) :
    //                   BlocBuilder<ComplaintsBloc, ComplaintsState>(
    //                     builder: (context, state) {
    //                       return WideButton(
    //                         title: AppStrings.sendRequest,
    //                         color: AppColors.offBlue,
    //                         onPressed: () {
    //                           if (_formKey.currentState!.validate()) {
    //                             context.read<ComplaintsBloc>().add(
    //                               SendComplaintEvent(
    //                                 context: context,
    //                                 issueType: _titleController.text,
    //                                 issueDescription: _descriptionController.text,
    //                               ),
    //                             );
    //                           }
    //                         },
    //                       );
    //                     },
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
