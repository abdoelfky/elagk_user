import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'about_us_state.dart';

class AboutUsCubit extends Cubit<AboutUsState> {
  AboutUsCubit(): super(AboutUsCubitInitialState());

  static  AboutUsCubit get(context) => BlocProvider.of(context);




}
