part of 'internet_cubit.dart';

@immutable
sealed class InternetState {}

final class InternetInitial extends InternetState {}

class InternetGainedState extends InternetState {}

class InternetLostState extends InternetState {}
