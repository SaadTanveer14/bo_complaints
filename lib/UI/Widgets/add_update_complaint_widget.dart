import 'package:bo_complaints/UI/constants/app_colors.dart';
import 'package:bo_complaints/bloc/update_complaint/update_complaint_bloc.dart';
import 'package:bo_complaints/data/models/update_complaint_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ComplaintBottomSheet extends StatefulWidget {
  final int complaintId;
  final int currentStatusId;
  final String currentComment;

  ComplaintBottomSheet({
    required this.complaintId,
    required this.currentStatusId,
    required this.currentComment,
  });

  @override
  State<ComplaintBottomSheet> createState() => _ComplaintBottomSheetState();
}

class _ComplaintBottomSheetState extends State<ComplaintBottomSheet> {
  final TextEditingController _commentController = TextEditingController();

  int? _selectedStatusId;
    final Map<int, String> _complaintTypes = {
    1: 'Processing',
    2: 'Completed',
  };

  @override
  Widget build(BuildContext context) {
    _commentController.text = widget.currentComment;
    // _selectedStatusId = widget.currentStatusId;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(), // Dismiss keyboard on tap outside
      child: DraggableScrollableSheet(
        initialChildSize: 0.7,
        minChildSize: 0.6,
        maxChildSize: 0.7,
        builder: (context, scrollController) {
          return Container(
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
            ),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      height: 4,
                      width: 40,
                      margin: EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Text(
                        'Update Complaint',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),
                    const Text(
                      'Complaint Status',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    const SizedBox(height: 10),

                   DropdownButtonFormField<int>(
                      value: _selectedStatusId,
                      onChanged: (int? newValue) {
                        setState(() {
                          _selectedStatusId = newValue;
                        });
                      },
                      items: _complaintTypes.entries.map((entry) {
                        return DropdownMenuItem<int>(
                          value: entry.key,
                          child: Text(entry.value),
                        );
                      }).toList(),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 12,
                        ),
                      ),
                      hint: const Text('Select a Complaint Status'),
                    ),
                  
                  /* SizedBox(height: 20),
                  Text(
                    'Complaint Category',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      // Handle category selection
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primaryColor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Payment', style: TextStyle(color: Colors.black)),
                          Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20), */
                  const SizedBox(height: 20),
                  Text(
                    'Details',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: _commentController,
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintText: 'Update your complaint...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: AppColors.primaryColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: AppColors.primaryColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: AppColors.primaryColor),
                      ),
                    ),
                  ),
                  // SizedBox(height: 20),
                  // Text(
                  //   'Attachments',
                  //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  // ),
                  // SizedBox(height: 10),
                  // GestureDetector(
                  //   onTap: () {
                  //     // Handle attachment addition
                  //   },
                  //   child: Container(
                  //     width: 80,
                  //     height: 80,
                  //     decoration: BoxDecoration(
                  //       color: Colors.grey[100],
                  //       borderRadius: BorderRadius.circular(10),
                  //     ),
                  //     child: Icon(Icons.add, color: AppColors.primaryColor, size: 30),
                  //   ),
                  // ),
                  SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        
                          final updateComplaint = UpdateComplaint(
                          id: widget.complaintId,
                          status: widget.currentStatusId, // Or update this as needed
                          comment: _commentController.text,  // The updated comment
                        );
                        context.read<UpdateComplaintBloc>().add(SubmitUpdateComplaintEvent(updateComplaint: updateComplaint));
                      },
                      child: Text(
                        'Update Complaint',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),

                  BlocListener<UpdateComplaintBloc, UpdateComplaintState>(
                    listener: (context, state) {
                      if (state is UpdateComplaintLoading) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Updating complaint...'),
                            // duration: Duration(days: 365), // Keep it until the process is done
                          ),
                        );
                      }

                      if (state is UpdateComplaintSuccess) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Complaint updated successfully!'),
                            backgroundColor: Colors.green,
                          ),
                        );
                        // Optionally, close the bottom sheet after success
                        Navigator.pop(context);
                      }

                      if (state is UpdateComplaintError) {
                        
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.message),
                            backgroundColor: Colors.red,
                          ),
                        );
                        Navigator.pop(context);
                      }
                    },
                    child: Container(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}