import 'package:bloc_practice/Login/login_bloc/login_event.dart';
import 'package:bloc_practice/Login/login_bloc/login_state.dart';
import 'package:bloc_practice/Login/login_model/login_responce_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../login_repo/login_repo.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  final LoginRepo _repo = LoginRepo();
  LoginBloc() : super(LoginInitState()) {
    on<LoginRequestEvent>((event, emit) async {
      emit(LoginLoadingState());
      try {
        var response = await _repo.login(event.loginRequestModel);
        LoginResponseModel loginResponseModel =
            LoginResponseModel.fromJson(response);
        emit(LoginLoadedState(loginResponseModel: loginResponseModel));
      } catch (e) {
        emit(LoginErrorState(error: e.toString()));
      }
    });
  }

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

}
