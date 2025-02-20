import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'dart:convert';

class AddPostProduct extends StatefulWidget {
  @override
  _AddPostProductState createState() => _AddPostProductState();
}

class _AddPostProductState extends State<AddPostProduct> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  String _selectedNature = "Biens Agricoles";
  File? _image;

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _submitPost() async {
    var uri = Uri.parse("10.0.2.2:4000/api/post"); // Remplacez par votre API
    var request = http.MultipartRequest('POST', uri);
    request.fields['name'] = _nameController.text;
    request.fields['description'] = _descriptionController.text;
    request.fields['nature'] = _selectedNature;
    request.fields['quantity'] = _quantityController.text;
    request.fields['location'] = _locationController.text;

    if (_image != null) {
      var stream = http.ByteStream(DelegatingStream.typed(_image!.openRead()));
      var length = await _image!.length();
      var multipartFile = http.MultipartFile('image', stream, length,
          filename: basename(_image!.path));
      request.files.add(multipartFile);
    }

    var response = await request.send();

    if (response.statusCode == 200) {
      print("Post ajouté avec succès");
    } else {
      print("Erreur lors de l'ajout du post");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ajouter un Post"),
        backgroundColor: Color(0xFF4BAF47),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: "Nom du post",
                labelStyle: TextStyle(color: Color(0xFF4BAF47)),
                border: OutlineInputBorder()),
            ),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: "Description",
                labelStyle: TextStyle(color: Color(0xFF4BAF47)),
                  border: OutlineInputBorder()
              ),

            ),
            DropdownButton<String>(
              value: _selectedNature,
              onChanged: (newValue) {
                setState(() {
                  _selectedNature = newValue!;
                });
              },
              items: ["Biens Agricoles", "Intrant Agricole"].map((String category) {
                return DropdownMenuItem(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
            ),
            TextField(
              controller: _quantityController,
              decoration: const InputDecoration(labelText: "Quantity",
                  labelStyle: TextStyle(color: Color(0xFF4BAF47)),
                  border: OutlineInputBorder()),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _locationController,
              decoration: const InputDecoration(labelText: "Localisation",
                  labelStyle: TextStyle(color: Color(0xFF4BAF47)),
                  border: OutlineInputBorder()),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text("Sélectionner une image"),
              style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF4BAF47)),
            ),
            SizedBox(height: 20),
            _image == null ? Text("Aucune image sélectionnée") : Image.file(_image!, height: 100),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitPost,
              child: Text("Enregistrer"),
              style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF4BAF47)),
            ),
          ],
        ),
      ),
    );
  }
}
