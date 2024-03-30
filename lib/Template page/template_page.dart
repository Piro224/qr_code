import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code/Pages/Bookings/booking_form_page.dart';
import 'package:qr_code/Pages/Product%20Ads/product_ads_form_page.dart';
import 'package:qr_code/Pages/Full%20Qrcode/full_qrcodeForm_Page.dart';
import 'package:qr_code/Template%20page/template_card.dart';

import '../Pages/Business card/business_card_form_page.dart';

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

