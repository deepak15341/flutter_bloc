import 'package:bloc_practice/Login/login_model/login_responce_model.dart';
import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable{}

class LoginInitState extends LoginState{
  @override
  List<Object?> get props => [];

}

class LoginLoadingState extends LoginState{
  @override
  List<Object?> get props => [];

}

class LoginLoadedState extends LoginState{
  final LoginResponseModel loginResponseModel;
  LoginLoadedState({required this.loginResponseModel});
  @override
  List<Object?> get props => [loginResponseModel];

}


class LoginErrorState extends LoginState{
  final String error;
  LoginErrorState({required this.error});
  @override
  List<Object?> get props => [error];

}