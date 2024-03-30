// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code/Pages/Full%20Qrcode/full_qrcode.dart';

import '../../Utils/toast.dart';
import '../../model/form_controller.dart';

class FullQrcodeFormPage extends StatefulWidget {
  const FullQrcodeFormPage({super.key});

  @override
  State<FullQrcodeFormPage> createState() => _FullQrcodeFormPageState();
}

class _FullQrcodeFormPageState extends State<FullQrcodeFormPage> {
  @override
  Widget build(BuildContext context) {
    FormController formcontroller = Get.put(FormController());
    return GetBuilder<FormController>(
      builder: (_) => Scaffold(
        // backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.red[300],
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          title: const Text(
            'Fill to generate card',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 15,
                ),
                child: TextField(
                  // maxLines: 7,
                  // minLines: 1,
                  controller: formcontroller.linkText,
                  decoration: const InputDecoration(
                    labelText: 'Enter link for QRcode',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.link_sharp, color: Colors.black),
                    // fillColor: Colors.white,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  if(formcontroller.linkText.text.isEmpty){
                    
                    displayToastMessage("Link space is empty", context);
                  }
                  else{
                     Get.to(() => const FullQrcodePage());
                  formcontroller.addQrCode(
                      formcontroller.linkText.text,
                      formcontroller.nameText.text,
                      formcontroller.contactText.text,
                      formcontroller.locationText.text,
                      formcontroller.emailText.text,
                      formcontroller.positionText.text);
                  }
                 
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.red[300],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Center(
                    child: Text(
                      'Create QR Card',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
