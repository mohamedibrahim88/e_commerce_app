import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/core/services/home_service.dart';
import 'package:e_commerce_app/model/category_model.dart';
import 'package:e_commerce_app/model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController{
  
  ValueNotifier<bool> get loading =>_loading;

  ValueNotifier <bool> _loading = ValueNotifier(true);
  List<CategoryModel> _categoryModel= [];

  List<ProductModel> _productModel=[];

  List<CategoryModel> get categoryModel =>_categoryModel;

  List <ProductModel> get productModel => _productModel;

  HomeViewModel(){
    _loading.value=true;
    getCategory();
    getProduct();
    _loading.value= false;
  }

  getCategory() async {
    //_loading.value = true;
    HomeService().getCategory().then((value) {

      for (int i = 0; i<value.length; i++){

        _categoryModel.add(CategoryModel.fromJson(value[i].data()));
      }
     // _loading.value= false;
      print(_categoryModel.length);
      update();
    });
  }

  getProduct() async {
   // _loading.value = true;
    HomeService().getProduct().then((value) {

      for (int i = 0; i<value.length; i++){

        _productModel.add(ProductModel.fromJson(value[i].data()));
      }
    //  _loading.value= false;
      print(_categoryModel.length);
      update();
    });
  }
  
}
