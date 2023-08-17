import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code/model/qrcode_model.dart';

class FormController extends GetxController {
  Rx<List<QrcodeModel>> qrcode = Rx<List<QrcodeModel>>([]);
  TextEditingController linkText = TextEditingController();
  TextEditingController nameText = TextEditingController();
  TextEditingController contactText = TextEditingController();
  TextEditingController locationText = TextEditingController();
  TextEditingController emailText = TextEditingController();
  TextEditingController positionText = TextEditingController();
  late QrcodeModel qrcodeModel;
  var itemCount = 0.obs;

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  @override
  void onClose() {
    super.onClose();
    linkText.dispose();
    nameText.dispose();
    contactText.dispose();
    locationText.dispose();
    emailText.dispose();

  }

  addQrCode(String link, String name, String number, String location, String email, String position) {
    qrcodeModel = QrcodeModel(link: link, name: name, number: number, location: location, email: email, position: position);
    qrcode.value.add(qrcodeModel);
    itemCount.value = qrcode.value.length;
    linkText.clear();
    nameText.clear();
    contactText.clear();
    locationText.clear();
    emailText.clear();
    positionText.clear();
  }
  removeQR(int index){
    qrcode.value.removeAt(index);
    itemCount.value = qrcode.value.length;

  }
}
