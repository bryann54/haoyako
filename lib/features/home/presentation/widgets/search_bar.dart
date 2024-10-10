import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final String hintText; // The placeholder text for the search bar
  final VoidCallback? onFilterTap; // Callback for filter icon tap

  const CustomSearchBar({
    Key? key,
    this.hintText = 'Search addresses near you', // Default hint text
    this.onFilterTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize:
          MainAxisSize.min, // Minimize the row size to only the required space
      children: [
        Expanded(
          // Use Expanded to allow the search box to take up remaining space
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8), // Rounded corners
              ),
              alignment:
                  Alignment.center, // Center the content inside the container
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.search, color: Colors.grey),
                  ),
                  Expanded(
                    // Allows the text to take available space
                    child: Text(
                      hintText, // Placeholder text
                      style: TextStyle(color: Colors.grey), // Text color
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: onFilterTap, // Handle filter icon tap
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(8), // Rounded corners
              ),
              child: Icon(
                Icons.tune,
                color: Colors.white, // Icon color
              ),
            ),
          ),
        ),
      ],
    );
  }
}
