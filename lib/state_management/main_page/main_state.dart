part of 'main_cubit.dart';

@immutable
abstract class MainState {}

class MainInitial extends MainState {}

class MainLoadingState extends MainState {}

class MainLoadedState extends MainState {
  final List<ServiceData> services;

  MainLoadedState(this.services);
}

class MainErrorState extends MainState {}
