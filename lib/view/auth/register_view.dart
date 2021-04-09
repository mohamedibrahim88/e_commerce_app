import 'package:e_commerce_app/core/view_model/auth_view_model.dart';
import 'package:e_commerce_app/view/auth/login_screen.dart';
import 'package:e_commerce_app/view/widgets/custom_button.dart';
import 'package:e_commerce_app/view/widgets/custom_text.dart';
import 'package:e_commerce_app/view/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constance.dart';
class RegisterView extends GetWidget<AuthViewModel> {
   GlobalKey<FormState> _formKey= GlobalKey<FormState>();
  String email ;
  String password ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap:(){
            Get.off(LoginScreen());
      },
      child : Icon(
      Icons.arrow_back,
      color: Colors.black,
      )
        )
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 50,
            right: 10,
            left: 10,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget> [
                CustomText(text: "Sign Up", fontSize: 30,),
                SizedBox(height: 20,),


                CustomTextFromField(
                  text: "Name",
                  hint: "username",
                  onSave: (value){
                    controller.name=value;
                  },
                  validator: (value){
                    if(value==null)
                      return "Invalid value";
                  },
                ),

                CustomTextFromField(
                  text: "Email",
                  hint: "example@gmai.com",
                  onSave: (value){
                    controller.email=value;
                  },
                  validator: (value){
                    if(value==null)
                      return "Invalid value";
                  },
                ),

                SizedBox(
                  height: 40,
                ),

                CustomTextFromField(
                  text: "Password",
                  hint: "********",
                  onSave: (value){
                    controller.password=value;
                  },
                  validator: (value){
                    if(value==null)
                      return "Invalid value";
                  },

                ),
                SizedBox(height: 10,),

                SizedBox(height: 20,),

                CustomButton(
                  onPress:(){
                    _formKey.currentState.save();
                    if(_formKey.currentState.validate()){
                      controller.createAccountWithEmailAndPassword();
                    }
                  } ,
                  text: "Sign up",
                ),

              ],
            ),
          ),


        ),
      ),

    );
  }
}

