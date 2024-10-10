import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  final String imageUrl;
  final int index;

  const DetailsScreen({
    super.key,
    required this.imageUrl,
    required this.index,
  });

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                // Background image
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Hero(
                    tag: 'propertyImage${widget.index}',
                    child: Stack(
                      children: [
                        // Image with shadow
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                spreadRadius: 5,
                                blurRadius: 10,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                              widget.imageUrl,
                              width: double.infinity,
                              height: 250,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        // Gradient overlay
                        Container(
                          width: double.infinity,
                          height: 250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.black.withOpacity(0.2),
                                Colors.black.withOpacity(0.7),
                              ],
                            ),
                          ),
                        ),

                        // Row with back button (now at the top)
                        Positioned(
                          top: 16,
                     
child: Row(
                            children: [
                              // Back button wrapped in a circle
                              Container(
                               
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(
                                      0.5), // Background color with opacity
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  icon: Icon(Icons.arrow_back_ios_new_rounded,
                                      color: Colors.white),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ),
                              SizedBox(width: 300),
                              // Bookmark button wrapped in a circle
                              Container(
                              
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(
                                      0.5), // Background color with opacity
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  icon: Icon(Icons.bookmark_outline,
                                      color: Colors.white),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ),
                            ],
                          ),

                        ),

                        // Column with property details (now at the bottom)
                        Positioned(
                          bottom: 16,
                          left: 10,
                          right: 16,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Data ${widget.index}',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Rent Ksh: ${widget.index}/year',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.blue[100],
                                  shadows: [
                                    Shadow(
                                      blurRadius: 10,
                                      color: Colors.black.withOpacity(0.7),
                                      offset: Offset(2, 2),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(Icons.bed, color: Colors.white),
                                  SizedBox(width: 8),
                                  Text(
                                    ' ${widget.index} Bedrooms',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      shadows: [
                                        Shadow(
                                          blurRadius: 10,
                                          color: Colors.black.withOpacity(0.7),
                                          offset: Offset(2, 2),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 24),
                                  Icon(Icons.bathtub, color: Colors.white),
                                  SizedBox(width: 8),
                                  Text(
                                    ' ${widget.index} Bathrooms',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      shadows: [
                                        Shadow(
                                          blurRadius: 10,
                                          color: Colors.black.withOpacity(0.7),
                                          offset: Offset(2, 2),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16),
                  Text(
                    'Description',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'This is a beautiful property with ${widget.index} bedrooms and ${widget.index} bathrooms. '
                    'It offers modern amenities and a great location. '
                    'The rent is Ksh ${widget.index} per year.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundImage: NetworkImage(
                            'https://www.pngplay.com/wp-content/uploads/12/User-Avatar-Profile-Transparent-Clip-Art-Background.png',
                          ),
                        ),
                        SizedBox(width: 10),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Vendor name',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'owner',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
SizedBox(width: 100,),
                        Container(
                    
                          decoration: BoxDecoration(
                            color: Colors.blue.withOpacity(
                                0.5), // Background color with opacity
                                borderRadius: BorderRadius.circular(10),
                            shape: BoxShape.rectangle,
                          ),
                          child: IconButton(
                            icon: Icon(Icons.call,
                                color: Colors.white),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ),SizedBox(width: 10,),
                        Container(
                
                          decoration: BoxDecoration(
                            color: Colors.blue.withOpacity(
                                0.5), // Background color with opacity
                                      borderRadius: BorderRadius.circular(10),
                            shape: BoxShape.rectangle,
                          ),
                          child: IconButton(
                            icon: Icon(Icons.message_rounded,
                                color: Colors.white),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
