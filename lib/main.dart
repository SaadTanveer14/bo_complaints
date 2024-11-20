import 'package:bo_complaints/UI/Screens/authentication.dart';
import 'package:bo_complaints/UI/constants/app_colors.dart';
import 'package:bo_complaints/bloc/add_compliants.dart/add_complaint_bloc.dart';
import 'package:bo_complaints/bloc/complaints/complaint_event.dart';
import 'package:bo_complaints/bloc/complaints/compliant_bloc.dart';
import 'package:bo_complaints/bloc/update_complaint/update_complaint_bloc.dart';
import 'package:bo_complaints/data/repository/complaints_provider.dart';
import 'package:bo_complaints/data/repository/complaints_repository.dart';
import 'package:bo_complaints/UI/Screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

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
        BlocProvider(
          create: (context) => UpdateComplaintBloc(complaintRepository: ComplaintsRepository(ComplaintsProvider())),
        ),
        BlocProvider(
          create: (context) => AddComplaintBloc(complaintsRepository: ComplaintsRepository(ComplaintsProvider())),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',  
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.pendingColor),
          useMaterial3: true,
        ),
        home:  LoginScreen(),
      ));
  }
}

