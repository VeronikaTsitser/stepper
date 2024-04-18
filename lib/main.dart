import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper/features/stepper/data/stepper_repository_impl.dart';
import 'package:stepper/features/stepper/logic/bloc/stepper_bloc.dart';
import 'package:stepper/features/stepper/presentation/stepper_home_screen.dart';

void main() {
  runApp(const StepperApp());
}

class StepperApp extends StatelessWidget {
  const StepperApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: RepositoryProvider(
        create: (context) => StepperRepositoryImpl(),
        child: BlocProvider(
          create: (context) => StepperBloc(context.read<StepperRepositoryImpl>()),
          child: const StepperHomeScreen(),
        ),
      ),
    );
  }
}
