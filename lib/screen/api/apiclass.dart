class Store {
  int? id;
  double? price;
  String? title, description, category, images;
  List<dynamic>? rating;

  Store(
      {this.id,
      this.price,
      this.title,
      this.description,
      this.category,
      this.images,
      this.rating});

  Store newsFactory(Map map){
    return Store(id: map['id'],title: map['title'],price: map['price'],description: map['description'],category: map['category'],images: map['image']);
  }
}

class Rate{
  double? rate,count;

  Rate({this.rate, this.count});
   Rate rateFactory(Map map){
     return Rate(rate: map['rate'],count: map['count']);
   }
}