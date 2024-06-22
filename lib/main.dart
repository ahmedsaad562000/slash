import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:slash/bloc/home_bloc.dart';

// import 'package:slash/bloc/home_bloc.dart';
// import 'package:slash/model/di/home_module.dart';
import 'package:slash/model/di/injection.dart';
import 'package:slash/view/screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetIt.instance<HomeBloc>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Slash',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
              backgroundColor: Color.fromARGB(255, 248, 248, 248),
              surfaceTintColor: Color.fromARGB(255, 248, 248, 248)),
          primaryColorLight: const Color.fromARGB(255, 41, 41, 41),
          scaffoldBackgroundColor: const Color.fromARGB(255, 248, 248, 248),
          dialogBackgroundColor: const Color.fromARGB(255, 238, 238, 238),
          iconTheme: const IconThemeData(color: Colors.white),
          cardColor: const Color.fromARGB(255, 41, 41, 41),
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: Colors.deepOrange, // Your accent color
          ),
          textTheme: TextTheme(
            displaySmall: GoogleFonts.urbanist(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: const Color.fromARGB(255, 41, 41, 41),
            ),
            displayMedium: GoogleFonts.urbanist(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: const Color.fromARGB(255, 41, 41, 41),
            ),
            displayLarge: GoogleFonts.urbanist(
              fontSize: 18,
              color: const Color.fromARGB(255, 41, 41, 41),
            ),
            labelSmall: GoogleFonts.urbanist(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: const Color.fromARGB(255, 41, 41, 41),
            ),
            labelMedium: GoogleFonts.urbanist(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: const Color.fromARGB(255, 41, 41, 41),
            ),
            labelLarge: GoogleFonts.urbanist(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 41, 41, 41),
            ),
          ),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => HomeScreen(),
        },
      ),
    );
  }
}
