import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'past_orders_state.dart';

class PastOrdersCubit extends Cubit<PastOrdersStates> {
    PastOrdersCubit() : super(PastOrdersInitialState());


}
