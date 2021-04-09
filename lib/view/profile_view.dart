import 'package:e_commerce_app/core/view_model/profile_view_model.dart';
import 'package:e_commerce_app/view/auth/login_screen.dart';
import 'package:e_commerce_app/view/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      init: ProfileViewModel(),
      builder: (controller) => controller.loading.value ? Center(
          child: CircularProgressIndicator(


          ))
          : Scaffold(
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            // color: Colors.red,
                            borderRadius: BorderRadius.all(
                              Radius.circular(100),
                            ),
                          ),
                          child: CircleAvatar(
                              backgroundImage: controller.userModel == null
                                  ? AssetImage('assets/images/User_icon.png')
                                  : controller.userModel.pic == 'default'
                                      ? AssetImage(
                                          'assets/images/User_icon.png',
                                        )
                                      : NetworkImage(
                                          controller.userModel.pic,
                                        ))),
                      Column(
                        children: [
                          CustomText(
                            text: controller.userModel.name,
                            fontWeight: FontWeight.bold,
                          ),
                          CustomText(
                            text: controller.userModel.email,
                          ),

                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 58,
                ),
                Container(
                  child: FlatButton(
                    onPressed: () {},
                    child: ListTile(
                      title: CustomText(text:'Edit Profile'),
                      leading: Image.asset('assets/images/Icon_Edit-Profile.png'
                      ),
                      trailing: Icon(
                        Icons.navigate_next,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),SizedBox(height: 20,),
                Container(
                  child: FlatButton(
                    onPressed: () {},
                    child: ListTile(
                      title: CustomText(text:'Shipping Address'),
                      leading: Image.asset('assets/images/Icon_Location.png'
                      ),
                      trailing: Icon(
                        Icons.navigate_next,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ), SizedBox(height: 20,),
                Container(
                  child: FlatButton(
                    onPressed: () {},
                    child: ListTile(
                      title: CustomText(text:'Order History'),
                      leading: Image.asset('assets/images/Icon_History.png'
                      ),
                      trailing: Icon(
                        Icons.navigate_next,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ), SizedBox(height: 20,),
                Container(
                  child: FlatButton(
                    onPressed: () {},
                    child: ListTile(
                      title: CustomText(text:'Cards '),
                      leading: Image.asset('assets/images/Icon_Payment.png'
                      ),
                      trailing: Icon(
                        Icons.navigate_next,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ), SizedBox(height: 20,),
                Container(
                  child: FlatButton(
                    onPressed: () {},
                    child: ListTile(
                      title: CustomText(text:'Notifications'),
                      leading: Image.asset('assets/images/Icon_Alert.png'
                      ),
                      trailing: Icon(
                        Icons.navigate_next,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ), SizedBox(height: 20,),
                Container(
                  child: FlatButton(
                    onPressed: () {
                      controller.signOut();
                      Get.offAll(LoginScreen());
                    },
                    child: ListTile(
                      title: CustomText(text:'Log Out'),
                      leading: Image.asset('assets/images/Icon_Exit.png'
                      ),
                      trailing: Icon(
                        Icons.navigate_next,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ), SizedBox(height: 20,),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
