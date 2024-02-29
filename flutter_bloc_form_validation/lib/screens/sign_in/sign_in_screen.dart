import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_form_validation/screens/sign_in/bloc/sign_in_bloc.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title});

  final String title;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Sign In With Email"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<SignInBloc, SignInState>(
              builder: (context, state) {
                if (state is SignInErrorState) {
                  return Text(
                    state.errorMessage,
                    style: const TextStyle(color: Colors.red),
                  );
                } else {
                  return const Text("");
                }
              },
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: emailController,
              onChanged: (value) {
                BlocProvider.of<SignInBloc>(context).add(
                    SignInTextChangedEvent(value, passwordController.text));
              },
              decoration: const InputDecoration(hintText: "Email Address"),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: passwordController,
              onChanged: (value) {
                BlocProvider.of<SignInBloc>(context)
                    .add(SignInTextChangedEvent(emailController.text, value));
              },
              decoration: const InputDecoration(hintText: "Password"),
            ),
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<SignInBloc, SignInState>(
              builder: (context, state) {
                if (state is SignInLoadingState) {
                  return CircularProgressIndicator();
                }
                return CupertinoButton(
                  color:
                      (state is SignInValidState) ? Colors.blue : Colors.grey,
                  onPressed: () {
                    if (state is SignInValidState) {
                      BlocProvider.of<SignInBloc>(context).add(
                          SignInSubmittedEvent(
                              emailController.text, passwordController.text));
                    }
                  },
                  child: const Text("SignIn"),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
