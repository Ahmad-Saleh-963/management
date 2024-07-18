import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:management_states/config/constant/icons_app.dart';
import 'package:management_states/library/constant/colors_app.dart';
import 'package:management_states/services/notfications/ask_permisen_notfications.dart';
import 'package:management_states/utils/ui/components/icons.dart';
import 'package:management_states/utils/ui/my_drawer.dart';
import 'package:optimize_battery/optimize_battery.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: MyDrawer(
        width: width,
        height: height,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          GestureDetector(onTap: showBottomSheet, child: const MapImage()),
          Positioned(
              top: 290,
              left: 250,
              child: Image.asset(
                ImagesApp.location,
                color: ColorsApp.primaryColor,
              ),
          ),
          Positioned(
            top: 50,
            right: 25,
            child:GestureDetector(
                onTap: (){
                  if(!_scaffoldKey.currentState!.isDrawerOpen){
                    _scaffoldKey.currentState!.openEndDrawer();
                  }
                },
                child:
                SvgPicture.asset(
                  ImagesApp.drawer,
                  color:ColorsApp.primaryColor,
                ),
          )),
        ],
      ),
    );
  }

  Color colorBtnClick = ColorsApp.primaryColor ;
  Color colorBtn = ColorsApp.linearWhite ;
  int indexBtn=-1;
  showBottomSheet() {
    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(15),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (BuildContext context) {
        return Container(
          height: 320,
          width: double.infinity,
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(": تحديد الحالة  ",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildOption("حريق", ImagesApp.fire),
                  _buildOption("إسعاف", ImagesApp.car),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildOption("حادث", ImagesApp.carEvent),
                  _buildOption("قصف", ImagesApp.boom),
                ],
              ),
              const Spacer(),
              _buildButton(),
            ],
          ),
        );
      },
    );
  }

  _buildOption(String text, String pathImage) {
    return Container(
      height: 50,
      width: 120,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: ColorsApp.gry,
          borderRadius: const BorderRadius.all(Radius.circular(15))),
      child: GestureDetector(
        child: Row(
          children: [
            Expanded(
              child: Text(
                text,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              height: 85,
                width:45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  color: ColorsApp.linearWhite,
                ),
                child: Image.asset(pathImage)),
          ],
        ),
      ),
    );
  }

  _buildButton() {
    return Container(
      width: 500,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: ColorsApp.primaryColor,
      ),
      child: const Center(
          child: Text(
        "إرسال",
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      )),
    );
  }

}
