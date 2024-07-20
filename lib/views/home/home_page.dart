import 'package:flutter/material.dart';
import 'package:management_states/library/constant/colors_app.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController countRowController = TextEditingController();
  TextEditingController countColumnController = TextEditingController();
  TextEditingController countMaxSumValueController = TextEditingController();
  TextEditingController secondsController = TextEditingController();
  TextEditingController endRangeController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          elevation: 0.0,
          centerTitle: true,
          title: const Text("إعدادات التحدي",style: TextStyle(
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          )),
        ),
        body: Container(
          margin: const EdgeInsets.only(top: 10,bottom: 30,right: 40,left: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(height: 50),
              SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 80,
                      decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.2)
                      ),
                      child: TextFormField(
                        controller: countRowController,
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText:"10",
                            hintStyle: TextStyle(
                                color: Colors.grey.withOpacity(0.3)
                            )
                        ),
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Text(": عدد الصفوف",style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    )),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 80,
                      decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.2)
                      ),
                      child: TextFormField(
                        controller: countColumnController,
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText:"4",
                            hintStyle: TextStyle(
                                color: Colors.grey.withOpacity(0.3)
                            )
                        ),
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Text(": عدد الأعمدة",style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    )),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 80,
                      decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.2)
                      ),
                      child: TextFormField(
                        controller: countMaxSumValueController,
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText:"9",
                            hintStyle: TextStyle(
                                color: Colors.grey.withOpacity(0.3)
                            )
                        ),
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Text(": المجموع الأعظمي",style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    )),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Container(
                    //   width: 80,
                    //   decoration: BoxDecoration(
                    //       color: Colors.blue.withOpacity(0.2)
                    //   ),
                    //   child: TextFormField(
                    //     controller: startRangeController,
                    //     maxLines: 1,
                    //     textAlign: TextAlign.center,
                    //     keyboardType: TextInputType.number,
                    //     decoration: InputDecoration(
                    //         border: InputBorder.none,
                    //         hintText:"0",
                    //         hintStyle: TextStyle(
                    //             color: Colors.grey.withOpacity(0.3)
                    //         )
                    //     ),
                    //     style: const TextStyle(
                    //       color: Colors.black,
                    //       fontWeight: FontWeight.bold,
                    //     ),
                    //   ),
                    // ),

                    Container(
                      width: 80,
                      decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.2)
                      ),
                      child: TextFormField(
                        controller: endRangeController,
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText:"9",
                            hintStyle: TextStyle(
                                color: Colors.grey.withOpacity(0.3)
                            )
                        ),
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Text(": القيمة العظمى",style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    )),

                  ],
                ),
              ),
              SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 80,
                      decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.2)
                      ),
                      child: TextFormField(
                        controller: secondsController,
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText:"60",
                            hintStyle: TextStyle(
                                color: Colors.grey.withOpacity(0.3)
                            )
                        ),
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Text(": عدد الثواني",style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    )),

                  ],
                ),
              ),
              const Spacer(),
              _buildButtonLogIn(context,widthScreen),

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButtonLogIn(BuildContext context,double width) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.linear,
      width:  width * 0.3,
      height: 40,
      child: MaterialButton(
        onPressed: () async {
          final int column = int.tryParse(countColumnController.text.toString()) ?? 4;
          final int row =  int.tryParse(countRowController.text.toString())??10;
          final int max =   int.tryParse(countMaxSumValueController.text.toString())??9;
          final int seconds =   int.tryParse(secondsController.text.toString())??60;
          // final int startRange =   int.tryParse(startRangeController.text.toString())??0;
          final int endRange =   int.tryParse(endRangeController.text.toString())??9;
        //  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => InitExamPage(level: 1)), (route) => false);
        //   Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => MathPage(
        //     endRange: endRange,
        //     column: column,
        //     max: max,
        //     row: row,
        //     seconds: seconds,
        //
        //   )), (route) => false);
          // context.go(
          //   RoutesNames.mathPage,
          //   extra: {
          //     "seconds": seconds,
          //     "row": row,
          //     "max": max,
          //     "column": column,
          //     "endRange": endRange,
          //   },
          // );
        },
        color: ColorsApp.primaryColor,
        highlightColor: Colors.transparent,
        enableFeedback: false,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child:  Text(
          "بدء",
          style: const TextStyle(
              color: Colors.white, fontSize: 18, fontFamily: "Al-Jazeera"),
        ),
      ),
    );
  }

}
