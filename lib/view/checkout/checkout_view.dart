import 'package:e_commerce_app/core/view_model/checkout_view_model.dart';
import 'package:e_commerce_app/helper/enum.dart';
import 'package:e_commerce_app/view/checkout/summary_widget.dart';
import 'package:e_commerce_app/view/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:status_change/status_change.dart';

import '../../constance.dart';
import 'add_address_widget.dart';
import 'delevery_time_widget.dart';

class CheckOutView extends StatelessWidget {
  Widget build(BuildContext context) {
    return GetBuilder<CheckOutViewModel>(
      init: CheckOutViewModel(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text(
            "CheckOut",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            SingleChildScrollView(
              child: Container(
                height: 100,
                child: StatusChange.tileBuilder(
                  theme: StatusChangeThemeData(
                    direction: Axis.horizontal,
                    connectorTheme:
                        ConnectorThemeData(space: 1.0, thickness: 1.0),
                  ),
                  builder: StatusChangeTileBuilder.connected(
                    itemWidth: (_) =>
                        MediaQuery.of(context).size.width / _processes.length,
                    nameWidgetBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Text(
                          _processes[index],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: controller.getColor(index),
                          ),
                        ),
                      );
                    },
                    indicatorWidgetBuilder: (_, index) {
                      if (index <= controller.index) {
                        return DotIndicator(
                          size: 35.0,
                          border: Border.all(color: Colors.green, width: 1),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.green,
                              ),
                            ),
                          ),
                        );
                      } else {
                        return OutlinedDotIndicator(
                          size: 30,
                          borderWidth: 1.0,
                          color: todoColor,
                        );
                      }
                    },
                    lineWidgetBuilder: (index) {
                      if (index > 0) {
                        if (index == controller.index) {
                          final prevColor = controller.getColor(index - 1);
                          final color = controller.getColor(index);
                          var gradientColors;
                          gradientColors = [
                            prevColor,
                            Color.lerp(prevColor, color, 0.5)
                          ];
                          return DecoratedLineConnector(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: gradientColors,
                              ),
                            ),
                          );
                        } else {
                          return SolidLineConnector(
                            color: controller.getColor(index),
                          );
                        }
                      } else {
                        return null;
                      }
                    },
                    itemCount: _processes.length,
                  ),
                ),
              ),
            ),
            controller.pages == Pages.DeliveryTime
                ? DeliveryTime()
                : controller.pages == Pages.AddAddress
                    ? AddAddress()
                    : Summary(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                controller.index==0 ?Container()
                : Expanded(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      width: 200,
                      height: 100,
                      padding: EdgeInsets.all(20),
                      child: FlatButton(
                        onPressed: () {
                          controller.changeIndex(controller.index - 1);
                        },
                        child: Text(
                          "Back",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      width: 200,
                      height: 100,
                      padding: EdgeInsets.all(20),
                      child: CustomButton(
                        onPress: () {
                          controller.changeIndex(controller.index + 1);
                        },
                        text: "Next",
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

final _processes = [
  'Delivery',
  'Address',
  'Summer',
];
