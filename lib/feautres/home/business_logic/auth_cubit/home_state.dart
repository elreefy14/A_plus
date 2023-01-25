part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}
//HomeLoadingState
class HomeLoadingState extends HomeState {}
//HomeSuccessState
class HomeSuccessState extends HomeState {}
//enrollLoadingState
class enrollLoadingState extends HomeState {}
//enrollSuccessState
class enrollSuccessState extends HomeState {}
//enrollErrorState
class enrollErrorState extends HomeState {}
//HomeErrorState
class HomeErrorState extends HomeState {}