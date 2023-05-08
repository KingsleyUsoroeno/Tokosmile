import 'package:tokosmile/extensions/string_extension.dart';

enum ProductType { shirt, dress, shoes }

class Product {
  final String image;
  final ProductType productType;
  final double price;
  final String productDesc;
  final double rating;
  final int reviews;
  final bool isBookmarked;
  final List<String> productSmallImages;
  final List<String> productCheckLists;
  final String sellerName;
  final String brandName;
  final String condition;
  final String color;
  final String material;
  final String size;

  String get category => productType.name.capitalize;

  Product({
    required this.image,
    required this.productType,
    required this.price,
    required this.productDesc,
    this.rating = 4.9,
    this.reviews = 0,
    this.isBookmarked = false,
    required this.size,
    required this.color,
    this.material = "Cotton Fabric",
    required this.brandName,
    required this.sellerName,
    this.condition = "Perfect",
    required this.productSmallImages,
    this.productCheckLists = const <String>[
      "Use your mockups to make engaging posts on social media, blog posts, ads, and more.",
      "Make product image updates quickly and seamlessly. Imagine refreshing your product page in just a few minutes. ",
      "Product mockups are great for building a product catalog. ",
      "use product-focused images with a clean background to emphasize the design. ",
      "Mockups are a great business tool for showcasing products. They can be used for various business sizes and across industries. ",
    ]
  });
}

final products = <Product>[
  Product(
    productType: ProductType.shirt,
    price: 12.0,
    productDesc: "Essential Men's Short Sleeve Crew-neck T-Shirt",
    rating: 4.0,
    reviews: 3000,
    image: "assets/images/product-images/mens-short-sleeve-t-shirt.jpeg",
    sellerName: "Batman",
    size: "Large",
    color: "Grey",
    productSmallImages:
        List.generate(4, (_) => "assets/images/product-images/mens-short-sleeve-t-shirt.jpeg"),
    brandName: "New york deluxe",
    isBookmarked: true,
  ),
  Product(
    productType: ProductType.shoes,
    price: 30.0,
    productDesc: "The all new and inspired Micheal B Jordan air",
    rating: 5.0,
    reviews: 4000,
    sellerName: "Micheal Jordan",
    brandName: "Jordan's",
    image: "assets/images/product-images/air_jordans.jpeg",
    productSmallImages: List.generate(4, (_) => "assets/images/product-images/air_jordans.jpeg"),
    size: "Men's 43",
    color: "Green",
    condition: "Perfect Condition",
    isBookmarked: true,
  ),
  Product(
    productType: ProductType.dress,
    price: 100.0,
    productDesc: "Stylish and elegant dress that fits all casual and date night occasions",
    rating: 3.5,
    reviews: 100,
    image: "assets/images/female-elegant-dress.jpeg",
    productSmallImages: List.generate(4, (_) => "assets/images/product-images/female-elegant-dress.jpeg"),
    sellerName: "Panosundaki Pin",
    brandName: "Pin-interest",
    color: "Blue",
    size: "Large",
    isBookmarked: true,
  ),
  Product(
    productType: ProductType.shirt,
    price: 10.0,
    productDesc: "Mens Patterned Vintage T-shirts Floral Short Sleeve Shirts",
    rating: 4.5,
    reviews: 40,
    image: "assets/images/product-images/mens_vintage_shirt.jpeg",
    productSmallImages: List.generate(4, (_) => "assets/images/product-images/mens_vintage_shirt.jpeg"),
    sellerName: "sdr.com.ec",
    brandName: "Pin-interest",
    color: "Yellow | Black | Indigo",
    size: "Large",
  ),
  Product(
    productType: ProductType.shirt,
    price: 12.0,
    productDesc: "Essential Men's Short Sleeve Crewneck T-Shirt",
    sellerName: "Batman",
    brandName: "Wayne Bruce",
    size: "Extra-Large",
    productSmallImages: List.generate(4, (_) => "assets/images/mens-gym-top.jpeg"),
    image: "assets/images/product-images/mens-gym-top.jpeg",
    color: "Brown",
  ),
  Product(
    productType: ProductType.shirt,
    price: 12.0,
    productDesc: "Essential Men's Short Sleeve Crewneck T-Shirt",
    sellerName: "Batman",
    brandName: "Wayne Bruce",
    size: "Extra-Large",
    productSmallImages: List.generate(4, (_) => "assets/images/mens-gym-top.jpeg"),
    image: "assets/images/product-images/mens-gym-top.jpeg",
    color: "Brown",
  ),
  Product(
    productType: ProductType.shirt,
    price: 12.0,
    productDesc: "Essential Men's Short Sleeve Crewneck T-Shirt",
    sellerName: "Batman",
    brandName: "Wayne Bruce",
    size: "Extra-Large",
    productSmallImages: List.generate(4, (_) => "assets/images/product-images/mens-gym-top.jpeg"),
    image: "assets/images/product-images/mens-gym-top.jpeg",
    color: "Brown",
  ),
  Product(
    productType: ProductType.shirt,
    price: 12.0,
    productDesc: "Essential Men's Short Sleeve Crewneck T-Shirt",
    sellerName: "Batman",
    brandName: "Wayne Bruce",
    size: "Extra-Large",
    productSmallImages: List.generate(4, (_) => "assets/images/product-images/mens-gym-top.jpeg"),
    image: "assets/images/product-images/mens-gym-top.jpeg",
    color: "Brown",
  ),
  Product(
    productType: ProductType.shirt,
    price: 12.0,
    productDesc: "Essential Men's Short Sleeve Crewneck T-Shirt",
    sellerName: "Batman",
    brandName: "Wayne Bruce",
    size: "Extra-Large",
    productSmallImages: List.generate(4, (_) => "assets/images/product-images/mens-gym-top.jpeg"),
    image: "assets/images/product-images/mens-gym-top.jpeg",
    color: "Brown",
  ),
];
