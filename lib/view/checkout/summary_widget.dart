import 'package:e_commerce_app/constance.dart';
import 'package:e_commerce_app/core/view_model/cart_view_model.dart';
import 'package:e_commerce_app/core/view_model/checkout_view_model.dart';
import 'package:e_commerce_app/view/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Summary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GetBuilder<CartViewModel>(
        builder: (controller) => SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(20),
                height: 300,
                //color: Colors.red,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.cartProductModel.length,
                  itemBuilder: (context, index) => Container(
                    width: 130,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 130,
                          height: 150,
                          child: Image.network(
                            controller.cartProductModel[index].image,
                            fit: BoxFit.fill,
                          ),
                        ),
                        RichText(
                          maxLines: 1,
                          textAlign: TextAlign.start,
                          text: TextSpan(
                              style: TextStyle(color: Colors.black),
                              text: controller.cartProductModel[index].name),
                        ),
                        CustomText(
                          text: ('\$' +
                              controller.cartProductModel[index].price
                                  .toString()),
                          color: primaryColor,
                          alignment: Alignment.topLeft,
                        )
                      ],
                    ),
                  ),
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: 15,
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: CustomText(
                  text: "Shippng Address",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GetBuilder<CheckOutViewModel>(
                  init: Get.find(),
                  builder: (controller) => Padding(
                        padding: EdgeInsets.all(8),
                        child: CustomText(
                          text:
                              '${controller.street1 + ',' + controller.street2 + ',' + controller.state + ',' + controller.city + ',' + controller.country}',
                        ),
                      ))
            ],
          ),
        ),
      ),
    );
  }
}
