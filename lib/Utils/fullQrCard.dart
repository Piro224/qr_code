import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../model/form_controller.dart';

Container FullQrbuildCard(FormController formcontroller, int index) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: 300,
      height: 330,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
            spreadRadius: 5,
            offset: Offset(4, 3),
          ),
        ],
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 5, color: Colors.black),
                ),
                child: QrImageView(
                  size: 250,
                  data: formcontroller.qrcode.value[index].link,
      
                  // backgroundColor: Colors.black,
                  // foregroundColor: Colors.white,
                ),
              ),
            ),
            Container(
              height: 50,
              width: 260,
              color: Colors.black,
              child: const Center(
                child: FittedBox(
                  child: Row(
                    children: [
                      Text(
                        'Scan Me',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(width: 10),
                      Icon(
                        Icons.qr_code_scanner_outlined,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }