import 'package:e_commerce_app/core/view_model/checkout_view_model.dart';
import 'package:e_commerce_app/view/widgets/custom_text.dart';
import 'package:e_commerce_app/view/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GetBuilder<CheckOutViewModel>(
          init:  Get.find(),
          builder:(controller)=> Form(
              key: controller.formState,
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: SingleChildScrollView(
                    child: Expanded(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          CustomText(
                            text: "Billing address is the same as delivery address",
                            fontSize: 14,
                            alignment: Alignment.center,
                          ),
                          CustomTextFromField(
                            onSave: (value){
                              controller.street1= value;
                            },
                            validator: (value){
                              if (value.isEmpty) {
                                return "please enter th  street1";
                              }
                            },
                            text: 'Street 1',
                            hint: '21, Alex Davidson Avenue',
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CustomTextFromField(
                            onSave: (value){
                              controller.street2= value;
                            },
                            validator: (value){
                              if (value.isEmpty) {
                                return "please enter th second street";
                              }
                            },
                            text: 'Street 2',
                            hint: 'Opposite Omegatron, Vicent Quarters',
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CustomTextFromField(
                            onSave: (value){
                              controller.city= value;
                            },
                            validator: (value){
                              if (value.isEmpty) {
                                return "please enter th  city";
                              }
                            },
                            text: 'City ',
                            hint: 'Victoria Island',
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: Get.width,
                            child: Row(
                              children: [
                                Expanded(
                                  child: CustomTextFromField(
                                    onSave: (value){
                                      controller.state= value;
                                    },
                                    validator: (value){
                                      if (value.isEmpty) {
                                        return "please enter th  state";
                                      }
                                    },
                                    text: 'State',
                                    hint: 'Lagos State',
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: CustomTextFromField(
                                    onSave: (value){
                                      controller.country= value;
                                    },
                                    validator: (value){
                                      if (value.isEmpty) {
                                        return "please enter th  country";
                                      }
                                    },
                                    text: 'Country',
                                    hint: 'Nigeria',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ),
        ),
    );
  }
}
