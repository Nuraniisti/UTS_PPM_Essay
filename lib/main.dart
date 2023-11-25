import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ImageGallery(),
    );
  }
}

class ImageGallery extends StatefulWidget {
  @override
  _ImageGalleryState createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<ImageGallery> {
  List<String> imageUrls = [
    'https://picsum.photos/id/75/1999/2998',
    'https://picsum.photos/id/102/4320/3240',
    'https://picsum.photos/id/292/3852/2556',
    'https://picsum.photos/id/425/959/635',
    'https://picsum.photos/id/429/4128/2322',
    'https://picsum.photos/id/493/3872/2592',
    'https://picsum.photos/id/517/5000/3333',
    'https://picsum.photos/id/674/3888/2592',
    'https://picsum.photos/id/824/5000/3333',
    'https://picsum.photos/id/1080/5000/3335',
    // Tambahkan URL gambar selanjutnya sesuai kebutuhan
  ];

  int currentIndex = 0;

  void goToFirst() {
    setState(() {
      currentIndex = 0;
    });
  }

  void goToPrevious() {
    setState(() {
      currentIndex = (currentIndex > 0) ? currentIndex - 1 : 0;
    });
  }

  void goToNext() {
    setState(() {
      currentIndex = (currentIndex < imageUrls.length - 1)
          ? currentIndex + 1
          : currentIndex;
    });
  }

  void goToLast() {
    setState(() {
      currentIndex = imageUrls.length - 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Gallery'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              imageUrls[currentIndex],
              height: 200,
              width: 200,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: goToFirst,
                  child: Text('First'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: goToPrevious,
                  child: Text('Previous'),
                ),
                SizedBox(width: 10),
                ElevatedButton(onPressed: goToNext, child: Text('Next')),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: goToLast,
                  child: Text('Last'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
