import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_form_validation/screens/sign_in/bloc/sign_in_bloc.dart';
import 'package:flutter_bloc_form_validation/screens/sign_in/sign_in_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text("Hello"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BlocProvider(
                create: (context) => SignInBloc(),
                child: MyHomePage(title: ""),
              ),
            ),
          );
        },
      ),
    );
  }
}
