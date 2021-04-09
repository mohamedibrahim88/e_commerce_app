import 'package:e_commerce_app/helper/extentions.dart';
import 'package:flutter/material.dart';

class ProductModel {
String productId, name, image, description, size, price, details;

Color color;

ProductModel(
      {this.name,
      this.image,
      this.description,
      this.color,
      this.size,
      this.price,
      this.details,
      this.productId});


ProductModel.fromJson(Map<dynamic, dynamic> map){
  if (map == null) {
    return;
  }
  name = map ['name'];
  image = map ['image'];
  description = map ['description'];
  color = HexColor.fromHex(map ['color']) ;
  size = map ['size'];
  price = map ['price'];
  details =map['details'];
  productId=map['productId'];
}

toJson (){
  return{
    'name': name,
    'image': image,
    'description':description,
    'color':color,
    'size':size,
    'price':price,
    'details': details,
    'productId':productId,
  };


}

}
