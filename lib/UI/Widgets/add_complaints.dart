// import 'package:bo_complaints/UI/constants/app_colors.dart';
// import 'package:bo_complaints/bloc/update_complaint/update_complaint_bloc.dart';
// import 'package:bo_complaints/data/models/update_complaint_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class AddComplaintBottomSheet extends StatefulWidget {


//   @override
//   State<AddComplaintBottomSheet> createState() => _ComplaintBottomSheetState();
// }

// class _ComplaintBottomSheetState extends State<AddComplaintBottomSheet> {
//   final TextEditingController _commentController = TextEditingController();

//   int? _selectedStatusId;

//   @override
//   Widget build(BuildContext context) {
//     int? _selectedStatusId = 1;
//     return GestureDetector(
//       onTap: () => FocusScope.of(context).unfocus(), // Dismiss keyboard on tap outside
//       child: DraggableScrollableSheet(
//         initialChildSize: 0.7,
//         minChildSize: 0.6,
//         maxChildSize: 0.7,
//         builder: (context, scrollController) {
//           return Container(
//             padding: EdgeInsets.all(20.0),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
//             ),
//             child: SingleChildScrollView(
//               controller: scrollController,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Center(
//                     child: Container(
//                       height: 4,
//                       width: 40,
//                       margin: EdgeInsets.only(bottom: 20),
//                       decoration: BoxDecoration(
//                         color: Colors.grey[300],
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                   ),
//                   Stack(
//                     alignment: Alignment.center,
//                     children: [
//                       Text(
//                         'Add Complaint',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Align(
//                         alignment: Alignment.centerRight,
//                         child: IconButton(
//                           icon: Icon(Icons.close),
//                           onPressed: () => Navigator.pop(context),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 10),
//                   StatefulBuilder(
//                     builder: (context, setState) {
//                       return DropdownButton<int>(
//                         value: _selectedStatusId,
//                         onChanged: (int? newValue) {
//                           setState(() {
//                             _selectedStatusId = newValue;
//                           });
                         
//                         },
//                         items: [
//                           DropdownMenuItem(
//                             value: 1,
//                             child: Text('Payment'),
//                           ),
//                         ],
//                       );
//                     }
//                   ),
//                   /* SizedBox(height: 20),
//                   Text(
//                     'Complaint Category',
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
//                   ),
//                   SizedBox(height: 10),
//                   GestureDetector(
//                     onTap: () {
//                       // Handle category selection
//                     },
//                     child: Container(
//                       padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
//                       decoration: BoxDecoration(
//                         border: Border.all(color: AppColors.primaryColor),
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text('Payment', style: TextStyle(color: Colors.black)),
//                           Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
//                         ],
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 20), */
//                   Text(
//                     'Details',
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
//                   ),
//                   SizedBox(height: 10),
//                   TextField(
//                     controller: _commentController,
//                     maxLines: 5,
//                     decoration: InputDecoration(
//                       hintText: 'Add your complaint...',
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                         borderSide: BorderSide(color: AppColors.primaryColor),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                         borderSide: BorderSide(color: AppColors.primaryColor),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                         borderSide: BorderSide(color: AppColors.primaryColor),
//                       ),
//                     ),
//                   ),
//                   // SizedBox(height: 20),
//                   // Text(
//                   //   'Attachments',
//                   //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
//                   // ),
//                   // SizedBox(height: 10),
//                   // GestureDetector(
//                   //   onTap: () {
//                   //     // Handle attachment addition
//                   //   },
//                   //   child: Container(
//                   //     width: 80,
//                   //     height: 80,
//                   //     decoration: BoxDecoration(
//                   //       color: Colors.grey[100],
//                   //       borderRadius: BorderRadius.circular(10),
//                   //     ),
//                   //     child: Icon(Icons.add, color: AppColors.primaryColor, size: 30),
//                   //   ),
//                   // ),
//                   SizedBox(height: 30),
//                   SizedBox(
//                     width: double.infinity,
//                     height: 50,
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: AppColors.primaryColor,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                       onPressed: () {
                        
//                         //   final updateComplaint = UpdateComplaint(
//                         //   id: widget.complaintId,
//                         //   status: widget.currentStatusId, // Or update this as needed
//                         //   comment: _commentController.text,  // The updated comment
//                         // );
//                         // context.read<UpdateComplaintBloc>().add(SubmitUpdateComplaintEvent(updateComplaint: updateComplaint));
//                       },
//                       child: Text(
//                         'Add Complaint',
//                         style: TextStyle(color: Colors.white, fontSize: 16),
//                       ),
//                     ),
//                   ),

//                   /* BlocListener<UpdateComplaintBloc, UpdateComplaintState>(
//                     listener: (context, state) {
//                       if (state is UpdateComplaintLoading) {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                             content: Text('Updating complaint...'),
//                             // duration: Duration(days: 365), // Keep it until the process is done
//                           ),
//                         );
//                       }

//                       if (state is UpdateComplaintSuccess) {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                             content: Text('Complaint updated successfully!'),
//                             backgroundColor: Colors.green,
//                           ),
//                         );
//                         // Optionally, close the bottom sheet after success
//                         Navigator.pop(context);
//                       }

//                       if (state is UpdateComplaintError) {
                        
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                             content: Text(state.message),
//                             backgroundColor: Colors.red,
//                           ),
//                         );
//                         Navigator.pop(context);
//                       }
//                     },
//                     child: Container(), 
//                   ),*/
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }


