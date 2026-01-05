import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
import 'package:flutter_application_1/core/widgets/container_component.dart';
import 'package:flutter_application_1/core/widgets/progress_component.dart';
import 'package:flutter_application_1/core/widgets/text_component.dart';
import 'package:flutter_application_1/core/widgets/textfield_component.dart';
import 'package:flutter_application_1/features/home/components/model/view/viewmodel/auth_cubit.dart';
import 'package:flutter_application_1/features/home/components/model/view/viewmodel/auth_state.dart';
import 'package:flutter_application_1/features/homee/view/addnote.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Signup extends StatelessWidget {
  Signup({super.key});

  @override
  Widget build(BuildContext context) {
     final hei=MediaQuery.of(context).size.height;
        final wid=MediaQuery.of(context).size.width;
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    return Scaffold(
      backgroundColor: AppColors.background,
      body: BlocConsumer<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthLoading) ProgressComponent();
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                 SizedBox(height: hei*0.10,),
              
                  Center(child: TextComponent("Create New Account")),
                                    SizedBox(height: hei*0.06),
              
                  TextfieldComponent("Email", "example@gmail.com", emailController),
                  SizedBox(height: 10),
                  TextfieldComponent(
                    "Password",
                    "Enter Your Password",
                    passwordController,
                  ),
                                    SizedBox(height: hei*0.1),
              
                  GestureDetector(
                    onTap: () => context.read<AuthCubit>().Signup(
                      emailController.text,
                      passwordController.text,
                    ),
                    child: ContainerComponent("Sign up",wid*.75,hei*.07 ),
                  ),
                ],
              ),
            ),
          );
        },
        listener: (context, state) {
          if (state is AuthError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          } else if (state is AuthLoaded) {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => Addnote()),
              (Route) => false,
            );
          }
        },
      ),
    );
  }
}
