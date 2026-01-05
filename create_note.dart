import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
import 'package:flutter_application_1/core/widgets/container_component.dart';
import 'package:flutter_application_1/core/widgets/progress_component.dart';
import 'package:flutter_application_1/core/widgets/text_component.dart';
import 'package:flutter_application_1/core/widgets/textfield_component.dart';
import 'package:flutter_application_1/features/home/homestate/model/home_model.dart';
import 'package:flutter_application_1/features/home/homestate/viewmodel/home_cubit.dart';
import 'package:flutter_application_1/features/homee/viewmodel/create_cubit.dart';
import 'package:flutter_application_1/features/homee/viewmodel/create_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateNote extends StatelessWidget {
  final HomeModel? note;
 
  CreateNote(
    { this.note}
  
  );

  @override
  Widget build(BuildContext context) {
    final hei = MediaQuery.of(context).size.height;
    final wid = MediaQuery.of(context).size.width;
    final emailController = TextEditingController(text: note?.title??"");
    final passwordController = TextEditingController(text: note?.des??"");
    return BlocProvider<CreateCubit>(
      create: (context) => CreateCubit(),
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: BlocConsumer<CreateCubit, CreateState>(
          builder: (context, state) {
            if (state is CreateLoadingState) return ProgressComponent();
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 80),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: TextComponent("Create New Note"),
                  ),
                  SizedBox(height: 30),
                  TextfieldComponent(
                    "Head line",
                    "Enter Note Address",
                    emailController,
                  ),
                  SizedBox(height: 30),
                  TextfieldComponent(
                    "Description",
                    "Enter Your Description",
                    passwordController,
                  ),
                  SizedBox(height: 280),
                  Center(
                    child: GestureDetector(
                      child: ContainerComponent(
                        "Select Media",
                        wid * 0.75,
                        hei * 0.07,
                      ),
                    ),
                  ),

                  SizedBox(height: 16),
                  Center(
                    child: GestureDetector(
                      
                      onTap: () {
                        if(note==null){
                          
                       context.read<CreateCubit>().create(
                        title: emailController.text,
                        desc: passwordController.text,
                        Userid: FirebaseAuth.instance.currentUser!.uid,
                      );
                        }else{
                          
                       context.read<CreateCubit>().upDate(
                        title: emailController.text,
                        des: passwordController.text,
                        id: note!.id,
                      );
                        }
                      
                      },
                      child: ContainerComponent( "Create", wid * .75, hei * .07),
                    ),
                  ),
                ],
              ),
            );
          },
          listener: (context, state) {
            if (state is CreateLoaded) {
              Navigator.of(context).pop();
              context.read<HomeCubit>().getData();
            }
          },
        ),
      ),
    );
  }
}
