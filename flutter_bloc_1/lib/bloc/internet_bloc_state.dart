part of 'internet_bloc_bloc.dart';

@immutable
sealed class InternetBlocState {}

// initial state. jab bloc load hoga voh waali state.
final class InternetBlocInitial extends InternetBlocState {}

// make state . means if internet come then one state and internet goes than another state.
class InternetLostState extends InternetBlocState {}

class IntenetGainState extends InternetBlocState {}
