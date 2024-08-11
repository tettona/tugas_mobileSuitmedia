import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_suitmedia/thirdScreen.dart';
import 'models/modeluser.dart'; // Import model dari folder models

class Secondscreen extends StatelessWidget {
  final User? selectedUser;

  const Secondscreen({super.key, this.selectedUser});

  @override
  Widget build(BuildContext context) {
    // Nama pengguna yang akan ditampilkan jika ada pengguna yang dipilih
    final displayName = selectedUser != null
        ? "${selectedUser!.firstName} ${selectedUser!.lastName}"
        : "Jhone Doe";

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(
              color: Colors.indigo,
              icon: Icon(Icons.arrow_back_ios_rounded),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Expanded(
              child: Text(
                'Second Screen',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
            IconButton(
              color: Colors.transparent,
              icon: Icon(Icons.check),
              onPressed: () {
                // Logika navigasi untuk halaman berikutnya
              },
            ),
          ],
        ),
        automaticallyImplyLeading: false, // Sembunyikan ikon leading default
      ),
      body: Stack(
        children: [
          Divider(
            thickness: 0.6,
            color: Colors.grey.withOpacity(0.3),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 3),
                Text(
                  displayName,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
          Center(
            child: Text(
              "Selected User Name",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
          ),
          Positioned(
            bottom: 25,
            child: Container(
              width: 355,
              margin: EdgeInsets.fromLTRB(25, 8, 25, 8),
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  // Arahkan ke Thirdscreen dengan data pengguna yang ada
                  Get.to(() => Thirdscreen(
                      users: UserResponse.fromJson(localJsonData).data));
                },
                child: Text(
                  "Choose a User",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(43, 99, 123, 1),
                    shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
