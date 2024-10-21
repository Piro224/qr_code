import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code/model/form_controller.dart';
import 'package:qr_code/Pages/Business%20card/business_card_page.dart';

import '../../Utils/customTextFields.dart';
import '../../Utils/toast.dart';

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
              CustomTextField(
                  formcontroller: formcontroller,
                  labelText: 'Enter link for QRcode',
                  controller: formcontroller.linkText,
                  icon: Icons.link_outlined),
              CustomTextField(
                  formcontroller: formcontroller,
                  labelText: 'Enter your Full Name',
                  controller: formcontroller.nameText,
                  icon: Icons.person_pin),
              CustomTextField(
                  formcontroller: formcontroller,
                  labelText: 'Enter Specialty/Position eg. Teacher ***',
                  controller: formcontroller.positionText,
                  icon: Icons.work_outlined),
              CustomTextField(
                  formcontroller: formcontroller,
                  keyType: TextInputType.emailAddress,
                  labelText: 'Enter your Email',
                  controller: formcontroller.emailText,
                  icon: Icons.mail_sharp),
              CustomTextField(
                  formcontroller: formcontroller,
                  keyType: TextInputType.phone,
                  labelText: 'Enter your Contact eg. +41 *********',
                  controller: formcontroller.contactText,
                  icon: Icons.dialpad_outlined),
              CustomTextField(
                  formcontroller: formcontroller,
                  labelText: 'Enter your address',
                  controller: formcontroller.locationText,
                  icon: Icons.location_on),

              GestureDetector(
                onTap: () {
                  if (formcontroller.linkText.text.isEmpty) {
                    displayToastMessage("Link field is empty", context);
                  } else if (formcontroller.nameText.text.isEmpty) {
                    displayToastMessage(
                        "Namespace should not be empty", context);
                  } else if (formcontroller.emailText.text.isEmpty) {
                    displayToastMessage("Provide Email address", context);
                  } else if (!formcontroller.emailText.text.contains("@")) {
                    displayToastMessage("Email address is invalid", context);
                  } else if (formcontroller.contactText.text.isEmpty) {
                    displayToastMessage("Contact field is empty ", context);
                  } else if (formcontroller.contactText.text.length > 14) {
                    displayToastMessage("Contact number is invalid", context);
                  } else if (formcontroller.positionText.text.isEmpty) {
                    displayToastMessage("Profession space is empty", context);
                  } else if (formcontroller.locationText.text.isEmpty) {
                    displayToastMessage(
                        "Provide your location address", context);
                  } else {
                    displayToastMessage("Done Successfully", context);

                    Get.to(() => const BusinessCardQrPage());
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
