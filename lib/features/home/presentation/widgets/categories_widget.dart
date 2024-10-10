import 'package:flutter/material.dart';

class CategoriesWidget extends StatefulWidget {
  const CategoriesWidget({super.key});

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  // List of categories
  final List<String> categories = [
    'House',
    'Apartment',
    'Hotel',
    'Villa',
    'Cottage',
  ];

  // Variable to keep track of the selected category index
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length, // Use the length of the categories list
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index; // Update selected index on tap
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 100,
                height: 50,
                decoration: BoxDecoration(
                  color: selectedIndex == index
                      ? Colors.blue
                      : Colors.grey.shade200, // Active color
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    categories[index], 
                    style: TextStyle(fontSize: 14,  color: selectedIndex == index
                          ? Colors.white
                          : Colors.black26,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
