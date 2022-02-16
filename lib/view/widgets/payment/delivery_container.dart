import 'package:e_shop/config/routes.dart';
import 'package:e_shop/logic/controllers/auth_controller.dart';
import 'package:e_shop/logic/controllers/payment_controller.dart';
import 'package:e_shop/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliveryDetails extends StatefulWidget {
  const DeliveryDetails({Key? key}) : super(key: key);
  @override
  _DeliveryDetailsState createState() => _DeliveryDetailsState();
}

class _DeliveryDetailsState extends State<DeliveryDetails> {
  int radioContainerIndex = 1;
  bool radioIsSelected = false;
  final paymentController = Get.find<PaymentController>();
  final authController = Get.find<AuthController>();
  TextEditingController phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
  return Column(
      children: [
        buildRadioContainer(
            value: 1,
            color: radioIsSelected ? Colors.grey.shade300 : Colors.white,
            address: 'Egypt',
            onChanged: (int? value) {
              setState(() {
                radioContainerIndex = value!;
                radioIsSelected = !radioIsSelected;
              });
            },
            name: authController.userDisplayName.value,
            phone: 0109820809,
            title: 'E Commerce'),
        const SizedBox(
          height: 10,
        ),
        buildRadioContainer(
            value: 2,
            color: radioIsSelected ? Colors.white : Colors.grey.shade300,
            address: paymentController.address.value,
            onChanged: (int? value) {
              setState(() {
                radioContainerIndex = value!;
                radioIsSelected = !radioIsSelected;
              });
            },
            name: 'Nehru',
            phone: paymentController.phoneNumber.value,
            title: 'Delivery')
      ],
    );
});
  }

  Widget buildRadioContainer(
      {required String title,
      required String name,
      required int phone,
      required String address,
      required Color color,
      required int value,
      required Function onChanged}) {
    return Container(
      padding: const EdgeInsets.only(top: 7),
      height: 140,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3.0,
            blurRadius: 5.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Radio(
            value: value,
            groupValue: radioContainerIndex,
            onChanged: (int? value) {
              onChanged(value);
            },
            fillColor: MaterialStateColor.resolveWith((states) => Colors.red),
          ),
          const SizedBox(
            width: 10,
          ),
          const Padding(padding: EdgeInsets.only(top: 10)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextUtils(
                  text: title,
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              const SizedBox(
                height: 5,
              ),
              const Padding(padding: EdgeInsets.only(top: 10)),
              TextUtils(
                  text: name,
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.normal),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text('🇪🇬 +020'),
                  TextUtils(
                      text: phone.toString(),
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.normal),
                  const SizedBox(
                    width: 120,
                  ),
                  InkWell(
                    child: Icon(Icons.edit),
                    onTap: () {
                      Get.defaultDialog(
                        title: 'Enter Your Phone Number',
                        backgroundColor: Colors.white,
                        radius: 10,
                        content: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: TextField(
                            cursorColor: Colors.black,
                            keyboardType: TextInputType.text,
                            controller: phoneNumberController,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              focusColor: Colors.red,
                              prefixIcon: const Icon(
                                Icons.phone,
                                color: Colors.grey,
                              ),
                              suffixIcon:phoneNumberController.text.isNotEmpty ?null : IconButton(
                                onPressed: (){
                                  phoneNumberController.clear();
                                },
                                icon: const Icon(Icons.clear , color: Colors.black,),
                              ),
                              hintText: 'Enter you\'re Phone Number ',
                              hintStyle: const TextStyle(
                                color: Colors.black45,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        textCancel: 'Cancel',
                        textConfirm: 'Save',
                        //confirmTextColor: kMainColor,
                        onCancel: () {
                          phoneNumberController.clear();
                          Get.toNamed(RoutesNames.paymentScreen);
                        },
                        onConfirm: () {
                          if(phoneNumberController.text.length ==11 || phoneNumberController.text.length ==10) {
                            paymentController.phoneNumber.value =
                                int.parse(phoneNumberController.text);
                            paymentController.updateAddress();
                            Get.back();
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              TextUtils(
                  text: address,
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.normal),
            ],
          ),
        ],
      ),
    );
  }
}
