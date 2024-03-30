import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code/Pages/Product%20Ads/product_ads_page.dart';
import 'package:qr_code/Utils/toast.dart';
import 'package:qr_code/model/form_controller.dart';


class ProductAdsFormPage extends StatefulWidget {
  const ProductAdsFormPage({super.key});

  @override
  State<ProductAdsFormPage> createState() => _ProductAdsFormPageState();
}

class _ProductAdsFormPageState extends State<ProductAdsFormPage> {
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
                    labelText: 'Enter heading eg. SHOP WITH US',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.title, color: Colors.black),
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
                    labelText: 'Enter some text eg. brief description',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.text_format, color: Colors.black),
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
                    labelText: 'Enter Contact eg. +41 *********',
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
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    labelText: 'Enter your location',
                    border: OutlineInputBorder(),
                    prefixIcon:
                        Icon(Icons.location_on_rounded, color: Colors.black),
                  ),
                ),
              ),
             
              GestureDetector(
                onTap: () {
                  if(formcontroller.linkText.text.isEmpty){
                    displayToastMessage("Link space is empty", context);
                  }
                  else if(formcontroller.nameText.text.isEmpty){
                    displayToastMessage("Heading space is empty", context);
                  }
                  else if(formcontroller.contactText.text.isEmpty){
                    displayToastMessage("Contact space is empty", context);
                  }
                  else if(formcontroller.locationText.text.isEmpty){
                    displayToastMessage("Location space is empty", context);
                  }
                   else if(formcontroller.positionText.text.isEmpty){
                    displayToastMessage("Plain text space is empty", context);
                  }
                  else{
                     Get.to(() => const ProductAdsPage());
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
              
            ],
          ),
        ),
      ),
    );
  }
}
