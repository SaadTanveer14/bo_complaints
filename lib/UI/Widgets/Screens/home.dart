import 'package:bo_complaints/UI/Widgets/add_update_complaint_widget.dart';
import 'package:bo_complaints/UI/Widgets/complaint_widget.dart';
import 'package:bo_complaints/UI/constants/app_colors.dart';
import 'package:bo_complaints/bloc/complaints/complaint_event.dart';
import 'package:bo_complaints/bloc/complaints/compliant_bloc.dart';
import 'package:bo_complaints/bloc/complaints/compliant_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
   double screenWidth = MediaQuery.of(context).size.width;
   double screenHeight = MediaQuery.of(context).size.height;        
    return Scaffold(
      body:  SafeArea(
        child: Column(
          children: [
            Container(
              width: screenWidth,
              decoration: const BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.only(bottomRight:  Radius.circular(50), topRight: Radius.zero),
              ),
              child: Padding(
                padding: EdgeInsets.all(30),
                child: Column(
                  children: [
                    Stack(
                      children:[
                        Column(
                          
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: screenWidth*1,
                            ),
                            Text('Create your', style: GoogleFonts.plusJakartaSans(fontSize: 26, color: Colors.white, ),),
                            Text('Complaints', style: GoogleFonts.plusJakartaSans(fontSize: 26, color: Colors.white, fontWeight: FontWeight.w700),),
                            Text('Have something to rant about?',style: GoogleFonts.plusJakartaSans(fontSize: 12, color: Colors.white),),
                            
                            
                          ],
                        
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: InkWell(
                            onTap: (){
                              print("Clicked");
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                builder: (_) => ComplaintBottomSheet(),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(15),
                              
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.backgroundColor,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1), // Shadow color
                                    spreadRadius: 5, // How much the shadow spreads
                                    blurRadius: 7, // The softness of the shadow
                                    offset: Offset(0, 3), // Offset (horizontal, vertical)
                                  ),
                                ],
                              ),
                              child: const Icon(Icons.add, color: AppColors.pendingColor,),
                            ),
                          ),
                        ),
                      ]
                    ),
                    const SizedBox(height: 30,),

                        TextField(
                           onChanged: (query) {
                            context.read<ComplaintsBloc>().add(SearchComplaints(query));
                          },
                          decoration: InputDecoration(
                            hintText: 'Search...', // Placeholder text
                            prefixIcon: Icon(Icons.search, color: Colors.grey), // Search icon
                            filled: true, // Fill the background
                            fillColor: Colors.white, // Background color
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0), // Rounded corners
                              borderSide: BorderSide.none, // No border line
                            ),
                          ),
                        ),
                  ],
                ),
              ),
            ),

            


            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('SORT BY ', style: GoogleFonts.plusJakartaSans(fontSize: 10, color: AppColors.primaryColor),),
                  Text('DATE ADDED ', style: GoogleFonts.plusJakartaSans(fontSize: 10, color: AppColors.primaryColor, fontWeight: FontWeight.w600),),
                  const Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: AppColors.primaryColor,
                  )
                ],
              ),
            ),

            Expanded(
              child: BlocBuilder<ComplaintsBloc, ComplaintsState>(
                builder: (context, state) {
                  if (state is ComplaintsLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is ComplaintsLoaded) {
                    return ListView.separated(
                      itemCount: state.complaints.length,
                      itemBuilder: (context, index) {
                        return complaintWidget(context, state.complaints[index]);
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 20,);
                      }
                    );
                  } else if (state is ComplaintsError) {
                    return Center(child: Text(state.message));
                  }
                  return Center(child: Text('No complaints available.'));
                },
              ),
            ),


            
          ],
        ),
      ),
    );
  }

}


