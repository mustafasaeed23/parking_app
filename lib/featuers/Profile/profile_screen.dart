import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parking_app/core/theme/Styles.dart';
import 'package:parking_app/core/widgets/appbar_widget.dart';
import 'package:parking_app/core/widgets/custom_text_form_field.dart';
import 'package:parking_app/featuers/Auth/bloc/authentication_bloc.dart';
import 'package:parking_app/featuers/Auth/bloc/authentication_event.dart';
import 'package:parking_app/featuers/Auth/bloc/authentication_state.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    final authBloc = BlocProvider.of<AuthenticationBloc>(context);
    
    if (authBloc.state is Authenticated) {
      final userId = (authBloc.state as Authenticated).userId;
      authBloc.add(FetchUserEvent(userId: userId));  // Fetch user data
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: "الملف الشخصي"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            if (state is AuthenticationLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is UserLoaded && state.user != null) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    buildProfileField("اسم المستخدم", state.user.userName),
                    buildProfileField("البريد الإلكتروني", state.user.email),
                    buildProfileField("الهوية", state.user.role ?? "غير متوفر"),
                  ],
                ),
              );
            } else if (state is AuthenticationError) {
              return Center(child: Text("Error: ${state.message}"));
            }
            return Center(child: Text("No user data available"));
          },
        ),
      ),
    );
  }

  Widget buildProfileField(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          label,
          style: getMediumGrey13()
              .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        CustomTextFormField(
          backgroundColor: Colors.grey[200],
          borderColor: Colors.grey.shade100,
          hintText: value,
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
