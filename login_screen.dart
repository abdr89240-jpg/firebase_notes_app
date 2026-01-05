import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
import 'package:flutter_application_1/core/widgets/container_component.dart';
import 'package:flutter_application_1/core/widgets/progress_component.dart';
import 'package:flutter_application_1/core/widgets/text_component.dart';
import 'package:flutter_application_1/core/widgets/textfield_component.dart';
import 'package:flutter_application_1/features/auth/model/view/signup.dart';
import 'package:flutter_application_1/features/home/components/model/view/viewmodel/auth_cubit.dart';
import 'package:flutter_application_1/features/home/components/model/view/viewmodel/auth_state.dart';
import 'package:flutter_application_1/features/home/homestate/viewmodel/home_cubit.dart';
import 'package:flutter_application_1/features/homee/view/addnote.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../home/components/model/view/viewmodel/auth_cubit.dart'
    show AuthCubit;

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
     final hei=MediaQuery.of(context).size.height;
        final wid=MediaQuery.of(context).size.width;
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: BlocConsumer<AuthCubit, AuthState>(
          builder: (context, state) {
            if (state is AuthLoading) {
              return Center(child: ProgressComponent());
            }
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: hei*0.10,),
                  Center(child: TextComponent("Hi,Welcome Back!")),
                  SizedBox(height: hei*0.06),
                  TextfieldComponent("Email", "example@gmail.com",emailController),
                  SizedBox(height: 10),
                  TextfieldComponent(
                    "Password",
                    "Enter Your Password",
                    passwordController,
                  ),
                  SizedBox(height: hei*0.1),
                  GestureDetector(
                    onTap: () => context.read<AuthCubit>().login(
                      emailController.text,
                      passwordController.text,
                    ),
                    child: ContainerComponent("Login",wid*.75,hei*.07),
                  ),
                  SizedBox(height: 16),
                  GestureDetector(
                    onTap: () => context.read<AuthCubit>().login(
                      emailController.text,
                      passwordController.text,
                    ),
                      
                    child: ContainerComponent("Continue With Google",wid*0.75,hei*0.07 ),
                  ),
                  SizedBox(height: hei*0.17),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => BlocProvider.value(
                            value: context.read<AuthCubit>(),
                            child: Signup(),
                          ),
                        ),
                      );
                    },
                    child: Text(
                      "Don't have an account ? Sign Up",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                ],
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
                MaterialPageRoute(builder: (context) =>Addnote()),
                (Route) => false,
              );
            }
          },
        ),
      ),
    );
  }
}

