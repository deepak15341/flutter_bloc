import 'package:bloc_practice/Login/login_model/login_request_model.dart';
import 'package:bloc_practice/Network/endpoints.dart';
import '../../main.dart';


class LoginRepo{

  LoginRepo();
  login(LoginRequestModel loginRequestModel) async {
    Map<String, dynamic> request = {"username" : loginRequestModel.username,
    "password" : loginRequestModel.password};
    var res = await api.postRequest(Endpoint.login, request);

    if(res == null || res.isEmpty){
      throw "No Response";
    }else{
      return res;
    }
  }
}