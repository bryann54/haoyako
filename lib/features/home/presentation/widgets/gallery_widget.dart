import 'package:flutter/material.dart';

class GalleryWidget extends StatefulWidget {
    final int index;
  const GalleryWidget({super.key, required this.index});

  @override
  State<GalleryWidget> createState() => _GalleryWidgetState();
}

class _GalleryWidgetState extends State<GalleryWidget> {
  final List<String> imageUrls = [
    'https://a0.muscache.com/im/pictures/2eb7946d-523e-4e32-a285-964920379243.jpg',
    'https://a0.muscache.com/im/pictures/2eb7946d-523e-4e32-a285-964920379243.jpg',
    'https://a0.muscache.com/im/pictures/2eb7946d-523e-4e32-a285-964920379243.jpg',
    'https://a0.muscache.com/im/pictures/2eb7946d-523e-4e32-a285-964920379243.jpg',
    'https://a0.muscache.com/im/pictures/2eb7946d-523e-4e32-a285-964920379243.jpg',
  ];

  OverlayEntry? _overlayEntry;
  bool _isExpanded = false;

  void _showExpandedImage(String imageUrl, String tag) {
    setState(() {
      _isExpanded = true;
    });

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned.fill(
        child: GestureDetector(
          onTap: _hideExpandedImage,
          child: Container(
            color: Colors.black.withOpacity(0.8),
            child: Center(
              child: Hero(
                tag: tag,
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _hideExpandedImage() {
    _overlayEntry?.remove();
    setState(() {
      _isExpanded = false;
    });
  }

  @override
  void dispose() {
    _overlayEntry?.remove();
    super.dispose();
  }

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
                'Gallery',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ],
          ),
        ),
        SizedBox(height: 8),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: imageUrls.length,
            itemBuilder: (context, index) {
              final url = imageUrls[index];
              return Padding(
                padding: const EdgeInsets.only(right: 15),
                child: GestureDetector(
                  onTap: () {
                    if (!_isExpanded) {
                      _showExpandedImage(url, 'image_$index');
                    }
                  },
                  child: Hero(
                    tag: 'image_$index',
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        url,
                        width: 100,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
Container(height: 140,),
Row(children: [
  Expanded(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [Text('Price'),
         Text(
                            'Rent Ksh: ${widget.index}/year',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.blue[300],
                    
                            ),
                          ),
                        ],
      ),
    ),
  ),
  Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: 40,
      width: 150,
      decoration: BoxDecoration(
        color: Colors.blue[300],
        borderRadius:BorderRadius.circular(10) 
      ),
      child: Center(child: Text('Rent now',style: TextStyle(color: Colors.white),)),
    ),
  )
],)
            ],
          ),
        )
     
      ],
    );
  }
}
