import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CandidateRegistrationScreen extends StatefulWidget {
  @override
  _CandidateRegistrationScreenState createState() =>
      _CandidateRegistrationScreenState();
}

class _CandidateRegistrationScreenState
    extends State<CandidateRegistrationScreen> {
  String name = "";
  int age = 0;
  String party = "";
  String profilePicture = "";

  void _submitForm() async {
    // Simulate a registration process (replace with your actual logic)
    await Future.delayed(Duration(seconds: 2)); // Simulate a delay

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Candidate registered successfully!'),
      ),
    );

    Navigator.pop(context);
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        profilePicture = pickedFile.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Candidate Registration'),
        backgroundColor: Colors.blue, // Adjust app bar color
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.blue, // Adjust border color
                      width: 2,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: profilePicture.isEmpty
                        ? Icon(Icons.add_a_photo, size: 60, color: Colors.blue)
                        : Image.asset(profilePicture),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Name",
                  labelStyle: TextStyle(color: Colors.blue), // Adjust label color
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.blue, // Adjust border color
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.blue, // Adjust border color
                    ),
                  ),
                ),
                onChanged: (value) => setState(() => name = value),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Age",
                  labelStyle: TextStyle(color: Colors.blue),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) =>
                    setState(() => age = int.tryParse(value) ?? 0),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Party",
                  labelStyle: TextStyle(color: Colors.blue),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                ),
                onChanged: (value) => setState(() => party = value),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text("REGISTER"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
