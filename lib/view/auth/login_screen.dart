import 'package:e_commerce_app/constance.dart';
import 'package:e_commerce_app/core/view_model/auth_view_model.dart';
import 'package:e_commerce_app/view/auth/register_view.dart';
import 'package:e_commerce_app/view/widgets/custom_button.dart';
import 'package:e_commerce_app/view/widgets/custom_button_social.dart';
import 'package:e_commerce_app/view/widgets/custom_text.dart';
import 'package:e_commerce_app/view/widgets/custom_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey= GlobalKey<FormState>();
  String email , password ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
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
                Row(

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:<Widget> [

                    CustomText(text: "Welcome", fontSize: 30,),

                  GestureDetector(onTap: (){
                    Get.offAll(RegisterView());
                  }, child: CustomText(text: "Sign up",fontSize: 18, color: primaryColor,)),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                CustomText(text: "Sign in to continue",
                fontSize: 14,
                color: Colors.grey,),
                SizedBox(
                  height: 10,
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
                CustomText(
                  text: "Forget password",
                  fontSize: 14,
                  alignment: Alignment.topRight,

                ),
                SizedBox(height: 20,),

         CustomButton(
             onPress:(){
               _formKey.currentState.save();
               if(_formKey.currentState.validate()){
                 controller.signInWithEmailAndPassword();
               }
             } ,
             text: "Sign In",
         ),
              SizedBox(height: 20,),
                CustomText(text: "OR",
                alignment: Alignment.center,
                ),

                  CustomButtonSocial(

                    text: 'Sign In With Facebook',
                    imageName: 'assets/images/facebook_icon.png' ,
                    onPressed:(){ controller.facebookSignInMethod();}
                  ),
                  SizedBox(height: 10,),

                  CustomButtonSocial(
                    text: 'Sign In With Google',
                    imageName: 'assets/images/icons_Googl.png',
                    onPressed: (){
                      controller.googleSignInMethod();
                    }
                  ),
              ],
            ),
          ),


        ),
      ),

    );
  }
}
