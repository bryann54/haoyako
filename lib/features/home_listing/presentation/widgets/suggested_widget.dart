import 'package:flutter/material.dart';

class SuggestedWidget extends StatefulWidget {
  const SuggestedWidget({super.key});

  @override
  State<SuggestedWidget> createState() => _SuggestedWidgetState();
}

class _SuggestedWidgetState extends State<SuggestedWidget> {
  // List of image URLs (you can replace these with your image assets or URLs)
  final List<String> imageUrls = [
    'https://a0.muscache.com/im/pictures/2eb7946d-523e-4e32-a285-964920379243.jpg',
    'https://a0.muscache.com/im/pictures/2eb7946d-523e-4e32-a285-964920379243.jpg',
    'https://a0.muscache.com/im/pictures/2eb7946d-523e-4e32-a285-964920379243.jpg',
    'https://a0.muscache.com/im/pictures/2eb7946d-523e-4e32-a285-964920379243.jpg',
    'https://a0.muscache.com/im/pictures/2eb7946d-523e-4e32-a285-964920379243.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Near from you',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                Text(
                  'See more',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          // Using ListView to make images scrollable
          Container(
            height: 250, // Set a height for the ListView
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: imageUrls.length,
              itemBuilder: (context, index) {
                final url = imageUrls[index];
                return Padding(
                  padding:
                      const EdgeInsets.only(right: 15), // Space between images
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(15), // Optional: rounded corners
                    child: Image.network(
                      url,
                      width: 200, // Set width of the images
                      height: 250, // Set height of the images
                      fit: BoxFit.cover, // Fit the image within the box
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
