import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code/Pages/Bookings/booking_page.dart';
import 'package:qr_code/Utils/toast.dart';

import '../../Utils/customTextFields.dart';
import '../../model/form_controller.dart';

class BookingFormPage extends StatefulWidget {
  const BookingFormPage({super.key});

  @override
  State<BookingFormPage> createState() => _BookingFormPageState();
}

class _BookingFormPageState extends State<BookingFormPage> {
  @override
  Widget build(BuildContext context) {
    FormController formcontroller = Get.put(FormController());
    return GetBuilder<FormController>(
        builder: (_) => Scaffold(
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
                        labelText: 'Enter heading eg. BOOK NOW',
                        controller: formcontroller.nameText,
                        icon: Icons.title),
                    CustomTextField(
                        formcontroller: formcontroller,
                        labelText: 'Enter some text eg. brief description',
                        controller: formcontroller.positionText,
                        icon: Icons.text_format),
                    CustomTextField(
                        formcontroller: formcontroller,
                        keyType: TextInputType.phone,
                        labelText:
                            'Enter Customer care contact eg. +41 *********',
                        controller: formcontroller.contactText,
                        icon: Icons.dialpad_outlined),
                    CustomTextField(
                        formcontroller: formcontroller,
                        labelText: 'Enter your location',
                        controller: formcontroller.locationText,
                        icon: Icons.location_on_rounded),
                    GestureDetector(
                      onTap: () {
                        if (formcontroller.linkText.text.isEmpty) {
                          displayToastMessage("Link field is empty", context);
                        } else if (formcontroller.nameText.text.isEmpty) {
                          displayToastMessage(
                              "Heading field is empty", context);
                        } else if (formcontroller.contactText.text.isEmpty) {
                          displayToastMessage(
                              "Contact field is empty", context);
                        } else if (formcontroller.locationText.text.isEmpty) {
                          displayToastMessage(
                              "Location field is empty", context);
                        } else if (formcontroller.positionText.text.isEmpty) {
                          displayToastMessage(
                              "Plain text field is empty", context);
                        } else {
                          displayToastMessage("Done Successfully", context);

                          Get.to(() => const BookingPage());
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
            ));
  }
}
