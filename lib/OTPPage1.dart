import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:pmlship/prosespage1.dart';

class OTPPage1 extends StatefulWidget {
  const OTPPage1({Key? key});

  @override
  _OTPPage1State createState() => _OTPPage1State();
}

class _OTPPage1State extends State<OTPPage1> {
  late Timer _timer;
  int _secondsRemaining = 59;
  bool _isTimerRunning =
      false; // Variabel untuk menandai apakah timer sedang berjalan

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (_secondsRemaining == 0) {
        setState(() {
          _timer.cancel();
        });
      } else {
        setState(() {
          _secondsRemaining--;
        });
      }
    });
    _isTimerRunning = true;
  }

  void _stopTimer() {
    _timer.cancel();
    _isTimerRunning = false;
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 60,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Colors.black,
      ),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFF4682B4)),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF4682B4),
              foregroundColor: Colors.white,
              side: BorderSide(color: const Color(0xFF4682B4)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              "Back",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(5),
        child: Container(
          margin: const EdgeInsets.only(top: 5),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Verifikasi OTP",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: const Text(
                  "081617708604",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
              Pinput(
                length: 4,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: defaultPinTheme.copyWith(
                  textStyle: TextStyle(color: Colors.black),
                  decoration: defaultPinTheme.decoration!.copyWith(
                    border: Border.all(color: const Color(0xFF4682B4)),
                  ),
                ),
                onCompleted: (pin) => debugPrint(pin),
              ),
              SizedBox(height: 10),
              Text(
                "sefiantodani@gmail.com",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              Pinput(
                length: 4,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: defaultPinTheme.copyWith(
                  textStyle: TextStyle(color: Colors.black),
                  decoration: defaultPinTheme.decoration!.copyWith(
                    border: Border.all(color: const Color(0xFF4682B4)),
                  ),
                ),
                onCompleted: (pin) => debugPrint(pin),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Handle Kirim OTP
                      if (!_isTimerRunning) {
                        _startTimer(); // Mulai timer jika belum berjalan
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4682B4),
                    ),
                    child: Text(
                      "Kirim OTP",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Handle Kirim Ulang OTP
                      _stopTimer(); // Hentikan timer
                      _startTimer(); // Mulai timer ulang
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4682B4),
                    ),
                    child: Text(
                      "Kirim Ulang OTP",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                "Duration: 00:$_secondsRemaining",
                style: TextStyle(
                  color: Color(0xFF4682B4),
                  fontSize: 18,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(75.0),
                child: SizedBox(height: 50),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => prosespage1()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4682B4),
                ),
                child: Text(
                  "Next",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
