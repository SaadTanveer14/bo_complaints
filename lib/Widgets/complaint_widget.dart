import 'package:bo_complaints/app_colors.dart';
import 'package:bo_complaints/data/models/complaint_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget complaintWidget(BuildContext context, Complaint complaint){
    double screenWidth = MediaQuery.of(context).size.width;    
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        color: AppColors.backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2), // Shadow color
            spreadRadius: 5, // How much the shadow spreads
            blurRadius: 7, // The softness of the shadow
            offset: Offset(0, 3), // Offset (horizontal, vertical)
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    
                    Text('Complaint Number', style: GoogleFonts.plusJakartaSans(fontSize: 10, color: AppColors.greyColor, ),),
                    Text('${complaint.complaintNo}', style: GoogleFonts.plusJakartaSans(fontSize: 14, color: AppColors.blackColor, fontWeight: FontWeight.w600),),
                ],
                
              ),
              
              status("${complaint.status}"),
                        
            ],
          ),
          
          const SizedBox(height: 20,),

          Row(
            children: [
              Image.asset('assets/icons/img_person.png', height: 20,),
              const SizedBox(width: 8,),
              Text('${complaint.customerName}', style: GoogleFonts.plusJakartaSans(fontSize: 12, color: AppColors.lightBlackColor, fontWeight: FontWeight.w600),),
              const Spacer(),

              Image.asset('assets/icons/img_calender.png', height: 20,),
              const SizedBox(width: 8,),
              Text('${complaint.createdDateString}', style: GoogleFonts.plusJakartaSans(fontSize: 12, color: AppColors.lightBlackColor, fontWeight: FontWeight.w600),),
            ],
          ),

          
          const SizedBox(height: 20,),

          Text('Complaint Description', style: GoogleFonts.plusJakartaSans(fontSize: 12, color: AppColors.lightBlackColor, fontWeight: FontWeight.w600),),
          const SizedBox(height: 10,),
          Container(
            width: screenWidth * 0.7,
            child: Text('${complaint.complaintDescription}', style: GoogleFonts.plusJakartaSans(fontSize: 10, color: AppColors.lightBlackColor),)),

        ],
      ),
    );
  }

  Widget status(String status){
    return Container(
      margin: EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(4)),
          color:  status == 'Completed' ? AppColors.resolvedColor  : AppColors.pendingColor
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        child: Text(status, style: GoogleFonts.plusJakartaSans(fontSize: 8, color: Colors.white, fontWeight: FontWeight.w600)),
      ),
    );
  }
