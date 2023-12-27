import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:task_3/pages/login.pages.dart';
import 'package:task_3/services/preferences.services.dart';

class HomePageScreen extends StatefulWidget {


  HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {

  var sliderIndex = 0;
  CarouselController carouselControllerEx = CarouselController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.white,
        leading: Icon(Icons.menu),
        actions: [Icon(Icons.notifications),
          PopupMenuButton<int>(onSelected: (item) => onSelected(context, item),
              itemBuilder: (context) => [
            PopupMenuItem<int>(value: 0,
                child: Text("Logout"))
          ])
        ],

      ),
      body: Stack(
        children: [
          Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(children: [
            Text("Bonjour, Maha", style: TextStyle(fontSize: 20)),
            SizedBox(height: 10,),
            Expanded(child: Text("What would you like to cook today?", style: TextStyle(fontSize: 30),)),
            SizedBox(height: 10,),
            CarouselSlider(
              carouselController: carouselControllerEx,
              options: CarouselOptions(
                  height: 200.0, autoPlay: true,
                  onPageChanged: (index,_){
                    sliderIndex = index;
                    setState(() {
                    });
                  }),
              items: [1,2,3,4,5].map((i) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                            color: Colors.amber
                        ),
                        child: Text('text $i', style: TextStyle(fontSize: 16.0),)
                    );

              }).toList(),
            ),

            DotsIndicator(
              dotsCount: 5,
              position: sliderIndex,
              decorator: DotsDecorator(
                color: Colors.black87, // Inactive color
                activeColor: Colors.redAccent,
              ),
              onTap: (position)async {
                await carouselControllerEx.animateToPage(position);
                sliderIndex = position;
                setState(() {
                });
              },
            ),
          ]),
            // RaisedButton(
            //   onPressed: () => buttonCarouselController.nextPage(
            //       duration: Duration(milliseconds: 300), curve: Curves.linear),
            //   child: Text('→'),
            // ),
        ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 180, 8, 180),
            child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: (){
                  carouselControllerEx.previousPage(
                    duration: Duration(microseconds: 300),
                    curve: Curves.linear,
                  );

                }, icon: Icon(Icons.arrow_back, size: 30,)),
                IconButton(onPressed: (){
                  carouselControllerEx.nextPage(
                    duration: Duration(microseconds: 300),
                    curve: Curves.linear,
                  );
                }, icon: Icon(Icons.arrow_forward, size: 30)),
              ],
            ),
          )
      ]),

    );
  }

  onSelected(BuildContext context, int item) {
    switch (item){
      case 0:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => LoginPage()));
        PrefrencesService.prefs?.remove("user");
        PrefrencesService.prefs?.remove("password");
        break;
    }
  }

}
