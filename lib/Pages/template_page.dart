import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code/Pages/Bookings/booking_form_page.dart';
import 'package:qr_code/Pages/Product%20Ads/product_ads_form_page.dart';
import 'package:qr_code/Pages/Full%20Qrcode/full_qrcodeForm_Page.dart';

import 'Business card/business_card_form_page.dart';

class TemplatePage extends StatelessWidget {
  const TemplatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.red[300],
        centerTitle: false,
       automaticallyImplyLeading: false,
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
      body: ListView(
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
    );
  }
}

class TemplateCards extends StatelessWidget {
  const TemplateCards({
    super.key,
    required this.cardName,
    required this.onTap,
  });

  final String cardName;

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.all(10),
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),

            // image: DecorationImage(

            //   fit: BoxFit.contain,
            //   image: AssetImage(imagePath),

            // ),
          ),
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.white,
                  blurRadius: 5,
                  spreadRadius: 1,
                  offset: Offset(4, 3),
                ),
              ],
              gradient: LinearGradient(
                colors: [
                  Colors.amber.withOpacity(0.7),
                  Colors.red.withOpacity(0.7),
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
            ),
            child: Center(
              child: Text(
                cardName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
