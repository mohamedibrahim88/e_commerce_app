
class CartProductModel {
  String name, image,  price, productId ;
  int quantity;

  CartProductModel(
      {this.name,
        this.image,
        this.quantity,
        this.price,
        this.productId
      });


  CartProductModel.fromJson(Map<dynamic, dynamic> map){
    if (map == null) {
      return;
    }
    productId=map['productId'];
    name = map ['name'];
    image = map ['image'];
    quantity = map ['quantity'];
    price = map ['price'];
  }

  toJson (){
    return{
      'productId':productId,
      'name': name,
      'image': image,
      'quantity':quantity,
      'price':price,
    };

  }

}
