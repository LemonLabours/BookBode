import 'package:bookbode/app/Core/utilities/constants/colors.dart';
import 'package:bookbode/app/Core/utilities/constants/spacing.dart';
import 'package:bookbode/app/Models/hotel_model.dart';
import 'package:flutter/material.dart';

import '../../../Core/services/Database/database.dart';

class HomeAppBar extends StatefulWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  final TextEditingController _searchController = TextEditingController();
  final focusNode = FocusNode();
  List<Hotel> searchResults = [];
  final DatabaseService _databaseService = DatabaseService();
  OverlayEntry? overlayEntry;

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      if (!focusNode.hasFocus) {
        removeOverlay();
      }
    });
  }

  void removeOverlay() {
    overlayEntry?.remove();
    overlayEntry = null;
  }

  void _handleSearch() async {
    final localContext = context;

    String searchText = _searchController.text.trim();
    if (searchText.isNotEmpty) {
      try {
        searchResults =
            await _databaseService.searchHotelsByLocation(searchText);
        removeOverlay();
        overlayEntry = createOverlayEntry(localContext);
        Overlay.of(localContext).insert(overlayEntry!);
      } catch (error) {
        ScaffoldMessenger.of(localContext).showSnackBar(
          SnackBar(
            content: Text('Error searching for hotels: ${error.toString()}'),
            behavior: SnackBarBehavior.floating,
            action: SnackBarAction(
              label: 'Close',
              onPressed: () {
                ScaffoldMessenger.of(localContext).hideCurrentSnackBar();
              },
            ),
          ),
        );
      }
    } else {
      removeOverlay();
    }
  }

  OverlayEntry createOverlayEntry(BuildContext context) {
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context) => Positioned(
        left: offset.dx,
        top: offset.dy + size.height,
        width: size.width,
        child: Material(
          elevation: 4,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: searchResults.length,
            itemBuilder: (context, index) => ListTile(
              title: Text(searchResults[index].name),
              onTap: () {
                _searchController.text = searchResults[index].name;
                removeOverlay();
              },
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      decoration: const BoxDecoration(
        gradient: babyAndDarkBlueGradient,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ResponsiveSpacing.height(context, xxlarge),
            Stack(
              children: [
                TextField(
                  controller: _searchController,
                  style: const TextStyle(
                      color: Colors.white), // Add this for the input text color
                  decoration: InputDecoration(
                    hintText: "Where do you want to stay?",
                    hintStyle: const TextStyle(
                        color: Colors.white), // Set hint text color to white
                    prefixIcon: const Icon(Icons.search,
                        color: Colors.white), // Set icon color to white
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(
                          color: Colors.white), // Set border color to white
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(
                          color: Colors
                              .white), // Set enabled border color to white
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(
                          color: Colors.white,
                          width: 2.0), // Set focused border color and width
                    ),
                  ),
                  onChanged: (value) => _handleSearch(),
                  focusNode: focusNode,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    focusNode.dispose();
    removeOverlay();
    super.dispose();
  }
}
