
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_suitmedia/secondScreen.dart';

class Firstscreen extends StatefulWidget {
  const Firstscreen({super.key});

  @override
  _FirstscreenState createState() => _FirstscreenState();
}

class _FirstscreenState extends State<Firstscreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _palindromeController = TextEditingController();

  void _checkPalindrome() {
    final String text = _palindromeController.text.trim();
    if (text.isEmpty) {
      // Show snackbar if text is empty
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter a text to check.')),
      );
      return;
    }

    // Check if the text is a palindrome
    final String reversedText = text.split('').reversed.join('');
    if (text == reversedText) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            backgroundColor: Colors.green,
            content: Text(
              'It is a palindrome!',
              style: TextStyle(color: Colors.white),
            )),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              'It is not a palindrome.',
              style: TextStyle(color: Colors.white),
            )),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.center,
          end: Alignment.bottomRight,
          colors: [Color.fromRGBO(219, 252, 242, 1), Colors.white60],
        ),
        image: DecorationImage(
          image: AssetImage("assets/images/suitpedia.png"),
          fit: BoxFit.cover,
          alignment: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: ListView(
          children: [
            SizedBox(
              height: 150,
            ),
            CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 70,
              child: IconButton(
                onPressed: () {},
                icon: Image(image: AssetImage("assets/images/fotosuit.png")),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(25, 8, 25, 8),
              child: TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  fillColor: Colors.white,
                  hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
                  hintText: 'Name',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(25, 8, 25, 8),
              child: TextField(
                controller: _palindromeController,
                decoration: InputDecoration(
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
                  hintText: 'Palindrome',
                ),
              ),
            ),
            SizedBox(height: 35),
            Container(
              margin: EdgeInsets.fromLTRB(25, 8, 25, 8),
              height: 50,
              child: ElevatedButton(
                onPressed: _checkPalindrome,
                child: Text(
                  "CHECK",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(43, 99, 123, 1),
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(25, 8, 25, 8),
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(Secondscreen());
                },
                child: Text(
                  "NEXT",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(43, 99, 123, 1),
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


