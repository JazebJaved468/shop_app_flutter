// import 'package:flutter/material.dart';
// import 'package:shopping_app/constants/global_constants.dart';
// import 'package:shopping_app/data/data.dart';
// import 'package:shopping_app/screens/homeScreen/constants/home_constants.dart';
// import 'package:shopping_app/widgets/add_to_cart_custom_button.dart';

// import '../../../functions.dart';

// class CustomRcommendedProducts extends StatelessWidget {
//   const CustomRcommendedProducts({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 229,
//       // color: Colors.red,
//       child: ListView.separated(
//         itemCount: 3,
//         shrinkWrap: true,
//         scrollDirection: Axis.horizontal,
//         itemBuilder: (BuildContext context, int index) {
//           return ClipRRect(
//             borderRadius: BorderRadius.circular(14),
//             child: Container(
//               width: 150,
//               color: GlobalColors.productCardBackground,
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   // image container
//                   Container(
//                     padding: const EdgeInsets.symmetric(vertical: 24),
//                     // color: Colors.yellowAccent,
//                     child: Center(
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(10),
//                         child: Image(
//                           image: AssetImage(
//                             RecommendedData.data[index]['imgPath'],
//                           ),
//                           width: 80,
//                           height: 80,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                   ),

//                   //line
//                   Container(
//                     margin: EdgeInsets.only(
//                       left: 20,
//                       right: 20,
//                     ),
//                     width: 100,
//                     height: 2,
//                     color: Color(0xffE0E2EE),
//                   ),

//                   Container(
//                     // color: Colors.redAccent,
//                     padding: EdgeInsets.only(
//                         left: 16, right: 16, bottom: 14, top: 8),
//                     child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           //title
//                           Text(
//                             "${RecommendedData.data[index]['name']}",
//                             style: TextStyle(
//                                 color: GlobalColors.primaryTitle,
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w700,
//                                 overflow: TextOverflow.ellipsis),
//                           ),

//                           //type
//                           Text(
//                             "Fast Food",
//                             style: TextStyle(
//                               color: GlobalColors.primaryTitle,
//                               fontSize: 12,
//                               fontWeight: FontWeight.w300,
//                             ),
//                           ),
//                           SizedBox(
//                             height: 14,
//                           ),
//                           ClipRRect(
//                             borderRadius: BorderRadius.circular(20),
//                             child: Container(
//                               color: Colors.white,
//                               child: Row(
//                                 children: [
//                                   Container(
//                                     // color: Colors.pink,
//                                     margin: EdgeInsets.only(
//                                         left: 12, top: 3, bottom: 3, right: 20),
//                                     child: Row(
//                                       children: [
//                                         Text(
//                                           "Unit ",
//                                           style: TextStyle(
//                                               color: GlobalColors.primaryTitle,
//                                               fontSize: 11,
//                                               fontWeight: FontWeight.w300),
//                                         ),
//                                         Text(
//                                           "\$${RecommendedData.data[index]['price']}",
//                                           style: TextStyle(
//                                               color: GlobalColors.primaryTitle,
//                                               fontSize: 14,
//                                               fontWeight: FontWeight.w500),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   AddToCartIcon(
//                                     onPressed: () {
//                                       Selection.productIndex = index;
//                                       // setState(() {});
//                                       addToCart(
//                                           shopIndex: Selection.shopIndex,
//                                           filterIndex: Selection.filterIndex,
//                                           productIndex: Selection.productIndex);
//                                       // showing Message
//                                       ScaffoldMessenger.of(context)
//                                           .showSnackBar(
//                                         const SnackBar(
//                                           content:
//                                               Text('Item added to cart...'),
//                                           duration: Duration(
//                                               seconds:
//                                                   1), // How long the SnackBar will be displayed
//                                         ),
//                                       );
//                                     },
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           )
//                         ]),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//         separatorBuilder: (context, index) {
//           return const SizedBox(
//             width: 18,
//           );
//         },
//       ),
//     );
//   }
// }
