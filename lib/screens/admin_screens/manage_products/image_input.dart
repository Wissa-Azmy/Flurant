import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({ Key? key }) : super(key: key);

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _storedImage;

  Future<void> pickImage() async {
    final picker = ImagePicker();
    try {
      final imageFile = await picker.pickImage(source: ImageSource.gallery);
      setState(() {
        _storedImage = File(imageFile?.path ?? "");
      });
    } catch (error){
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            width: 150, 
            height: 100, 
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.grey),
            ),
            child: _storedImage != null 
            ? Image.file(_storedImage!, fit: BoxFit.cover, width: double.infinity,) 
            : const Center(child: Text('No Image Selected', textAlign: TextAlign.center,)),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextButton.icon(
              onPressed: pickImage, 
              icon: const Icon(Icons.camera), 
              label: const Text('Add Photo'),
            ),
          )
        ],
      ),
    );
  }
}