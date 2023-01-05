import 'package:elagk/drawer/data/models/profile/user_profile_model.dart';
import 'package:elagk/home/presentation/controllers/home_screen_controller/home_screen_cubit.dart';
import 'package:elagk/home/presentation/controllers/home_screen_controller/home_screen_state.dart';
import 'package:elagk/shared/global/app_colors.dart';
import 'package:elagk/shared/local/shared_preference.dart';
import 'package:elagk/shared/utils/app_constants.dart';
import 'package:elagk/shared/utils/app_values.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserDrawerHeader extends StatelessWidget {
  const UserDrawerHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenCubit, HomeScreenState>(
  builder: (context, state) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p15),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 27.0,
              backgroundImage:
              (  AppConstants.userModel?.profilePicturePath != null &&
                  AppConstants.userModel?.toString().toLowerCase() != null ) ?
              NetworkImage(
                  '${AppConstants.userModel?.profilePicturePath}') :
              AssetImage(
                'assets/images/menu/user.png',
              ) as ImageProvider,
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Text(
            AppConstants.userModel!= null ?
            AppConstants.userModel?.firstName!
                :
            CacheHelper.getData(key: AppConstants.userName)
            ,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  },
);
  }
}


