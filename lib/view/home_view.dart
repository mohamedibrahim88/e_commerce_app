import 'package:e_commerce_app/core/view_model/control_view_model.dart';
import 'package:e_commerce_app/core/view_model/home_view_model.dart';
import 'package:e_commerce_app/view/details_view.dart';
import 'package:e_commerce_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  List<String> name = ['men', 's', 's', 's', 's'];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: Get.find(),
      builder:(controller)=> Scaffold(
          body: SingleChildScrollView(
            child: Container(
        padding: EdgeInsets.only(top: 50, left: 10, right: 10),
             child: Column(
            children: <Widget>[
              _searchTextFormField(),
              SizedBox(
                height: 20,
              ),
              CustomText(
                text: "Categories",
              ),
              SizedBox(
                height: 20,
              ),
              _listViewCategory(),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CustomText(
                    text: "Best Selling",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  CustomText(
                    text: "See All",
                    fontSize: 16,
                  )
                ],
              ),
              SizedBox(height: 20,),
              _listViewProducts(),
            ],
        ),
      ),
          )),
    );
  }

  Widget _searchTextFormField() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.grey.shade200),
      child: TextFormField(
        decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black,
            )),
      ),
    );
  }

  Widget _listViewCategory() {
    return GetBuilder<HomeViewModel>(
      builder: (controller)=> controller.loading.value ? Center(
        child: CircularProgressIndicator(

        ),
      ) : Container(
          height: 100,
          child: ListView.separated(
            itemCount: controller.categoryModel.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey.shade100,
                    ),
                    height: 60,
                    width: 60,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(controller.categoryModel[index].image),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomText(
                    text: controller.categoryModel[index].name,
                  )
                ],
              );
            },
            separatorBuilder: (BuildContext context, int index) => SizedBox(
              width: 20,
            ),
          )),
    );
  }

  Widget _listViewProducts() {
    return GetBuilder<HomeViewModel>(
      builder:(controller)=> controller.loading.value? Center(child: CircularProgressIndicator(),)
          : Container(
        height: 300,
          child: ListView.separated(
            itemCount: controller.productModel.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: (){
                  Get.to(DetailsView(model: controller.productModel[index],));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width *.4,

                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width *.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey.shade100,
                        ),
                        child: Column(
                          children: [
                            Image.network(controller.productModel[index].image,fit: BoxFit.fill,),
                          ],
                        ),
                      ),
                      CustomText(text: controller.productModel[index].name,
                      alignment: Alignment.bottomLeft,),
                      SizedBox(height: 10,),
                      CustomText(text:controller.productModel[index].description ,
                      fontSize: 12 ,
                      color: Colors.grey,
                      alignment: Alignment.bottomLeft,),
                       SizedBox(height: 10,),

                        CustomText(text: "\$" + controller.productModel[index].price,
                        color:Color.fromRGBO(0, 197, 105, 1),
                        fontSize: 16,)
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) => SizedBox(
              width: 20,
            ),
          )),
    );
  }


}
