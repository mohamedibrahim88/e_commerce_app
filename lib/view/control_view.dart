import 'package:e_commerce_app/core/view_model/auth_view_model.dart';
import 'package:e_commerce_app/core/view_model/control_view_model.dart';
import 'package:e_commerce_app/view/auth/login_screen.dart';
import 'package:e_commerce_app/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlView extends GetWidget<AuthViewModel> {

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthViewModel>().user == null)
          ? LoginScreen()
          : GetBuilder<ControlViewModel>(
            init: ControlViewModel(),
            builder: (controller)=> Scaffold(
            body: controller.currentScreen,
            bottomNavigationBar: bottomNavigationBar(),
      ),
          );
    });
  }

  Widget bottomNavigationBar() {
    return GetBuilder<ControlViewModel>(
      init: ControlViewModel(),
      builder: (controller) => BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              activeIcon: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      Text('Explore'),
                      Padding(
                        padding: const EdgeInsets.only(top: 3),
                        child: Image.asset(
                          'assets/images/Dot.png',
                          fit: BoxFit.contain,
                        ),
                      )
                    ],
                  )),
              label: '',
              icon: Image.asset(
                'assets/images/Icon_Explore.png',
                fit: BoxFit.contain,
                width: 20,
              )),
          BottomNavigationBarItem(
              activeIcon: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      Text('Cart'),
                      Padding(
                        padding: const EdgeInsets.only(top: 3),
                        child: Image.asset(
                          'assets/images/Dot.png',
                          fit: BoxFit.contain,
                        ),
                      )
                    ],
                  )),
              label: "",
              icon: Image.asset('assets/images/Icon_Cart.png',
                  fit: BoxFit.contain, width: 20)),
          BottomNavigationBarItem(
              activeIcon: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      Text('Account'),
                      Padding(
                        padding: const EdgeInsets.only(top: 3),
                        child: Image.asset(
                          'assets/images/Dot.png',
                          fit: BoxFit.contain,
                        ),
                      )
                    ],
                  )),
              label: '',
              icon: Image.asset('assets/images/Path 5.png',
                  fit: BoxFit.contain, width: 20)),
        ],
        currentIndex: controller.navigatorValue,
        onTap: (index) {
          controller.changeSelectedValue(index);
          controller.currentScreen;
        },
        elevation: 0,
        selectedItemColor: Colors.black,
        backgroundColor: Colors.grey.shade50,
      ),
    );
  }
}
