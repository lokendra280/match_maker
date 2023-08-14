import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../core/presentation/resources/size_constants.dart';
import '../../core/presentation/resources/ui_assets.dart';
import '../../core/presentation/widget/image_slider/image_slider.dart';
import '../core/presentation/widget/dialogs.dart';
import '../core/presentation/widget/forms/buttons.dart';
import '../models/user_profile.dart';
import 'auth/apis.dart';
import 'auth/auth_provider.dart';
import 'auth/payment.dart';

// ignore: must_be_immutable
class MainHomeScreen extends StatefulWidget {
  MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  UserModel? user;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    return SizedBox(
      height: 800,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                Image.asset('assets/homep.png'),

                Positioned(
                  child: AppBar(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    centerTitle: true,
                    leading: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        UIAssets.getSvg('ham.svg'),
                        color: Colors.white,
                      ),
                    ),
                    actions: [
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          UIAssets.getSvg('notification.svg'),
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 90,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: SC.mW),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hey ${ap.userModel.name}',
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(color: Colors.white),
                        ),
                        Text(
                          'Match youself with your own preferences',
                          style: Theme.of(context).textTheme.caption!.copyWith(
                              color: Color.fromRGBO(155, 155, 155, 1)),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 1.09,
                          child: Container(
                            width: 325,
                            margin: const EdgeInsets.symmetric(
                                horizontal: SC.lW, vertical: SC.xLH),
                            padding: const EdgeInsets.only(left: SC.lW),
                            height: 64,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(16),
                                bottomRight: Radius.circular(16),
                                topLeft: Radius.circular(16),
                                topRight: Radius.circular(16),
                              ),
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  UIAssets.getSvg('search.svg'),
                                  color: Colors.black,
                                  width: 15,
                                ),
                                Text(
                                  "search for a perfect match",
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption
                                      ?.copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: SC.mW, vertical: SC.mH),
              decoration: BoxDecoration(
                border: Border.all(width: 0.1),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SBC.xxLH,
                  SizedBox(
                    width: 500,
                    height: 150,
                    child: assetslider(
                      dotPosition: DotPosition.bottomCenter,
                      dotVerticalPadding: -15,
                      dotSize: 5,
                      assets: [
                        Image.asset(
                          UIAssets.getDummyImage("1.jpg"),
                          width: double.infinity,
                          height: 0.5 * MediaQuery.of(context).size.height,
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          UIAssets.getDummyImage("banners2.jpg"),
                          width: double.infinity,
                          height: 0.5 * MediaQuery.of(context).size.height,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                  SBC.xLH,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'New Matching',
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                            color: Color.fromRGBO(25, 34, 70, 1),
                            fontStyle: FontStyle.italic),
                      ),
                      PrimaryTextButton(
                          title: 'See all',
                          color: const Color.fromRGBO(114, 114, 114, 1),
                          onPressed: () {
                            // context.router.navigate(const ListingRoute());
                          }),
                    ],
                  ),
                  SBC.xxLH,
                  SingleChildScrollView(
                      // scrollDirection: Axis.horizontal,
                      // physics: BouncingScrollPhysics(
                      //     parent: AlwaysScrollableScrollPhysics()),
                      child: StreamBuilder(
                          stream: API.getspecuser(),
                          builder: (context, snapshot) {
                            switch (snapshot.connectionState) {
                              case ConnectionState.waiting:
                              case ConnectionState.none:
                                return const Center(
                                    child: CircularProgressIndicator());
                              case ConnectionState.active:
                              case ConnectionState.done:
                                final list = [];

                                final data = snapshot.data?.docs;
                                for (var i in data!) {
                                  print('Data: ${i.data()}');
                                  list.add(i.data()['name']);
                                  // list.add(i.data()['profilePic']);
                                }
                                // log('Data: $ ');

                                return ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: list.length,
                                    // padding: EdgeInsets.only(
                                    //     top: .01 *
                                    //         MediaQuery.of(context).size.height),
                                    physics: const BouncingScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {},
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius: BorderRadius.circular(8)
                                          ),
                                          child: Card(

                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: InkWell(
                                              onTap: () {
                                                //Navigator.push(context, MaterialPageRoute(builder: (_) => Chat(user: widget.user) ));
                                              },
                                              child: InkWell(
                                                onTap: () {
                                                  showAnimatedDialog(
                                                      context: context,
                                                      widget:
                                                          LogOutDialog(() {}));
                                                },
                                                child: ListTile(
                                                  leading: CachedNetworkImage(
                                                    width: .055 *
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height: .055 *
                                                        MediaQuery.of(context)
                                                            .size
                                                            .height,
                                                    imageUrl: '',
                                                    errorWidget: (context, url,
                                                            error) =>
                                                        const Icon(CupertinoIcons
                                                            .person),
                                                  ),
                                                  title: Text('${list[index]},'),
                                                  subtitle: const Text(
                                                    "Last User message",
                                                    maxLines: 1,
                                                  ),
                                                  trailing: const Text(
                                                    "12:00 PM",
                                                    style: TextStyle(
                                                        color: Colors.black54),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    });
                            }
                          })),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
