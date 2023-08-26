import 'package:bookbode/app/Core/utilities/constants/colors.dart';
import 'package:bookbode/app/Core/utilities/constants/spacing.dart';
import 'package:bookbode/app/Core/utilities/shared/fill_buttons.dart';
import 'package:bookbode/app/Core/utilities/shared/text_fields_widgets.dart';
import 'package:bookbode/app/Models/hotel_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../Core/services/Database/database.dart';

class HomeAppBar extends StatefulWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  final TextEditingController _searchController = TextEditingController();
  List<Hotel> searchResults = [];
  final DatabaseService _databaseService = DatabaseService();

  void _handleSearch() async {
    String searchText = _searchController.text.trim();
    if (searchText.isNotEmpty) {
      try {
        searchResults =
            await _databaseService.searchHotelsByLocation(searchText);
        // Here, you can update your UI with the search results or navigate to another page to display them.
        // For now, let's print the results to console:
        if (kDebugMode) {
          print(searchResults);
        }
      } catch (error) {
        // Display a Snackbar with the error message.
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error searching for hotels: ${error.toString()}'),
            behavior: SnackBarBehavior.floating,
            action: SnackBarAction(
              label: 'Close',
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
            ),
          ),
        );

        if (kDebugMode) {
          print('Error searching for hotels: $error');
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [primary, secondary],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          kVSpace16,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Stack(
              children: [
                Row(
                  children: [
                    const Text(
                      'Hello!',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: hWhiteColor),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 210,
                      width: 210,
                      child: Image.asset(
                        "assets/imgs/1.png",
                        fit: BoxFit.fill,
                      ),
                    )
                  ],
                ),

                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Stack(
                    
                    children: [
// <<<<<<< HomeScreen
//                       const TextFieldWidget(
// =======
//                       TextFieldWidget(
//                         textController: _searchController,
// >>>>>>> main
//                         borderRadius: 50,
//                         prefixIcon: Icons.search,
//                         hintText: "Where do you want to stay?",
//                       ),
                        
                      Positioned(
                        top: 36,
                        bottom: 8,
                        right: 10,
                        child: FillButtons(
                          text: "Search",
                          height: 10,
                          width: 90,
                          fontSize: 14,
// <<<<<<< HomeScreen
//                           onPressed: () {
                            
//                           },
// =======
//                           onPressed: _handleSearch, 
// >>>>>>> main
//                         ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