import 'package:bo_complaints/bloc/add_compliants.dart/add_complaint_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bo_complaints/UI/constants/app_colors.dart';

class AddComplaintBottomSheet extends StatefulWidget {
  @override
  State<AddComplaintBottomSheet> createState() => _AddComplaintBottomSheetState();
}

class _AddComplaintBottomSheetState extends State<AddComplaintBottomSheet> {
  final TextEditingController _commentController = TextEditingController();
  int? _selectedComplaintTypeId;

  final Map<int, String> _complaintTypes = {
    1: 'Payment',
    2: 'Service',
    3: 'Other',
  };

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(), // Dismiss keyboard on tap outside
      child: DraggableScrollableSheet(
        initialChildSize: 0.7,
        minChildSize: 0.6,
        maxChildSize: 0.9,
        builder: (context, scrollController) {
          return Container(
            padding: const EdgeInsets.all(20.0),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
            ),
            child: BlocListener<AddComplaintBloc, AddComplaintState>(
              listener: (context, state) {
                if (state is AddComplaintLoading) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Submitting complaint...')),
                  );
                } else if (state is AddComplaintSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Complaint added successfully!')),
                  );
                  Navigator.pop(context);
                } else if (state is AddComplaintError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message)),
                  );
                }
              },
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        height: 4,
                        width: 40,
                        margin: const EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        const Text(
                          'Add Complaint',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            icon: const Icon(Icons.close, color: Colors.black),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Complaint Type',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    const SizedBox(height: 10),
                    DropdownButtonFormField<int>(
                      value: _selectedComplaintTypeId,
                      onChanged: (int? newValue) {
                        setState(() {
                          _selectedComplaintTypeId = newValue;
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
                      hint: const Text('Select a complaint type'),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Details',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: _commentController,
                      maxLines: 5,
                      decoration: InputDecoration(
                        hintText: 'Add your complaint description...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: AppColors.primaryColor),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: AppColors.primaryColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: AppColors.primaryColor),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
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
                          final description = _commentController.text.trim();

                          if (_selectedComplaintTypeId == null || description.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Please fill all fields')),
                            );
                            return;
                          }

                          context.read<AddComplaintBloc>().add(
                                SubmitAddComplaintEvent(
                                  complaintTypeId: _selectedComplaintTypeId!,
                                  complaintDescription: description,
                                ),
                              );
                        },
                        child: const Text(
                          'Submit Complaint',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }
}