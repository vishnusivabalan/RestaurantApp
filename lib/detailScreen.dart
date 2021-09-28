import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample/FoodOrderPage.dart';
import 'constants.dart';



class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ConstrainedBox(
        constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width - 40,minHeight: 56),
        child: ElevatedButton(
          onPressed: () => {
            Navigator.push(context, MaterialPageRoute(builder: (context) => FoodOrderPage()))
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Place the Order", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),),
              Icon(Icons.chevron_right),

            ],
          ),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            primary: Colors.blueAccent,
          ),
        ),
      ),
      body: ListView(
        children: [
         CustomAppBar(context),
          Padding(padding:EdgeInsets.only(left: 20, top: 25, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Mushroom\nPizza", style: TextStyle(fontSize: 40,fontWeight: FontWeight.w600),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Rs.",
                      style: TextStyle(fontSize: 20, color: Colors.redAccent),
                    ),
                    Text("599",
                      style: TextStyle(fontSize: 45,
                          fontWeight: FontWeight.w700,
                          color: Colors.redAccent,
                      height: 1),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Size",
                            style: TextStyle(fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: CupertinoColors.systemGrey3),
                          ),
                          Text("Medium",
                            style: TextStyle(fontSize: 20,
                                fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text("Toppings",
                            style: TextStyle(fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: CupertinoColors.systemGrey3),
                          ),
                          Text("Mushroom",
                            style: TextStyle(fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text("Delivery Time",
                            style: TextStyle(fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: CupertinoColors.systemGrey3),
                          ),
                          Text("30 min",
                            style: TextStyle(fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width/2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                        boxShadow: [BoxShadow(
                          blurRadius: 20,
                          color: CupertinoColors.lightBackgroundGray,
                        ),],
                        image: DecorationImage(
                          image: NetworkImage("https://images.pexels.com/photos/628776/pexels-photo-628776.jpeg?"),
                          fit: BoxFit.cover,
                        ),
                        ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(left: 20, top: 40),
            child: Text("Ingrediants",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25),),
          ),
          SizedBox(height: 10),
          Padding(padding: EdgeInsets.only(left: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("* Mushroom",
                  style: TextStyle(fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: CupertinoColors.systemGrey3),
                ),
                Text("* onions",
                  style: TextStyle(fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: CupertinoColors.systemGrey3),
                ),
                Text("* Cheese",
                  style: TextStyle(fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: CupertinoColors.systemGrey3),
                ),
              ],
            )
          ),
        ],
      ),
    );
  }

  Padding CustomAppBar(BuildContext context) {
    return Padding(
           padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
         child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             GestureDetector(
               onTap: () => {
                 Navigator.pop(context)
               },
               child: Container(
                 padding: EdgeInsets.all(10),
                 decoration: BoxDecoration(
                   border: Border.all(color: CupertinoColors.systemGrey4),
                   borderRadius: BorderRadius.circular(10)
                 ),
                 child: Icon(Icons.chevron_left_rounded),
               ),
             ),
             Container(
               padding: EdgeInsets.all(10),
               decoration: BoxDecoration(
                   color: Colors.blueAccent,
                   borderRadius: BorderRadius.circular(10)
               ),
               child: Icon(Icons.star, color: Colors.white,),
             ),
           ],
         ),
       );
  }
}
