import 'package:flutter/material.dart';
import 'package:haoyako/features/home/presentation/pages/details_screen.dart';

class ForYouWidget extends StatefulWidget {
  const ForYouWidget({super.key});

  @override
  State<ForYouWidget> createState() => _ForYouWidgetState();
}

class _ForYouWidgetState extends State<ForYouWidget> {
  // List of image URLs (you can replace these with your image assets or URLs)
  final List<String> imageUrls = [
    'https://a0.muscache.com/im/pictures/2eb7946d-523e-4e32-a285-964920379243.jpg',
    'https://a0.muscache.com/im/pictures/2eb7946d-523e-4e32-a285-964920379243.jpg',
    'https://a0.muscache.com/im/pictures/2eb7946d-523e-4e32-a285-964920379243.jpg',
    'https://a0.muscache.com/im/pictures/2eb7946d-523e-4e32-a285-964920379243.jpg',
    'https://a0.muscache.com/im/pictures/2eb7946d-523e-4e32-a285-964920379243.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTTQvO315e7E_PBCnFVhf7F0efVWZ_qZrTeww&s'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Best for you',
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
        // Using a ListView to display each item separately
        ListView(
          shrinkWrap: true, // Prevents the ListView from taking infinite height
          physics:
              NeverScrollableScrollPhysics(), // Prevents scrolling in the ListView
          children: List.generate(imageUrls.length, (index) {
            return ListItemWidget(
              imageUrl: imageUrls[index],
              index: index,
            );
          }),
        ),
      ],
    );
  }
}

class ListItemWidget extends StatelessWidget {
  final String imageUrl;
  final int index;

  const ListItemWidget({
    super.key,
    required this.imageUrl,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 8, 5, 0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsScreen(
                imageUrl: imageUrl,
                index: index,
              ),
            ),
          );
        },
        child: Row(
          children: [
            Hero(
              tag: 'propertyImage$index',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  imageUrl,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Data $index', style: TextStyle(fontSize: 14)),
                SizedBox(height: 4),
                Text('Rent Ksh: $index/year',
                    style: TextStyle(fontSize: 12, color: Colors.blue)),
                Row(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.bed, color: Colors.grey),
                        SizedBox(width: 5),
                        Text(
                          'Bedrooms  $index',
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                    SizedBox(width: 30),
                    Row(
                      children: [
                        Icon(Icons.bathtub, color: Colors.grey),
                        SizedBox(width: 5),
                        Text(
                          'Bathrooms $index',
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
