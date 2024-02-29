part of 'internet_bloc_bloc.dart';

@immutable
sealed class InternetBlocEvent {}

// internet Lost event
class InternetLostEvent extends InternetBlocEvent {}

// internet gain event
class InternetGainEvent extends InternetBlocEvent {}
