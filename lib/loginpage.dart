import 'package:flutter/material.dart';
import 'package:pmlship/OTPPage2.dart';
import 'package:pmlship/OTPPage3.dart';
import 'package:pmlship/carapembayaran.dart';
import 'package:pmlship/ratingpage1.dart';
import 'package:pmlship/registerpage.dart';

class Loginpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Image.asset(
              'images/logo.png',
              height: 700,
              width: 700,
            ),
          ),
          TextField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF4682B4)),
                borderRadius: BorderRadius.circular(25),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF4682B4)),
                borderRadius: BorderRadius.circular(25),
              ),
              filled: true,
              fillColor: Colors.white,
              labelText: "Username",
              hintText: "Input username",
              helperText: "Username harus unik",
              prefixIcon: Icon(Icons.person),
            ),
          ),
          SizedBox(height: 16),
          TextField(
            obscureText: true,
            maxLength: 10,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF4682B4)),
                borderRadius: BorderRadius.circular(25),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF4682B4)),
                borderRadius: BorderRadius.circular(25),
              ),
              filled: true,
              fillColor: Colors.white,
              labelText: "Password",
              hintText: "Input password",
              helperText: "Password terdiri dari AlfaNumerik",
              prefixIcon: Icon(Icons.lock),
              suffix: TextButton(
                onPressed: () {
                  // Fungsi yang akan dijalankan ketika teks button "Lupa Password" ditekan
                  // Anda dapat menambahkan logika pemulihan kata sandi di sini
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => OTPPage3()));
                },
                child: Text(
                  "Lupa Password?",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Fungsi yang akan dijalankan ketika tombol "Sign Up" ditekan
              // Anda dapat menambahkan logika pendaftaran di sini
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => OTPPage2()));
            },
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Color(0xFF4682B4)),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
            child: Text("Login"),
          ),
          SizedBox(height: 8),
          Text(
            "Belum memiliki akun?",
            style: TextStyle(color: Colors.grey),
          ),
          ElevatedButton(
            onPressed: () {
              // Fungsi yang akan dijalankan ketika tombol "Sign Up" ditekan
              // Anda dapat menambahkan logika pendaftaran di sini
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => carapembayaran()));
            },
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Color(0xFF4682B4)),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
            child: Text("Sign Up"),
          ),
        ],
      ),
    ));
  }
}
