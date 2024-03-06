import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code/Pages/Full%20Qrcode/full_qrcode.dart';
import 'package:qr_code/model/form_controller.dart';
import 'package:qr_code/Pages/Business%20card/business_card_page.dart';

class BusinessCardFormPage extends StatefulWidget {
  const BusinessCardFormPage({super.key});

  @override
  State<BusinessCardFormPage> createState() => _BusinessCardFormPageState();
}

class _BusinessCardFormPageState extends State<BusinessCardFormPage> {
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
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 15,
                ),
                child: TextField(
                  controller: formcontroller.nameText,
                  decoration: const InputDecoration(
                    labelText: 'Enter your Full Name',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person_pin, color: Colors.black),
                  ),
                ),
              ),
               Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 15,
                ),
                child: TextField(
                  controller: formcontroller.positionText,
                  decoration: const InputDecoration(
                    labelText: 'Enter Specialty/Position eg. Teacher ***',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.work_outlined, color: Colors.black),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 15,
                ),
                child: TextField(
                  controller: formcontroller.emailText,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Enter your Email',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.mail_sharp, color: Colors.black),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 15,
                ),
                child: TextField(
                  controller: formcontroller.contactText,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: 'Enter your Contact eg. +41 *********',
                    border: OutlineInputBorder(),
                    prefixIcon:
                        Icon(Icons.dialpad_outlined, color: Colors.black),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 15,
                ),
                child: TextField(
                  controller: formcontroller.locationText,
                  decoration: const InputDecoration(
                    labelText: 'Enter your address',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.location_on, color: Colors.black),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  if(formcontroller.linkText.text.isEmpty){
                    displayToastMessage("Link space is empty", context);
                  }
                  else if(formcontroller.nameText.text.isEmpty){
                    displayToastMessage("Namesapace should not be empty", context);
                  }
                  else if(formcontroller.emailText.text.isEmpty){
                    displayToastMessage("Provide Email address", context);
                  }
                  else if(!formcontroller.emailText.text.contains("@")){
                    displayToastMessage("Email address is invalid", context);
                  }
                  else if(formcontroller.contactText.text.isEmpty){
                    displayToastMessage("Contact space is empty ", context);
                  }
                  else if(formcontroller.contactText.text.length > 14){
                    displayToastMessage("Contact number is invalid", context);
                  }
                   else if(formcontroller.positionText.text.isEmpty){
                    displayToastMessage("Profession space is empty", context);
                  }
                  else if(formcontroller.locationText.text.isEmpty){
                    displayToastMessage("Provide your location address", context);
                  }
                  else{
                    displayToastMessage("Done Successfully", context);

                    Get.to(() => const BusinessCardQrPage());
                    formcontroller.addQrCode(
                    formcontroller.linkText.text,
                    formcontroller.nameText.text,
                    formcontroller.contactText.text,
                    formcontroller.locationText.text,
                    formcontroller.emailText.text,
                    formcontroller.positionText.text
                  );
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
              // MaterialButton(
              //   color: Colors.red[300],
              //   onPressed: () {
              //     Get.to(() => const BusinessCardQrPage());
              //     formcontroller.addQrCode(
              //       formcontroller.linkText.text,
              //       formcontroller.nameText.text,
              //       formcontroller.contactText.text,
              //       formcontroller.locationText.text,
              //       formcontroller.emailText.text,
              //     );
              //   },
              //   child: const Padding(
              //     padding: EdgeInsets.all(15.0),
              //     child: Text(
              //       'Create QR Card',
              //       style: TextStyle(
              //           fontWeight: FontWeight.bold,
              //           fontSize: 18,
              //           color: Colors.white),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
