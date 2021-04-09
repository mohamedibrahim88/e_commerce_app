import 'package:e_commerce_app/constance.dart';
import 'package:e_commerce_app/helper/enum.dart';
import 'package:e_commerce_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class DeliveryTime extends StatelessWidget {
  Delivery delivery = Delivery.StandardDelivery;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 20),
          child: Column(
            children: [
              RadioListTile<Delivery>(
                  title: CustomText(
                    text: "Standard Delivery",
                    fontSize: 24,
                  ),
                  value: Delivery.StandardDelivery,
                  groupValue: delivery,
                  subtitle: CustomText(
                    text: "\nOrder will be delivered between 3 - 5 business days",
                  ),
                  activeColor: primaryColor,
                  onChanged: (value) {}),
              SizedBox(
                height: 20,
              ),
              RadioListTile<Delivery>(
                  title: CustomText(
                    text: "Next Day Delivery",
                    fontSize: 24,
                  ),
                  value: Delivery.NextDayDelivery,
                  groupValue: delivery,
                  subtitle: CustomText(
                    text:
                        "\nPlace your order before 6pm and your items will be delivered the next day",
                  ),
                  activeColor: primaryColor,
                  onChanged: (value) {}),
              SizedBox(
                height: 20,
              ),
              RadioListTile<Delivery>(
                  title: CustomText(
                    text: "Nominated Delivery",
                    fontSize: 24,
                  ),
                  value: Delivery.NominatedDelivery,
                  groupValue: delivery,
                  subtitle: CustomText(
                    text:
                        "\nPick a particular date from the calendar and order will be delivered on selected date",
                  ),
                  activeColor: primaryColor,
                  onChanged: (value) {}),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
