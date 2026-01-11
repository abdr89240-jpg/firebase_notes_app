import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
import 'package:flutter_application_1/core/widgets/card_component.dart';
import 'package:flutter_application_1/core/widgets/container_component.dart';
import 'package:flutter_application_1/core/widgets/progress_component.dart';
import 'package:flutter_application_1/features/auth/model/login_screen.dart';
import 'package:flutter_application_1/features/auth/model/view/create_note.dart';
import 'package:flutter_application_1/features/home/homestate/viewmodel/home_cubit.dart';
import 'package:flutter_application_1/features/home/homestate/viewmodel/home_state.dart';
import 'package:flutter_application_1/features/homee/viewmodel/create_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Addnote extends StatelessWidget {
  Addnote({super.key});

  @override
  Widget build(BuildContext context) {
    final hei = MediaQuery.of(context).size.height;
    final wid = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) => HomeCubit()..getData(),
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: BlocConsumer<HomeCubit, HomeState>(
            builder: (context, State) {
              if (State is HomeLoading) return ProgressComponent();
              if (State is HomeLoaded) {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: hei * 0.10),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.of(context)
                                .push(
                                  MaterialPageRoute(
                                    builder: (_) => BlocProvider(
                                      create: (_) => CreateCubit(),
                                      child: CreateNote(),
                                    ),
                                  ),
                                )
                                .then((_) {
                                  context.read<HomeCubit>().getData();
                                }),

                            child: ContainerComponent(
                              "AddNote",
                              wid * 0.4,
                              hei * 0.06,
                            ),
                          ),
                          SizedBox(width: wid * 0.05),

                          GestureDetector(
                            onTap: () {
                              context.read<HomeCubit>().logOut();
                            },

                            child: ContainerComponent(
                              "Log out",
                              wid * .4,
                              hei * 0.06,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 40),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: State.not.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 6),
                              child: ContComp(
                                State.not[index].title,
                                State.not[index].des,
                                State.not[index].time,
                                () {
                                  Navigator.of(context)
                                      .push(
                                        MaterialPageRoute(
                                          builder: (_) => CreateNote(
                                            note: State.not[index],
                                          ),
                                        ),
                                      )
                                      .then((_) {
                                        context.read<HomeCubit>().getData();
                                      });
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              }
              return SizedBox();
            },
            listener: (context, State) {
              if (State is HomeError) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(State.mess)));
              }
              if (State is LogOut) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => LoginScreen()),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
