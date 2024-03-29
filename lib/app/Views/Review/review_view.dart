// import 'package:bookbode/app/Core/utilities/constants/spacing.dart';
// import 'package:bookbode/app/Core/utilities/shared/fill_buttons.dart';
// import 'package:flutter/material.dart';
// import '../../Core/services/Database/database.dart';
// import '../../Models/review_model.dart';

// class ReviewView extends StatefulWidget {
//   const ReviewView({Key? key}) : super(key: key);

//   @override
 
//   createState() => _ReviewViewState();
// }

// class _ReviewViewState extends State<ReviewView> {
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _commentController = TextEditingController();
//   double? _userRating;
//   final String hotelId = "HOTEL_ID_HERE"; // Replace with actual hotel ID
//   final String userId = "USER_ID_HERE"; // Replace with actual user ID

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const  Text('Write a Review')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextFormField(
//               controller: _nameController,
//               decoration: const InputDecoration(
//                 labelText: 'Your name',
//               ),
//             ),
//             TextFormField(
//               controller: _commentController,
//               decoration: const InputDecoration(
//                 labelText: 'Your Comment',
//               ),
//               maxLines: 5,
//             ),
//             kVSpace16,
//             DropdownButton<double>(
//               value: _userRating,
//               hint: const Text('Select Rating'),
//               onChanged: (newValue) {
//                 setState(() {
//                   _userRating = newValue;
//                 });
//               },
//               items: <double>[1, 2, 3, 4, 5].map<DropdownMenuItem<double>>(
//                 (double value) {
//                   return DropdownMenuItem<double>(
//                     value: value,
//                     child: Text(value.toString()),
//                   );
//                 },
//               ).toList(),
//             ),
//             FillButtons(
//               onPressed: _submitReview,
//                text:'Submit Review',
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _submitReview() async {
//     if (_commentController.text.isEmpty || _userRating == null) {
//       // Handle validation
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Please complete the form.')),
//       );
//       return;
//     }

//     final review = Review(
//       reviewId: 'REVIEW_ID', 
//       createdAt: DateTime.now(),
//       userRating: _userRating,
//       comment: _commentController.text,
//       hotelId: hotelId,
//       userId: userId, username: '',
//     );

//     try {
//       await DatabaseService().createReview(review);
//       Navigator.pop(context); // Go back after submitting the review
//     } catch (error) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error submitting review.')),
//       );
//     }
//   }
// }
