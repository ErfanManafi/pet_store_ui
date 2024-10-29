import 'package:flutter/material.dart';
import 'package:pet_store/colors.dart';
import 'package:pet_store/components/dress_items.dart';
import '../../components/action_btn.dart';
import '../../components/body_card.dart';
import '../../components/puppy_product_item.dart';
import '../../models/dress_model.dart';
import '../../models/product_model.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _dressItemIndexSelected = 0;
  int _badgeValue = 0;
  bool _liked = false;
  bool fadeInAnimate = true;

  @override
  Widget build(BuildContext context) {
    //developer.log("BUILD METHOD CALL");
    var size = MediaQuery.of(context).size;
    var bodyMargin = size.width * 0.05;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: GradientColors.bgHomeGradient)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: buildAppBar(bodyMargin),
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: bodyMargin),
                        child: Text(
                          'PET STORE',
                          style: GoogleFonts.bebasNeue(
                              fontSize: 40, color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: bodyMargin),
                        child: Text(
                          'Shop Anything!',
                          style: GoogleFonts.poppins(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        height: size.height * 0.06,
                        child: ListView.builder(
                          itemBuilder: (context, index) => Padding(
                            padding: EdgeInsets.fromLTRB(
                                index == 0 ? bodyMargin : 16,
                                0,
                                index == dressList.length - 1 ? bodyMargin : 0,
                                0),
                            child: ShopItems(
                              selected: _dressItemIndexSelected == index
                                  ? true
                                  : false,
                              onPressed: () async {
                                setState(() {
                                  _dressItemIndexSelected = index;
                                  fadeInAnimate = false;
                                });
                                await Future.delayed(
                                    const Duration(milliseconds: 300));
                                setState(() {
                                  fadeInAnimate = true;
                                });
                              },
                              name: dressList[index].name,
                            ),
                          ),
                          itemCount: dressList.length,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: bodyMargin),
                        child: BodyCard(
                          height: size.height / 2.1,
                          liked: _liked,
                          fadein: fadeInAnimate,
                          btnLikedPressed: () {
                            setState(() {
                              _liked = !_liked;
                            });
                          },
                          btnBagPressed: () {
                            setState(() {
                              _badgeValue++;
                            });
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: bodyMargin),
                        child: Text(
                          'Explore some more products',
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        height: size.height / 7,
                        child: ListView.builder(
                          itemBuilder: (context, index) => Padding(
                            padding: EdgeInsets.fromLTRB(
                              index == 0 ? bodyMargin : 16,
                              0,
                              index == productList.length - 1 ? bodyMargin : 0,
                              0,
                            ),
                            child: PuppyProductCard(
                              img: productList[index].img,
                              title: productList[index].title,
                              price: productList[index].price,
                              height: size.height / 7,
                            ),
                          ),
                          itemCount: productList.length,
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAppBar(double bodyMargin) {
    return SizedBox(
      height: 54,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: bodyMargin,
          ),
          ActionButton(
            img: 'assets/icons/setting.svg',
            color: Colors.black,
            onTap: () {},
          ),
          const Spacer(),
          ActionButton(
            img: 'assets/icons/search.svg',
            color: Colors.black,
            onTap: () {},
          ),
          SizedBox(
            width: bodyMargin,
          ),
          ActionButton(
            img: 'assets/icons/bag.svg',
            color: Colors.black,
            onTap: () {},
            hasBadge: true,
            badgeValue: _badgeValue,
          ),
          SizedBox(
            width: bodyMargin,
          ),
        ],
      ),
    );
  }
}
