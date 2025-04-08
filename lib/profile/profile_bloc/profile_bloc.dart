import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileState{
  final String name;
  final int age;

  ProfileState({required this.name,required this.age});
}



class ProfileBloc extends Cubit<ProfileState>{
  ProfileBloc() :super(ProfileState(name: "Prakrit", age: 48));

  void updateName(String name){
    emit(ProfileState(name: name, age: state.age));
  }

    void updateAge(int age){
      emit(ProfileState(name: state.name, age: age));
  }

}