import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_1/bloc/internet_bloc_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override

  // !
  //-----------------------------*Bloc Builder*---------------------------------//
  // : Screen pe banata
  //-----------------------------*Bloc Listenet*---------------------------------//
  // : Screen pe kuch nahi banayega
  //-----------------------------*Bloc Consumer*---------------------------------//
  // : DONO KA KAAM KREGA
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocConsumer<InternetBlocBloc, InternetBlocState>(
          listener: (context, state) {
            if (state is IntenetGainState) {
              // for cubit state == InteternetGainded State. all same
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Internet Connected!"),
                  backgroundColor: Colors.green,
                ),
              );
            } else if (state is InternetLostState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Internet Not Connected!"),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          builder: (context, state) {
            return BlocBuilder<InternetBlocBloc, InternetBlocState>(
              builder: (context, state) {
                // if(state ==)
                // to check value
                // vs
                // if(state is)
                // to check datatype
                if (state is IntenetGainState) {
                  return const Text("Connected!");
                } else if (state is InternetLostState) {
                  return const Text("Not connected!");
                } else {
                  return const Text("Loading...");
                }
              },
            );
          },
        ),
      ),
    );
  }
}
