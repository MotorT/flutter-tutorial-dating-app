import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ImageUploadPage extends StatefulWidget {
  const ImageUploadPage({Key? key}) : super(key: key);

  @override
  State<ImageUploadPage> createState() => _ImageUploadPageState();
}

class _ImageUploadPageState extends State<ImageUploadPage> {
  // Create a list of [1, 2, 3, 4, 5, 6]
  final catsIndex = List.generate(6, (index) => index + 1);

  final selectedPhotos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Uploading...'),
        actions: [
          TextButton(
            onPressed: () {
              uploadMyCatsToFirebase();
            },
            child: Text(
              'Upload',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        children: catsIndex.map((e) {
          final isSelected = selectedPhotos.contains(e);
          print('$e is selected: $isSelected');
          return InkWell(
            onTap: () {
              setState(() {
                if (isSelected) {
                  selectedPhotos.remove(e);
                } else {
                  selectedPhotos.add(e);
                }
              });
            },
            child: Stack(
              children: [
                Image.asset('assets/images/cat$e.jpg'),
                if (isSelected)
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Icon(Icons.check),
                  ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Future<void> uploadMyCatsToFirebase() async {
    print('Uploading cats: $selectedPhotos');
    final firebaseStorage = FirebaseStorage.instance;
    if (selectedPhotos.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Please select photos first'),
      ));
      return;
    }

    for (var photo in selectedPhotos) {
      final data = (await rootBundle.load('assets/images/cat$photo.jpg')).buffer.asUint8List();
      try {
        await firebaseStorage.ref('test/cat$photo.jpg').putData(data);
      } catch (e) {
        print(e);
      }
    }
  }
}

bool returnSth() => false;

bool returnSth2() {
  return false;
}
