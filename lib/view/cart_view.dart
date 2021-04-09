import 'package:e_commerce_app/constance.dart';
import 'package:e_commerce_app/core/view_model/cart_view_model.dart';
import 'package:e_commerce_app/view/checkout/checkout_view.dart';
import 'package:e_commerce_app/view/widgets/custom_button.dart';
import 'package:e_commerce_app/view/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CartView extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GetBuilder<CartViewModel>(
              init: Get.find(),
              builder:(controller)=> controller.cartProductModel.length==0 ?
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/images/Cart_empty.svg',
                  height: 200,
                  width: 200,),
                  SizedBox(height: 20,),
                  CustomText(text: "Cart Empty",//fontWeight: FontWeight.bold,
                  fontSize: 32,
                  alignment: Alignment.topCenter,)
                ],
              )
                  : Container(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Container(
                      height: 140,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                              left: 10,
                            ),
                            width: 150,
                            child: Image.network(
                              controller.cartProductModel[index].image,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 20, top: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //padding: EdgeInsets.only(left: 10),

                                CustomText(
                                  text: controller.cartProductModel[index].name,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  height: 5,
                                ),

                                // padding: EdgeInsets.only(left: 10),
                                CustomText(
                                  text: '\$' + controller.cartProductModel[index].price.toString(),
                                  color: primaryColor,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  height: 35,
                                  width: 100,
                                  decoration:
                                      BoxDecoration(color: Colors.grey.shade200),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                          child: Icon(Icons.add),
                                      onTap:(){controller.increaseQuantity(index);
                                          }
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Container(
                                          padding: EdgeInsets.only(top: 10),
                                          child: CustomText(
                                            text: controller.cartProductModel[index].quantity.toString(),
                                          )),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      GestureDetector(
                                        onTap:(){
                                          controller.decreaseQuantity(index);
                                        },
                                        child: Container(
                                          padding: EdgeInsets.only(bottom: 12),
                                          child: Icon(Icons.minimize),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  itemCount: controller.cartProductModel.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 15,
                    );
                  },
                ),
              ),
            ),
          ),
          Container(
            height: 84,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 16),
                  child: Column(
                    children: [
                      CustomText(
                        text: 'TOTAL',
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      GetBuilder<CartViewModel>(
                        init: Get.find(),
                        builder:(controller)=> CustomText(
                          text: '\$' + controller.totalPrice.toString(),
                          fontSize: 18,
                          color: primaryColor,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 10),
                  width: 146,
                  height: 50,
                  child: CustomButton(
                    text: 'CHECKOUT',
                    onPress: ()=> Get.to(CheckOutView())

                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
