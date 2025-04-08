import 'package:bloc_practice/profile/profile_bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        backgroundColor: Colors.greenAccent,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocSelector<ProfileBloc, ProfileState, String>(
              selector: (state) => state.name,
              builder: (context, name) {
                return Text("NAME : $name",style: TextStyle(fontSize: 22),);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            BlocSelector<ProfileBloc, ProfileState, int>(
              selector: (state) => state.age,
              builder: (context, age) {
                return Text("NAME : $age");
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  context
                      .read<ProfileBloc>()
                      .updateName("Prakrit Kr");
                },
                child: Text("Change Name")),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  context.read<ProfileBloc>().updateAge(49);
                },
                child: Text("Change Age"))
          ],
        ),
      ),
    );
  }
}
