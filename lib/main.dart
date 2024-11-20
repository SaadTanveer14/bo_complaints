import 'package:bo_complaints/app_colors.dart';
import 'package:bo_complaints/bloc/complaints/complaint_event.dart';
import 'package:bo_complaints/bloc/complaints/compliant_bloc.dart';
import 'package:bo_complaints/data/repository/complaints_provider.dart';
import 'package:bo_complaints/data/repository/complaints_repository.dart';
import 'package:bo_complaints/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
    SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: AppColors.primaryColor, // Status bar color
      // systemNavigationBarColor: AppColors.primaryColor, // Navigation bar color
      // systemNavigationBarIconBrightness: Brightness.light, // Icons color on navigation bar
    ),
  );
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
          create: (context) => ComplaintsBloc(
            ComplaintsRepository(ComplaintsProvider()),
          )..add(FetchComplaints()), // Fetch complaints on initialization
        ),
      ],
      child: 
      MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',  
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a purple toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.pendingColor),
          useMaterial3: true,
        ),
        home:  HomePage(),
      ));
  }
}

