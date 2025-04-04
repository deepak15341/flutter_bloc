 import 'package:bloc_practice/Login/login_model/login_request_model.dart';
import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable{}

class LoginRequestEvent extends LoginEvent{
  final LoginRequestModel loginRequestModel;
  LoginRequestEvent({required this.loginRequestModel});

  @override
  List<Object?> get props => [loginRequestModel];

}