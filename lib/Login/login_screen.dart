import 'dart:convert';

import 'package:bloc_practice/Login/login_bloc/login_event.dart';
import 'package:bloc_practice/Login/login_bloc/login_state.dart';
import 'package:bloc_practice/Login/login_model/login_request_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_bloc/login_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});


  @override
  Widget build(BuildContext context) {
    final loginBloc = context.read<LoginBloc>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Login Page"),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (BuildContext context, state) {
            if (state is LoginInitState) {
              return Column(
                children: [
                  TextField(
                    decoration: InputDecoration(hintText: "userName"),
                    controller: loginBloc.userNameController,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextField(
                    decoration: InputDecoration(hintText: "Password"),
                    controller: loginBloc.passwordController,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (loginBloc.userNameController.text.isNotEmpty &&
                            loginBloc.passwordController.text.isNotEmpty) {
                          BlocProvider.of<LoginBloc>(context).add(
                              LoginRequestEvent(
                                  loginRequestModel: LoginRequestModel(
                                      username: loginBloc.userNameController.text,
                                      password: loginBloc.passwordController.text)));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content:
                                  Text("Username and password can't br empty"),
                            ),
                          );
                        }
                      },
                      child: Text("Login"))
                ],
              );
            }
            else if (state is LoginLoadingState) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.green,
                ),
              );
            }
            else if(state is LoginLoadedState){
              return Center(child: Text("${state.loginResponseModel.email}"),);
            }
            else if(state is LoginErrorState){
              return Center(child: Text("${jsonDecode(state.error)["message"]}"),);
            }
            else {
              return Container();
            }
          },
        ),
      )),
    );
  }
}
