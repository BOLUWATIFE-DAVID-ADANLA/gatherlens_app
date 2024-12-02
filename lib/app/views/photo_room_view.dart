import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:gatherlens/app/widgets/apptext.dart';
import 'package:gatherlens/app/widgets/expandable_fab.dart';

class PhotoRoomView extends ConsumerStatefulWidget {
  const PhotoRoomView({super.key});

  @override
  ConsumerState<PhotoRoomView> createState() => _PhotoRoomViewState();
}

class _PhotoRoomViewState extends ConsumerState<PhotoRoomView> {
  final ImagePicker _picker = ImagePicker();
  // ignore: unused_field
  XFile? _image;
  Future getImageFromCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  Future getImageFromgallety() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
        child: Column(
          children: [],
        ),
      ),
      appBar: AppBar(
        title: AppTextBold(text: 'room name', fontSize: 18),
        centerTitle: true,
      ),
      floatingActionButton: ExpandableFab(
        distance: 100,
        children: [
          // images frome gallery
          ActionButton(
            onPressed: () {
              getImageFromCamera();
            },
            icon: const Icon(Icons.insert_photo),
          ),
          // images from camera
          ActionButton(
            onPressed: () {
              getImageFromgallety();
            },
            icon: const Icon(Icons.camera_alt),
          ),
        ],
      ),
    );
  }
}
