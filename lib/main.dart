import 'package:betting_app/app/modules/Dashboard/presentation/bottom_nav_bar.dart';
import 'package:betting_app/app/modules/MatchDetails/bloc/match_details_bloc.dart';
import 'package:betting_app/app/modules/MatchDetails/domain/service/match_details_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MatchDetailsBloc>(
          create: (context) => MatchDetailsBloc(MatchDetailsService()),
        ),
      ],
      child: const MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home: BottomNavBar(),
      ),
    );
  }
}
