import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/Auth/UnderConstruction.dart';
import 'package:grocery_app/components/custom_ion.dart';
import 'package:grocery_app/home/grocery_featured_Item_widget.dart';
import 'package:grocery_app/home/home_banner_widget.dart';
import 'package:grocery_app/models/grocery_item.dart';
import 'package:grocery_app/product_details/product_details_screen.dart';
import 'package:grocery_app/styles/colors.dart';
import 'package:grocery_app/widgets/grocery_item_card_widget.dart';
import 'package:grocery_app/widgets/search_bar_widget.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isOffline = false;

  @override
  void initState() {
    super.initState();
    checkConnectivity();
  }

  Future<void> checkConnectivity() async {
    final isConnected = await InternetConnectionChecker().hasConnection;
    setState(() {
      isOffline = !isConnected;
    });
  }

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    String loggedInEmail = user?.email ?? "No email";

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome",
              style: TextStyle(fontFamily: 'Bold-Poppins'),
            ),
            Text(
              loggedInEmail,
              style: const TextStyle(
                fontSize: 13,
                fontFamily: 'Poppins-Light',
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 12),
            child: CustomIconButton(
              icon: const Icon(Ionicons.notifications_outline),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UnderConstructionPage(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: isOffline
          ? _buildOfflineUI()
          : SafeArea(
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      // SvgPicture.asset("assets/icons/app_icon_color.svg"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Location",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w300),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      padded(locationWidget()),
                      SizedBox(
                        height: 15,
                      ),
                      padded(SearchBarWidget()),
                      SizedBox(
                        height: 25,
                      ),
                      padded(HomeBanner()),
                      SizedBox(
                        height: 25,
                      ),
                      padded(subTitle_("Fruits")),
                      getHorizontalItemSlider(exclusiveOffers),
                      SizedBox(
                        height: 15,
                      ),
                      padded(subTitle_("Vegetables")),
                      getHorizontalItemSlider(bestSelling),
                      SizedBox(
                        height: 15,
                      ),
                      padded(subTitle_("Groceries")),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 105,
                        child: ListView(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.horizontal,
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            GroceryFeaturedCard(
                              groceryFeaturedItems[0],
                              color: Color(0xffF8A44C),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            GroceryFeaturedCard(
                              groceryFeaturedItems[1],
                              color: AppColors.primaryColor,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      getHorizontalItemSlider(groceries),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Widget _buildOfflineUI() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'lib/images/offline.json',
          ),
          const Text(
            'You are offline',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              checkConnectivity();
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: const Color.fromARGB(255, 142, 153, 162),
              minimumSize: const Size(200, 48),
            ),
            child: const Text('Retry'),
          )
        ],
      ),
    );
  }

  Widget getHorizontalItemSlider(List<GroceryItem> items) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 250,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 20),
        itemCount: items.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              onItemClicked(context, items[index]);
            },
            child: GroceryItemCardWidget(
              item: items[index],
              heroSuffix: "home_screen",
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: 20,
          );
        },
      ),
    );
  }

  void onItemClicked(BuildContext context, GroceryItem groceryItem) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ProductDetailsScreen(
                groceryItem,
                heroSuffix: "home_screen",
              )),
    );
  }

  Widget padded(Widget child) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: child,
    );
  }

  Widget subTitle_(String text) {
    return Row(
      children: [
        Text(
          text,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Spacer(),
        Text(
          "See All",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor),
        ),
      ],
    );
  }

  Widget locationWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.location_on_outlined, // You can replace this with any icon
          size: 24.0,
          weight: 0.5, // Set the size of the icon
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          "Vijayawada, AP",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
