// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'dart:typed_data';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_code/model/form_controller.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';

class FullQrcodePage extends StatefulWidget {
  const FullQrcodePage({super.key});

  @override
  State<FullQrcodePage> createState() => _QrPageState();
}

class _QrPageState extends State<FullQrcodePage> {
  ScreenshotController screenshotController = ScreenshotController();
  final GlobalKey globalKey = GlobalKey();

  Uint8List? bytes;
  FToast fToast = FToast();

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);

    // loadImage();
    _requestPermission();
  }

  // showCaptureToast() {
  //   Widget toast = Container(
  //     padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(10),
  //       color: Colors.grey,
  //     ),
  //     child: const Row(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       children: [
  //         Icon(Icons.check_circle, color: Colors.white),
  //         SizedBox(width: 10),
  //         Expanded(
  //           child: Text(
  //             'Image Saved to Gallery ',
  //             style: TextStyle(color: Colors.white, fontSize: 18),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );


  //   fToast.showToast(
  //     child: toast,
  //     gravity: ToastGravity.BOTTOM,
  //     toastDuration: const Duration(seconds: 3),
  //   );

  // }

  bool isCaptured = false;

  @override
  Widget build(BuildContext context) {
    FormController formcontroller = Get.find();
    return GetBuilder<FormController>(
      builder: (_) => Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.red[300],
          // iconTheme: const IconThemeData(color: Colors.black),
          centerTitle: true,
          elevation: 0,
          
          title: const Text(
            'QR Card',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: formcontroller.itemCount.value,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            backgroundColor: Colors.black,
                            context: context,
                            builder: (context) {
                              return Container(
                                height: 120,
                                decoration: const BoxDecoration(
                                  // color: Color(0xFF737373),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                ),
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.black87,
                                    // borderRadius: BorderRadius.only(
                                    //   topLeft: Radius.circular(20),
                                    //   topRight: Radius.circular(20),
                                    // ),
                                  ),
                                  child: _buildModalBottomsheet(
                                      context, formcontroller, index),
                                ),
                              );
                            });
                      },
                      child: buildCard(formcontroller, index));
                },
              ),
            ),
          ],
        ),
       
      ),
    );
  }

  Column _buildModalBottomsheet(
      BuildContext context, FormController formcontroller, int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      
      children: [
        ListTile(
          
          onTap: () async {
            Navigator.pop(context);
            final screenshotController = ScreenshotController();
            final bytes = await screenshotController.captureFromWidget(
              InheritedTheme.captureAll(
                context,
                Material(
                  child: buildCard(formcontroller, index),
                ),
              ),
            );
            setState(() => this.bytes = bytes);

            _saveImage(bytes);

            displayToastMessage("Image saved successfully", context);
          },
          leading: const Icon(Icons.image_rounded, color: Colors.white),
          title: const Text(
            "Save to Gallery",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
        
        ListTile(
          onTap: () {
            Navigator.pop(context);
            formcontroller.removeQR(index);
            setState(() {});
          },
          leading: const Icon(Icons.delete_sharp, color: Colors.white),
          title: const Text(
            "Delete",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }

  //To load image files
  Future loadImage() async {
    final appStorage = await getApplicationDocumentsDirectory();
    final file = File('${appStorage.path}/.jpg');
    if (file.existsSync()) {
      final bytes = await file.readAsBytes();
      setState(() => this.bytes = bytes);
    }
  }

  Future<String> _saveImage(Uint8List bytes) async {
    await [Permission.storage].request();

    final time = DateTime.now()
        .toIso8601String()
        .replaceAll('.', '_')
        .replaceAll(':', '-');
    final name = 'QR_shot_$time';
    final result =
        await ImageGallerySaver.saveImage(bytes, name: name, quality: 100);

    return result['filePath'];
  }

  _requestPermission() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request();
    final info = statuses[Permission.storage].toString();
    debugPrint(info);
  }

  Container buildCard(FormController formcontroller, int index) {
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
}

class ScanClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double ignoreHeight = 20;
    path.lineTo(0, size.height - ignoreHeight);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width, size.height - ignoreHeight);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}



displayToastMessage(String message, BuildContext context) {
  Fluttertoast.showToast(msg: message, fontSize: 16);
}