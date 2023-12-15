


import 'package:design_challenge_1/model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/category_model.dart';
import '../const/const.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    List<ProductModel> products = [
      ProductModel(name: 'Nike Air Running', Description: 'Best of all in just one place. Find your perfect product only here.', image: Images.shoe2, price: 139.00, isFavourite: true,backgroungColor: Colors.lightBlueAccent.withOpacity(0.2)),
      ProductModel(name: 'Nike Air Running', Description: 'Best of all in just one place. Find your perfect product only here.', image: Images.shoe24, price: 139.00, isFavourite: true,backgroungColor: Colors.pinkAccent.withOpacity(0.2)),
      ProductModel(name: 'Nike Sneaker', Description: 'Best of all in just one place. Find your perfect product only here.', image: Images.shoe1, price: 139.00, isFavourite: true,backgroungColor: Colors.lightGreen.withOpacity(0.2)),
    ];



    List<CategoryModel> categoryList = [
      CategoryModel(Id: 0, name: 'All', ),
      CategoryModel(Id: 1, name: 'Jordan',),
      CategoryModel(Id: 2, name: 'Running'),
      CategoryModel(Id: 3, name: 'Golf'),
      CategoryModel(Id: 4, name: 'Casual'),
    ];
    int? _value = 0;

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: IconButton(onPressed: (){

          }, icon: const Icon(Icons.menu,color: Colors.black,)),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        actions:  [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              onPressed: (){

              },
              icon: const CircleAvatar(
                backgroundImage: NetworkImage('https://randomuser.me/api/portraits/men/11.jpg'),
                radius: 25,
                //child: Image(image: NetworkImage('https://randomuser.me/api/portraits/men/11.jpg')),
              ),
            ),
          )
        ],
      ),
      body:  Padding(
        padding: EdgeInsets.only(left: 30,right: 30,top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nike Collection',style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
            ),
            SizedBox(height: 10,),
            Text('Everything you need at just one place.',style: TextStyle(
              color: Colors.grey
            ),
            ),
            SizedBox(height: 20,),
            Container(
              height: 45,
              decoration: BoxDecoration(
                color: CupertinoColors.lightBackgroundGray,
                borderRadius: BorderRadius.circular(25)
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: TextField(

                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide.none
                    ),
                    hintText: 'Search here...',
                    hintStyle: TextStyle(
                      fontSize: 14
                    ),
                    suffixIcon: Icon(Icons.search)
                  ),

                ),
              ),
            ),
            SizedBox(height: 10,),
            Container(height: 50,
              //color: Colors.red,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                  itemCount: categoryList.length,
                  itemBuilder: (context,position){
                    return Row(
                      children: [
                        ChoiceChip(
                          selectedColor: Colors.black,
                            backgroundColor: Colors.white,
                            label: Text(categoryList[position].name,
                            style: TextStyle(
                              color: _value == categoryList[position].Id ? Colors.white : Colors.black
                            )
                            ),
                            selected: _value == categoryList[position].Id,
                        onSelected: (bool selected){
                            setState(() {
                              _value = selected ? categoryList[position].Id : null;
                            });
                        },),
                        SizedBox(width: 8,)
                      ],
                    );
                  }),
            ),
            SizedBox(height: 10,),
            Expanded(
                child: ListView.builder(
                  itemCount: products.length,
                    itemBuilder: (context,position){
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Container(
                        decoration: BoxDecoration(
                            color: products[position].backgroungColor,
                          borderRadius: BorderRadius.circular(20)
                        ),
                        width: 200,
                        height: 150,
                        child:  Padding(
                          padding: EdgeInsets.only(left: 20,right: 20,
                          top: 20),
                          child:Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  radius: 9,
                                  backgroundColor: Colors.white,
                                  child: Icon(Icons.favorite,color: Colors.red,
                                    size: 13,),
                                ),
                                Container(
                                  height: 90,
                                  width: 120,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(image: AssetImage(products[position].image))
                                  ),
                                )
                              ],
                            ),
                            SizedBox(width: 20,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(products[position].name,style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16
                                ),),
                                SizedBox(height: 5,),
                                Container(
                                    width: 150,
                                    height: 100,
                                    //color: Colors.blue,
                                    child: Column(
                                      children: [
                                        Text(products[position].Description,
                                        style: TextStyle(
                                            color: Colors.black.withOpacity(0.5),
                                            fontSize: 13),),
                                        SizedBox(height: 1,),
                                        Container(
                                          width: 150,
                                          height: 50,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('\$139.00',style: TextStyle(
                                                fontWeight: FontWeight.bold
                                              ),),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 5),
                                                child: ElevatedButton(
                                                    style: ElevatedButton.styleFrom(
                                                      elevation: 0,
                                                      backgroundColor: Colors.black,
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(13)
                                                      )
                                                    ),
                                                    onPressed: (){

                                                }, child: Text('Buy',style: TextStyle(
                                                  fontSize: 12
                                                ),)),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    )),


                              ],

                            )],
                          )
                        ),
                      ),
                    );
                    }))
          ],
        ),
      ),
    );
  }
}
