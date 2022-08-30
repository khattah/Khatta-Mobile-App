// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:provider/provider.dart';
// import 'package:test_app/app_test/category_list.dart';
// import 'package:test_app/app_test/category_model.dart';
// import 'package:test_app/app_test/sub_category_model.dart';
// import 'package:test_app/components/custom_text_widget.dart';
// import 'package:test_app/components/global_header.dart';
// import 'package:test_app/components/product_popup.dart';
// import 'package:test_app/components/search_popup.dart';
// import 'package:test_app/components/search_product.dart';
// import 'package:test_app/constants.dart';
// import 'package:test_app/constants/size_config.dart';
// import 'package:test_app/helper/app_shared_pref.dart';
// import 'package:test_app/helper/change_notifier/cartProvider.dart';
// import 'package:test_app/helper/change_notifier/productProvider.dart';
// import 'package:test_app/helper/qrCode/qrCode.dart';
// import 'package:test_app/models/catalog/products_response.dart';
// import 'package:test_app/models/generic/CategoryData.dart';
// import 'package:test_app/models/generic/ProductData.dart';
// import 'package:test_app/models/request/cart_request/add_to_cart_request.dart';
// import 'package:test_app/models/request/cart_request/update_cart_request.dart';
// import 'package:test_app/models/request/search/SearchRequest.dart';
// import 'package:test_app/models/sub_category/sub_category_child.dart';
// import 'package:test_app/screens/auth_screens/login_screen.dart';
// import 'package:test_app/screens/cart_screen/cart_screen.dart';
// import 'package:test_app/screens/product_details_screen/product_details_screen.dart';
// import 'package:test_app/screens/product_screen/components/CustomCard.dart';
// import 'package:test_app/screens/product_screen/components/category_list.dart';
// import 'package:test_app/screens/product_screen/components/custom_grid_card.dart';
// import 'package:test_app/screens/product_screen/components/product_header.dart';
// import 'package:test_app/screens/product_screen/components/search_field.dart';
// import 'package:test_app/screens/product_screen/components/sub_category_list.dart';
// import 'package:built_collection/built_collection.dart';
// import 'package:test_app/services/checkout_services/cart_services/cart_services.dart';
// import 'package:test_app/services/search_services.dart';
// import 'package:test_app/services/sub_category_services.dart';
// import 'package:built_collection/built_collection.dart';
//
// class Body extends StatefulWidget {
//   final String isLogin;
//   final bool isGrid;
//   final BuiltList<SubCategoryChild> subCategoryChild;
//   final BuiltList<CategoryData> categories;
//   final int categoryId;
//   final int cartCount;
//
//   const Body(
//       {Key key,
//         this.cartCount,
//         this.isGrid,
//         this.subCategoryChild,
//         this.categories,
//         this.categoryId,
//         this.isLogin})
//       : super(key: key);
//   @override
//   _BodyState createState() => _BodyState();
// }
//
// class _BodyState extends State<Body> {
//   CategoryModel categoryModel;
//   SubCategoryModel subCategoryModel;
//
//   int getCatIdForProduct;
//   bool selected;
//
//   int id;
//
//   String isLogin;
//
//   static int catId;
//   static int selectedId;
//   static int selectedMainId;
//   static int subCatId;
//   var productsList;
//   int cartCount;
//
//   List<bool> boolList = [];
//
//   getLoginStatus() async {
//     isLogin = await AppSharedPref.instance.getCustomerLoginBase64Str();
//   }
//
//   Future<void> wishlistMyListDialog() async {
//     await showDialog(
//       barrierColor: Color(0x9018345C),
//       context: context,
//       builder: (BuildContext context) {
//         return ProductPopUp(
//           goToWishlist: () {},
//           goToMyList: () {},
//         );
//       },
//     );
//   }
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     print("in muller init state");
//     getLoginStatus();
//     super.initState();
//     catId = widget.categoryId;
//     selectedId = -1;
//     getCatIdForProduct = catId;
//     Provider.of<CartProvider>(context, listen: false).getCarts(context);
//
//     Future.delayed(Duration.zero, () async {
//       Provider.of<ProductProvider>(context,listen: false).getSubCategories(263,context);
//     });
//
//     // Provider.of<ProductProvider>(context,listen: false).getSubCategories(173,context);
//     print("state done...");
//     // cartCount = 0;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     print("build!!");
//     print(widget.isGrid);
//     print("muller in build state");
//     final cart_provider = Provider.of<CartProvider>(context);
//     return SafeArea(
//       child: Stack(
//         children: [
//           Positioned(
//             top: -20,
//             left: -30,
//             child: Container(
//               child: Image.asset(
//                 'assets/icons/ribbons.png',
//                 colorBlendMode: BlendMode.hardLight,
//                 color: Colors.white70,
//               ),
//             ),
//           ),
//           Positioned(
//             top: -20,
//             right: -30,
//             child: Container(
//               child: Image.asset(
//                 'assets/icons/ribbons.png',
//                 colorBlendMode: BlendMode.hardLight,
//                 color: Colors.white70,
//               ),
//             ),
//           ),
//           Container(
//             height: SizeConfig.screenHeight,
//             width: SizeConfig.screenWidth,
//             color: Colors.white54,
//           ),
//           Container(
//             child: SingleChildScrollView(
//               child: Column(
//                 // mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(height: getProportionateScreenHeight(10)),
//                   ProductHeader(
//                     cartCount: cart_provider.getCounter() == null
//                         ? 0
//                         : cart_provider.getCounter(),
//                     title: "Products",
//                     goBack: () => Navigator.pop(context),
//                     goTocart: () {
//                       if (widget.cartCount != null || widget.cartCount != 0) {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => CartScreen()));
//                       }
//                     },
//                   ),
//                   SizedBox(height: getProportionateScreenHeight(10)),
//                   SearchField(
//                     goToSearch: () {
//                       searchDialog();
//                     },
//                   ),
//                   SizedBox(height: getProportionateScreenHeight(10)),
//                   Padding(
//                     padding: EdgeInsets.symmetric(
//                         horizontal: getProportionateScreenWidth(20),
//                         vertical: getProportionateScreenWidth(5)),
//                     child: CustomText(
//                       text: "Categories",
//                       fontSize: 22,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Container(
//                     height: getProportionateScreenWidth(70),
//                     child: ListView.builder(
//                       shrinkWrap: true,
//                       scrollDirection: Axis.horizontal,
//                       itemCount: widget.categories.length,
//                       itemBuilder: (context, index) {
//                         return CategoryList(
//                             categories: widget.categories[index],
//                             index: index,
//                             onChangeCatId:
//                             widget.categories[index].children.length != 0
//                                 ? () {
//                               catId =
//                                   widget.categories[index].categoryId;
//                               selectedMainId = index;
//                               subCatId = 0;
//
//                               setState(() {});
//                             }
//                                 : null,
//                             selectedIndex: selectedMainId);
//                       },
//                     ),
//                   ),
//                   SizedBox(
//                     height: getProportionateScreenHeight(20),
//                   ),
//                   //muller25225
//
//                   FutureBuilder(
//                       future: Provider.of<SubCategoryServices>(
//                         context,
//                       ).getSubCategory(catId),
//                       builder: (context, snapshot) {
//                         if (snapshot.connectionState == ConnectionState.done) {
//                           if (snapshot.hasError) {
//                             return Center(
//                               child: Text("${snapshot.error}"),
//                             );
//                           } else {
//                             var subCategories =
//                                 snapshot.data.body.subCategories;
//                             List<int> ids = [];
//                             for (var i = 0; i < subCategories.length; i++) {
//                               ids.add(subCategories[i].id);
//                             }
//                             // print("result of idsssss:${ids}");
//
//                             // print(subCategories);
//                             return Container(
//                               //  height: getProportionateScreenWidth(40),
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: [
//                                   Container(
//                                     height: getProportionateScreenHeight(40),
//                                     child: ListView.builder(
//                                         reverse: true,
//                                         shrinkWrap: true,
//                                         scrollDirection: Axis.horizontal,
//                                         itemCount: subCategories.length + 1,
//                                         itemBuilder: (context, index) {
//                                           if (index == subCategories.length) {
//                                             return SubCategoryList(
//                                               press: () {
//                                                 print("id of sub ${catId}");
//                                                 getCatIdForProduct = catId;
//                                                 selectedId = index;
//                                                 setState(() {});
//                                               },
//                                               catId: catId,
//                                               subCatId: subCatId,
//                                               selectedId: selectedId,
//                                               index: index,
//                                             );
//                                           }
//                                           return subCategories[index] != 0 ||
//                                               subCategories[index] != null
//                                               ? SubCategoryList(
//                                             press: () {
//                                               print(
//                                                   "id of sub ${subCategories[index].id}");
//                                               getCatIdForProduct =
//                                                   subCategories[index].id;
//                                               selectedId = index;
//                                               subCatId =
//                                                   subCategories[index].id;
//                                               setState(() {});
//
//                                             },
//                                             catId: catId,
//                                             subCatId: subCatId,
//                                             subCategoryChild:
//                                             subCategories[index],
//                                             index: index,
//                                             selectedId: selectedId,
//                                           )
//                                               : Center(
//                                             child: Text(
//                                                 "no sub Category found!!"),
//                                           );
//                                         }),
//                                   ),
//                                   SizedBox(
//                                     height: getProportionateScreenHeight(20),
//                                   ),
//                                   getCatIdForProduct != null
//                                       ? FutureBuilder(
//                                     future: Provider.of<SearchServices>(
//                                         context)
//                                         .searchProduct(
//                                       SearchRequest(
//                                             (s) => s
//                                           ..cid = getCatIdForProduct
//                                               .toString()
//                                           ..offset = 0
//                                           ..limit = 20,
//                                       ),
//                                     ),
//                                     builder: (context, snapshot) {
//                                       if (snapshot.connectionState ==
//                                           ConnectionState.done) {
//                                         if (snapshot.hasError) {
//                                           return Center(
//                                             child:
//                                             Text("${snapshot.error}"),
//                                           );
//                                         } else {
//                                           productsList =
//                                               snapshot.data.body.products;
//                                           return Container(
//                                               child: !widget.isGrid
//                                                   ? Container(
//                                                 child: ListView
//                                                     .builder(
//                                                     addAutomaticKeepAlives:
//                                                     true,
//                                                     physics:
//                                                     ScrollPhysics(),
//                                                     shrinkWrap:
//                                                     true,
//                                                     itemCount:
//                                                     productsList
//                                                         .length,
//                                                     scrollDirection:
//                                                     Axis
//                                                         .vertical,
//                                                     itemBuilder:
//                                                         (context,
//                                                         index) {
//                                                       return productsList[index] != 0 ||
//                                                           productsList[index] != null
//                                                           ? CustomCard(
//                                                         goToWishMyList: () {
//                                                           wishlistMyListDialog();
//                                                         },
//                                                         goToDetails: () {
//                                                           goToDetails(context, productsList[index], isLogin != null ? isLogin : widget.isLogin);
//                                                         },
//                                                         count: cart_provider.getCounter(),
//                                                         addToCart: () async {
//                                                           cart_provider.addToCart(context, productsList[index].productId, 1);
//                                                         },
//                                                         incrItem: () async {
//                                                           cart_provider.addToCart(context, productsList[index].productId, 1);
//                                                         },
//                                                         decrItem: () async {
//                                                           cart_provider.addToCart(context, productsList[index].productId, -1);
//                                                         },
//                                                         productResponse: productsList[index],
//                                                       )
//                                                           : Center(
//                                                         child: Text("no sub product found!!"),
//                                                       );
//                                                     }),
//                                               )
//                                                   : Container(
//                                                 child: GridView
//                                                     .builder(
//                                                   addAutomaticKeepAlives:
//                                                   true,
//                                                   padding: EdgeInsets
//                                                       .symmetric(
//                                                       horizontal:
//                                                       10),
//                                                   physics:
//                                                   ScrollPhysics(),
//                                                   scrollDirection:
//                                                   Axis.vertical,
//                                                   shrinkWrap: true,
//                                                   itemCount:
//                                                   productsList
//                                                       .length,
//                                                   gridDelegate:
//                                                   SliverGridDelegateWithFixedCrossAxisCount(
//                                                     crossAxisCount:
//                                                     2,
//                                                     childAspectRatio: SizeConfig
//                                                         .screenWidth /
//                                                         (SizeConfig
//                                                             .screenHeight /
//                                                             1.3),
//                                                   ),
//                                                   itemBuilder: (context,
//                                                       index) =>
//                                                   productsList[index] !=
//                                                       0 ||
//                                                       productsList[index] !=
//                                                           null
//                                                       ? CustomGridViewCard(
//                                                     goToWishMyList:
//                                                         () {
//                                                       wishlistMyListDialog();
//                                                     },
//                                                     goToDetails:
//                                                         () {
//                                                       goToDetails(
//                                                           context,
//                                                           productsList[index],
//                                                           isLogin != null ? isLogin : widget.isLogin);
//                                                     },
//                                                     count:
//                                                     cart_provider.getCounter(),
//                                                     productResponse:
//                                                     productsList[index],
//                                                     addToCart:
//                                                         () async {
//                                                       cart_provider.addToCart(
//                                                           context,
//                                                           productsList[index].productId,
//                                                           1);
//                                                     },
//                                                     incrItem:
//                                                         () async {
//                                                       cart_provider.addToCart(
//                                                           context,
//                                                           productsList[index].productId,
//                                                           1);
//                                                     },
//                                                     decrItem:
//                                                         () async {
//                                                       cart_provider.addToCart(
//                                                           context,
//                                                           productsList[index].productId,
//                                                           -1);
//                                                     },
//                                                   )
//                                                       : Center(
//                                                     child:
//                                                     Text("no sub Category found!!"),
//                                                   ),
//                                                 ),
//                                               ));
//                                         }
//                                       } else {
//                                         return Center(
//                                           child:
//                                           CircularProgressIndicator(),
//                                         );
//                                       }
//                                     },
//                                   )
//                                       : Container(),
//                                 ],
//                               ),
//                             );
//                           }
//                         } else {
//                           return Center(
//                             child: CircularProgressIndicator(),
//                           );
//                         }
//                       }),
//                   SizedBox(
//                     height: getProportionateScreenHeight(40),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   // addToCart(BuildContext context, ProductsResponse subCategoryChild, int type,
//   //     int index) async {
//   //   if (await AppSharedPref.instance.getCustomerLoginBase64Str() == null &&
//   //       widget.isLogin == null) {
//   //     Navigator.push(
//   //         context, MaterialPageRoute(builder: (context) => LoginScreen()));
//   //   }
//
//   //   AddToCartRequest addToCartRequest = AddToCartRequest((a) => a
//   //     ..addQty = type
//   //     ..productId = subCategoryChild.productId.toString());
//   //   final addTocartResponse =
//   //       await Provider.of<CartServices>(context, listen: false)
//   //           .addToCart(addToCartRequest);
//
//   //   if (addTocartResponse.body.success) {
//   //     setState(() {});
//   //     print(addTocartResponse.statusCode);
//   //   }
//   //   // setState(() {});
//   // }
//
//   Future<void> searchDialog() async {
//     await showDialog(
//       barrierColor: Color(0x9018345C),
//       context: context,
//       builder: (BuildContext context) {
//         String barcode;
//         return SearchPopUp(
//           goToSearchText: () {
//             showSearch(
//               context: context,
//               delegate: SearchProduct(
//                   isLogin: widget.isLogin == null ? isLogin : widget.isLogin,
//                   barcode: null),
//             ).whenComplete(() {
//               Navigator.pop(context);
//             });
//           },
//           goToSearchProduct: () {},
//           goToSearchBarcode: () => delegate(),
//         );
//       },
//     );
//   }
//
//   Future<void> delegate() async {
//     String barcode = await scanQR(context, "");
//     showSearch(
//       context: context,
//       delegate: SearchProduct(
//           isLogin: widget.isLogin == null ? isLogin : widget.isLogin,
//           barcode: barcode),
//     ).whenComplete(() {
//       Navigator.pop(context);
//     });
//   }
//   // updateCart(
//   //   BuildContext context,
//   //   ProductsResponse subCategoryChild,
//   //   int type,
//   // ) async {
//   //   if (await AppSharedPref.instance.getCustomerLoginBase64Str() == null &&
//   //       widget.isLogin == null) {
//   //     Navigator.push(
//   //         context, MaterialPageRoute(builder: (context) => LoginScreen()));
//   //   }
//
//   //   //  AddToCartRequest addToCartRequest = AddToCartRequest((a) => a
//   //   //   ..addQty = type == 1 ? 1 : -1
//   //   //   ..productId = subCategoryChild.productId.toString());
//   //   UpdateCartRequest updateCartRequest =
//   //       UpdateCartRequest((u) => u..setQty = subCategoryChild.cartQty + type);
//   //   final updateCard =
//   //       await Provider.of<CartServices>(context, listen: false).updateCart(
//   //     subCategoryChild.lineId.toString(),
//   //     updateCartRequest,
//   //   );
//
//   //   if (updateCard.body.success) {
//   //     print(updateCard.statusCode);
//   //   }
//   //   setState(() {});
//   // }
//
//   void goToDetails(
//       BuildContext context, ProductsResponse product, String islogin) {
//     Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (context) => ProductDetailsScreen(
//                 productResponse: product, isLogin: islogin)));
//   }
// }
