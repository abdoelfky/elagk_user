import 'package:elagk/drawer/data/models/past_orders_model.dart';

abstract class PastOrdersStates {}

class PastOrdersInitialState extends PastOrdersStates {}

class GetPastOrdersLoadingState extends PastOrdersStates {}
class GetPastOrdersSuccessState extends PastOrdersStates
{
  final List<PastOrdersModel> model;

  GetPastOrdersSuccessState(this.model);
}
class GetPastOrdersErrorState extends PastOrdersStates
{
  final String error;

  GetPastOrdersErrorState(this.error);
}
