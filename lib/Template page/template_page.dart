// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:qr_code/Pages/Bookings/booking_form_page.dart';
import 'package:qr_code/Pages/Product%20Ads/product_ads_form_page.dart';
import 'package:qr_code/Pages/Full%20Qrcode/full_qrcodeForm_Page.dart';
import 'package:qr_code/Template%20page/template_card.dart';

import '../Pages/Business card/business_card_form_page.dart';

class TemplatePage extends StatelessWidget {
  TemplatePage({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime? lastPressed;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.red[300],
        centerTitle: false,
        // automaticallyImplyLeading: false,
        title: const Text(
          'Choose Template',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        elevation: 0,
      ),
      body: WillPopScope(
        onWillPop: () async {
          if (Platform.isAndroid) {
            final now = DateTime.now();
            final maxDuration = Duration(seconds: 2);
            final isWarning = lastPressed == null ||
                now.difference(lastPressed!) > maxDuration;

            if (isWarning) {
              lastPressed = DateTime.now();

              // final snackBar = SnackBar(
              //   content: GestureDetector(
              //     onTap: () {
              //       if (Platform.isAndroid) {
              //         Future.delayed(const Duration(milliseconds: 3000));
              //         SystemNavigator.pop();
              //       } else {
              //         exit(0);
              //       }
              //     },
              //     child: Text(
              //       'Tap here to Close app',
              //       style: TextStyle(
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ),
              //   ),
              //   duration: maxDuration,
              // );

              // ScaffoldMessenger.of(context)
              //   ..removeCurrentSnackBar()
              //   ..showSnackBar(snackBar);

              return false;
            } 
            else {
              return true;
            }
          }else{
            exit(0);
          }

        },
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 10),
          physics: const BouncingScrollPhysics(),
          children: [
            TemplateCards(
              cardName: 'Full QRCode',
              onTap: () {
                // A page called get your tickets here
                Get.to(() => const FullQrcodeFormPage());
              },
            ),
            TemplateCards(
              cardName: 'Business Cards',
              onTap: () {
                //A page that create a business card qr code
                Get.to(() => const BusinessCardFormPage());
              },
            ),
            TemplateCards(
              cardName: 'Event Bookings',
              onTap: () {
                //A page called scan me to BOOK
                Get.to(() => const BookingFormPage());
              },
            ),
            TemplateCards(
              cardName: 'Shop ads',
              onTap: () {
                //A page called scan me to check out my products
                Get.to(() => const ProductAdsFormPage());
              },
            ),
          ],
        ),
      ),
    );
  }
}
