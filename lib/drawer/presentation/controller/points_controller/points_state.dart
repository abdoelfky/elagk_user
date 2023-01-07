part of 'points_cubit.dart';

@immutable
abstract class PointsState {}

class PointsInitial extends PointsState {}
class GetUserPointsLoadingState extends PointsState {}
class GetUserPointsSuccessState extends PointsState {}
class GetUserPointsErrorState extends PointsState {}
