import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:sample/drawerMenu.dart';

import 'constants.dart';
import 'detailScreen.dart';


class HomeScreen extends StatefulWidget {
  //const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> bannerList = [
  "https://images.pexels.com/photos/1583884/pexels-photo-1583884.jpeg?"
  "https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?"
  "https://images.pexels.com/photos/1279330/pexels-photo-1279330.jpeg?"
  "https://images.pexels.com/photos/2983101/pexels-photo-2983101.jpeg?"
  "https://images.pexels.com/photos/628776/pexels-photo-628776.jpeg?"
  "https://images.pexels.com/photos/3186654/pexels-photo-3186654.jpeg?"
  "https://images.pexels.com/photos/1351238/pexels-photo-1351238.jpeg?"
  "https://images.pexels.com/photos/327098/pexels-photo-327098.jpeg?"
  "https://images.pexels.com/photos/3850838/pexels-photo-3850838.jpeg?"
  "https://images.pexels.com/photos/2103949/pexels-photo-2103949.jpeg?"
  ];

  double translateX = 0.0;

  double translateY = 0.0;

  double scale = 1.0;

  bool toggle = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DrawerMenu(),
        AnimatedContainer(
          duration: Duration(milliseconds: 800),
          transform: Matrix4.translationValues(translateX, translateY, 0)..scale(scale),
          child: ClipRRect(
            borderRadius : toggle?  BorderRadius.circular(30) : BorderRadius.circular(0),
            child: Scaffold(
              appBar: AppBar(
                leading: IconButton(onPressed: () {
                  toggle = !toggle;
                  if (toggle == true) {
                    translateX = 200.0;
                     translateY = 80.0;
                     scale = 0.8;
                  } else {
                    translateX = 0.0;
                    translateY = 0.0;
                    scale = 1;
                  }
                  setState(() {

                  });
                },
                    icon: Icon(Icons.menu, color: Colors.black,)),
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(deliveryTo,
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(color: Colors.black45),
                    ),
                    InkWell(
                      onTap: () {
                        print("Clicked");
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(currentLocation, style: Theme.of(context).textTheme.headline6!.copyWith(fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.blueAccent,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 45,
                             // margin: EdgeInsets.symmetric(horizontal: 5),
                              padding: EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(30)
                              ),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    print("Search");
                                  },
                                  child: Row(
                                    children: [
                                      Icon(Icons.search),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(search, style: Theme.of(context).textTheme.subtitle2!.copyWith(color: Colors.black45),
                                      ),
                                    ],
                                  ),

                                ),
                              ),
                            ),
                          ),
                          IconButton(onPressed: () {},
                              icon: Image.asset(filterIcon,
                              height: 23,
                              width: 23,
                              ),
                          )
                        ],
                      ),
                      // Category
                      SizedBox(height: 20,),
                      titleWidget(context, "Category"),
                      Container(
                        height: 115,
                        child: ListView.builder(
                           scrollDirection: Axis.horizontal,
                           itemCount: categoryList.length,
                            itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(17),
                                height: 70,
                                width: 70,
                                margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                                color: Colors.blueAccent.withOpacity(0.3),
                              ),
                                child: Image.asset(categoryList[index].imageUrl,),
                              ),
                              Text(categoryList[index].name,
                                style: Theme.of(context).textTheme.subtitle2!.copyWith(color: Colors.black87, fontWeight: FontWeight.bold),),
                            ],
                          );
                        }),
                      ),
                      titleWidget(context, "Popular"),
                      for (int i = 0; i < popularList.length; i++) ... {
                       MenuList(bannerList: bannerList),
                      },
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget titleWidget(BuildContext context, String title) {
    return Text(title,
            style: Theme.of(context).textTheme.headline5!.copyWith(fontWeight: FontWeight.bold),
          );
  }
}

class MenuList extends StatelessWidget {
  const MenuList({
    Key? key,
    required this.bannerList,
  }) : super(key: key);

  final List<String> bannerList;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(context,
          MaterialPageRoute(builder: (context) => DetailScreen()),
        )
      },
      child: Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
              BoxShadow(
              color: Colors.grey.shade300,
              spreadRadius: 5,
              blurRadius: 5,
              )
              ]
              ),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Container(
              height: 220,
              margin: EdgeInsets.only(bottom: 5),
              decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10),
              topRight: Radius.circular(10)),
              image: DecorationImage(
              image: NetworkImage(bannerList[0]),
              fit: BoxFit.cover,
              ),
              ),
              ),
              Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Food Name",
              style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
              ),
              Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
              children: [
              Icon(
              Icons.star,
              color: Colors.blueAccent,
              ),
              Text("4.5", style: TextStyle(color: Colors.blueAccent),),
              Text("(125 Ratings)"
              ),
              Spacer(),
              Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text("Finger Fries"),
              ),
              Text("Rs.100"),
              ],
              ),
              ),
              SizedBox(
              height: 5,
              )
              ],
              ),
              ),
    );
  }
}

class CategoryModel {
  String imageUrl;
  String  name;
  CategoryModel(
      { required this.imageUrl, required this.name });
}

List<CategoryModel> categoryList = [
  CategoryModel(imageUrl: fastFoodIcon, name: "Fast Food"),
  CategoryModel(imageUrl: fruitIcon, name: "Fruits"),
  CategoryModel(imageUrl: pizzaIcon, name: "Pizza"),
  CategoryModel(imageUrl: restaurantIcon, name: "Restaurant"),
  CategoryModel(imageUrl: tacoIcon, name: "Taco"),
];

class PopularItemModel {
  String imageUrl;
  String foodName;
  String rating;
  String ratingCount;
  String foodDetail;
  String price;
  PopularItemModel(this.imageUrl, this.foodName, this.rating, this.ratingCount,
      this.foodDetail, this.price);
}

List<PopularItemModel> popularList = [
  PopularItemModel("Https://images.pexels.com/photos/1583884/pexels-photo-1583884.jpeg?",
      "foodName", "4.5", "100Ratings", "FingerFries", "100"),
  PopularItemModel("https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?",
      "foodName", "4.5", "100Ratings", "FingerFries", "100"),
  PopularItemModel("https://images.pexels.com/photos/1279330/pexels-photo-1279330.jpeg?",
      "foodName", "4.5", "100Ratings", "FingerFries", "100"),
  PopularItemModel("https://images.pexels.com/photos/2983101/pexels-photo-2983101.jpeg?",
      "foodName", "4.5", "100Ratings", "FingerFries", "100"),
  PopularItemModel("https://images.pexels.com/photos/628776/pexels-photo-628776.jpeg?",
      "foodName", "4.5", "100Ratings", "FingerFries", "100"),
  PopularItemModel("https://images.pexels.com/photos/3186654/pexels-photo-3186654.jpeg?",
      "foodName", "4.5", "100Ratings", "FingerFries", "100"),
];