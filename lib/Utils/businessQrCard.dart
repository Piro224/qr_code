import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../model/form_controller.dart';

Container businessbuildCard(FormController formcontroller, int index) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: 400,
      height: 250,
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
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
                    size: 120,
                    data: formcontroller.qrcode.value[index].link,

                    // backgroundColor: Colors.black,
                    // foregroundColor: Colors.white,
                    // embeddedImage: const AssetImage('assets/images/img 1.jpg'), //embedded images
                  ),
                ),
              ),
              Container(
                height: 30,
                width: 130,
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
          const SizedBox(width: 7),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 7.0, right: 7.0),
                  child: Text(
                    formcontroller.qrcode.value[index].name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(height: 7),
                Row(
                  children: [
                    const Icon(Icons.work_outlined, color: Colors.black),
                    const SizedBox(width: 7),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.only(right: 7.0),
                      child: Text(
                        formcontroller.qrcode.value[index].position,
                        style: const TextStyle(fontSize: 12),
                      ),
                    )),
                  ],
                ),
                const SizedBox(height: 7),
                Row(
                  children: [
                    const Icon(Icons.phone_sharp, color: Colors.black),
                    const SizedBox(width: 7),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.only(right: 7.0),
                      child: Text(
                        formcontroller.qrcode.value[index].number,
                        style: const TextStyle(fontSize: 12),
                      ),
                    )),
                  ],
                ),
                const SizedBox(height: 7),
                Row(
                  children: [
                    const Icon(Icons.mail, color: Colors.black),
                    const SizedBox(width: 7),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.only(right: 7.0),
                      child: Text(
                        formcontroller.qrcode.value[index].email,
                        style: const TextStyle(fontSize: 12),
                      ),
                    )),
                  ],
                ),
                const SizedBox(height: 7),
                Row(
                  children: [
                    const Icon(Icons.location_on_rounded, color: Colors.black),
                    const SizedBox(width: 7),
                    Expanded(
                      child: Text(
                        formcontroller.qrcode.value[index].location,
                        style: const TextStyle(fontSize: 12),
                        maxLines: 3,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }