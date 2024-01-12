import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class AddSubScriptionView extends StatefulWidget {
  const AddSubScriptionView({super.key});

  @override
  State<AddSubScriptionView> createState() => _AddSubScriptionViewState();
}

class _AddSubScriptionViewState extends State<AddSubScriptionView> {
  TextEditingController txtDescription = TextEditingController();

  List subArr = [
    {"name": "Google Drive", "icon": "assets/images/google-drive.png"},
    {"name": "Spotify", "icon": "assets/images/spotify.png"},
    {"name": "YouTube Premium", "icon": "assets/images/youtube.png"},
    {"name": "NetFlix", "icon": "assets/images/netflix.png"},
  ];

  double amountVal = 0.09;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade50,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 3, 101, 198).withOpacity(0.5),
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25))),
              height: 401,
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                        "Add new subscription",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color.fromARGB(255, 238, 240, 241),
                            fontSize: 40,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(
                      width: media.width,
                      height: media.width * 0.6,
                      child: CarouselSlider.builder(
                        options: CarouselOptions(
                          autoPlay: false,
                          aspectRatio: 1,
                          enlargeCenterPage: true,
                          enableInfiniteScroll: true,
                          viewportFraction: 0.65,
                          enlargeFactor: 0.4,
                          enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                        ),
                        itemCount: subArr.length,
                        itemBuilder: (BuildContext context, int itemIndex,
                            int pageViewIndex) {
                          var sObj = subArr[itemIndex] as Map? ?? {};

                          return Container(
                            margin: const EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  sObj["icon"],
                                  width: media.width * 0.4,
                                  height: media.width * 0.4,
                                  fit: BoxFit.fitHeight,
                                ),
                                const Spacer(),
                                Text(
                                  sObj["name"],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Description',
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),

                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue.shade800,

                      ),
                    ),

                  ),
                  keyboardType: TextInputType.text,
                  textAlign: TextAlign.left,
                  controller: txtDescription,
                  obscureText: false,
                )

              // child : Text("Description" , textAlign: TextAlign.center, style: TextStyle(fontSize: 12 , color: Color.fromARGB(255, 7, 1, 65)),),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.minimize,size: 35,color: Colors.black,),

                    onPressed: () {
                      amountVal -= 10;

                      if (amountVal < 0) {
                        amountVal = 0;
                      }

                      setState(() {});
                    },
                  ),
                  Column(
                    children: [
                      Text(
                        "Monthly price",
                        style: TextStyle(
                            color: Color.fromARGB(255, 2, 49, 72),
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        "\₹${amountVal.toStringAsFixed(2)}",
                        style: TextStyle(
                            color: Color.fromARGB(255, 1, 22, 32),
                            fontSize: 40,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        width: 150,
                        height: 1,
                        color: Colors.blue.shade800.withOpacity(0.3),
                      )
                    ],
                  ),
                  IconButton(
                    icon: Icon(Icons.add,size: 35,color: Colors.black),
                    onPressed: () {
                      amountVal += 50;

                      setState(() {});
                    },
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child:
              ElevatedButton(
                onPressed: (){
                },
                child: Text("Add this Platform",style: TextStyle(
                    color: Colors.white,
                    fontSize: 16
                ),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade500,
                ),
              ),
              //   PrimaryButton(title: "Add this platform",fontWeight: FontWeight.w800,
              //       onPressed: () {}),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}