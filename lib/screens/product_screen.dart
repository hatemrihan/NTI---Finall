import 'package:final_project/app_colors.dart';
import 'package:final_project/app_styles.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductDetails(),
    ),
  );
}

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int Counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundClr,
      appBar: AppBar(
      backgroundColor: AppColors.backgroundClr,
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios)),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.share)),
          IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border_outlined)),
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Image.asset("assets/images/watch.png"),
                ),
                SizedBox(height: 4,),
                Text("MERIDIAN", style: AppStyles.style13Bold.copyWith(color: Color(0xff7B827A)),),
                Text("Classic Leather Chronograph", style: AppStyles.style24ExtraBold,),
                Row(
                  spacing: 10,
                  children: [
                    Text("\$245.00", style: AppStyles.style22Bold,),
                    Text("\$320.00", style: AppStyles.style14w300),  
                    Container(
                      width: 45,
                      height: 21,
                      decoration: BoxDecoration(
                        color: Color(0xffB9785B),
                        borderRadius: BorderRadius.circular(5),
                        shape: BoxShape.rectangle
                      ),
                      child: Center(child: Text("SALE", style: AppStyles.style11Bold.copyWith(color: Colors.white),)),
                      ),
                      Icon(Icons.star_border_outlined, color: AppColors.primaryClr, size: 20, fontWeight: FontWeight.w700,),
                      Text("4.8", style: AppStyles.style14SemiBold.copyWith(color: Colors.black),),
                      Text("(124 reviews)", style: AppStyles.style14SemiBold.copyWith(color: Colors.black),),
                  ],
                ),
                Divider(color: Color(0xffE8DDCB),),
                Text('Select Color', style: AppStyles.style13Bold,),
                Row(
                  spacing: 10,
                  children: [
                    CircleAvatar(
                      radius: 15,
                      child: ElevatedButton(onPressed: (){}, style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryClr,
                      ),
                      child: Text("green")),
                    ),
                    CircleAvatar(
                      radius: 15,
                      child: ElevatedButton(onPressed: (){}, style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffB9785B),
                      ),
                      child: Text("color")),
                    ),
                    CircleAvatar(
                      radius: 15,
                      child: ElevatedButton(onPressed: (){}, style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                      child: Text("black")),
                    ),
                    CircleAvatar(
                      radius: 15,
                      child: ElevatedButton(onPressed: (){}, style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffE8DDCB),
                      ),
                      child: Text("color")),
                    ),
                  ],
                ),
                Text("Select Size", style: AppStyles.style13Bold,),
                Row(
                  spacing: 8,
                  children: [
                    ElevatedButton(onPressed: (){}, 
                    style: ElevatedButton.styleFrom(
                      side: BorderSide(color: Color(0xffE8DDCB)),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)
                        )
                        
                      ),
                      child: Text("S", style: AppStyles.style13Bold.copyWith(color: Colors.black),)
                      ),
                    ElevatedButton(
                    onPressed: (){}, 
                    style: ElevatedButton.styleFrom(
                      side: BorderSide(color: Color(0xffE8DDCB)),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)
                        )
                      ),
                      child: Text("M", style: AppStyles.style13Bold.copyWith(color: Colors.black),)
                      ),
                    ElevatedButton(onPressed: (){}, 
                    style: ElevatedButton.styleFrom(
                      side: BorderSide(color: Color(0xffE8DDCB)),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)
                        )
                      ),
                      child: Text("L", style: AppStyles.style13Bold.copyWith(color: Colors.black),)
                      ),
                  ],
                ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16)
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              if (Counter > 1) {
                                setState(() {
                                  Counter--;
                                });
                              }
                            },
                            icon: Icon(Icons.remove, fontWeight: FontWeight.w800,),
                          ),
                          Text(
                            "$Counter",
                            style: AppStyles.style16SemiBold
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                Counter++;
                              });
                            },
                            icon: Icon(Icons.add, fontWeight: FontWeight.w800,),
                          ),
                        ],
                      ),
                    ),
                  SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryClr
                    ),
                    child: Row(
                      spacing: 8,
                      children: [
                        SizedBox(width: 32,),
                        Icon(Icons.shopping_basket_outlined, color: Colors.white,),
                        Text("Add to Cart", style: AppStyles.style16Bold.copyWith(color: Colors.white)),
                      ],
                    )
                    ),
                    ),
                ],
              ),
              ),
                SizedBox(height: 20),
            // Description
            Container(
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("Description",style: AppStyles.style16Bold ),
                      Spacer(),
                      IconButton(onPressed: () {}, icon: Icon(Icons.arrow_upward))
                    ],
                  ),
                  Text( "A high-precision design meticulously built. Featuring premium full-grain Italian calfskin strap, Japanese quartz movement, sapphire crystal scratch-resistant casing, and functional dual subdials. Water resistant up to 5 ATM.",
                    style: AppStyles.style14w300,
                    maxLines: 5,
                  )
                ],
              ),
            ),
            SizedBox(height: 20), 
            // Reviews
            Row(
              children: [
                Text(
                  "Reviews (124)",
                  style: AppStyles.style16Bold
                ),
                Spacer(),
                Text("View all",
                  style: AppStyles.style13SemiBold.copyWith(color: AppColors.primaryClr)
                ),
              ],
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        child: Text("S"),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Sophia K.",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Oct 24, 2023",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Icon(Icons.star_border_outlined, color: AppColors.primaryClr, size: 20, fontWeight: FontWeight.w700,),
                      Text(" 5.0"),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Stunning craft. The leather strap is extremely supple, and the chronograph movement is reliable. Truly luxury for an everyday routine.",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                    maxLines: 3,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        child: Text("D"),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "David L.",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Oct 18, 2023",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Icon(Icons.star_border_outlined, color: AppColors.primaryClr, size: 20, fontWeight: FontWeight.w700,),
                      Text(" 4.0"),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Minimalist layout with outstanding weight.A true compliment earner. Packaging was elegant and delivery prompt.",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                    maxLines: 3,
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.edit_outlined, color: AppColors.primaryClr,),
                label: Text("Write a Review", style: AppStyles.style13Bold.copyWith(color: AppColors.primaryClr),),
              ),
            ),
            SizedBox(height: 20), 
              ],   
            ), 
          )
          ),
      ),
    );
  }
}