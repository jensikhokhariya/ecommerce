class Store {
  int? id;
  double? price;
  String? title, description, category, image;
  Rate? rating;

  Store(
      {this.id,
      this.price,
      this.title,
      this.description,
      this.category,
      this.image,
      this.rating});

  Store storeFactory(Map map) {
    return Store(
      id: map['id'],
      title: map['title'],
      price: map['price'],
      description: map['description'],
      category: map['category'],
      image: map['image'],
      rating: Rate().rateFactory(map['rating']),
    );
  }
}

class Rate {
  dynamic rate;
  int? count;

  Rate({this.rate, this.count});

  Rate rateFactory(Map map) {
    return Rate(rate: map['rate'], count: map['count']);
  }
}
