import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanPage extends StatelessWidget {
  const ScanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MobileScanner(
            allowDuplicates: false,
            onDetect: (barcode, args) {
              final code = barcode.rawValue;
              debugPrint('Barcode found! $code');
              // TODO:
            },
          ),
          Center(
            child: Text(
              'Scan my QR Code',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
