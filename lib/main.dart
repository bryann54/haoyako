import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haoyako/features/home/presentation/pages/home_screen.dart';
import 'package:haoyako/features/theme/presentation/bloc/theme_bloc.dart';
import 'package:haoyako/features/authentication/presentation/bloc/authentication_bloc.dart'; // Make sure this path is correct

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeBloc()),
        BlocProvider(
            create: (context) =>
                AuthenticationBloc()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, themeState) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: themeState.themeData,
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}
