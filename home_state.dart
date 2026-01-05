import 'package:flutter_application_1/features/home/homestate/model/home_model.dart';

class HomeState {}
class HomeInitial extends HomeState{}
class HomeLoading extends HomeState{}
class HomeLoaded extends HomeState{
  List<HomeModel>not;
  HomeLoaded({required this.not});
}
class HomeError extends HomeState{
  String mess;
  HomeError({required this.mess});
}
class LogOut extends HomeState{}