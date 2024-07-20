import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:management_states/library/data_structure/init_exam/init_exam_model.dart';
import 'package:management_states/views/home/level.dart';
import 'package:timer_count_down/timer_count_down.dart';

class MathPage extends StatefulWidget {
  const MathPage({super.key, required this.initExam});
  final InitExamModel initExam;
  @override
  _MathPageState createState() => _MathPageState();
}

class _MathPageState extends State<MathPage> {
  late ScrollController _scrollController;
  late double widthScreen;
  late double heightScreen;
  late TextEditingController _activeController;
  List<TextEditingController> listTextEditingController = [];
  List<Widget> listWidgetInputs = [];
  int indexSelectInput = 0;
  bool isLoading = true;

  late double secondItemOffset = 0.0;
  void scrollToSecondItem(bool isIncrease) {
    if (isIncrease) {
      secondItemOffset += widthScreen / 2;
    } else {
      if (secondItemOffset != 0) {
        secondItemOffset -= widthScreen / 2;
      }
    }
    _scrollController.animateTo(
      secondItemOffset,
      duration: const Duration(microseconds: 1),
      curve: Curves.easeInOut,
    );
  }
  List<List> exam = [];
  initData() {
    isLoading = true;
    setState(() {});
    exam = widget.initExam.getExam;
    _scrollController = ScrollController();
    for (int i = 0; i < exam.length; i++) {
      listTextEditingController.add(TextEditingController());
      if (i == 0) _activeController = listTextEditingController[0];
      listWidgetInputs.add(
        Flexible(
          child: SizedBox(
            width: 60,
            child: TextField(
              controller: listTextEditingController[i],
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                fillColor: _activeController == listTextEditingController[i]
                    ? Colors.blue.withOpacity(0.2)
                    : Colors.transparent,
                filled: true,
              ),
              readOnly: true,
              onTap: () {
                indexSelectInput = i;
                _activeController = listTextEditingController[i];
                secondItemOffset = (widthScreen / 2) * i;
                _scrollController.animateTo(
                  secondItemOffset,
                  duration: const Duration(microseconds: 1),
                  curve: Curves.easeInOut,
                );
                reBuild();
              },
            ),
          ),
        ),
      );
    }
    _scrollController = ScrollController();
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    initData();
  }

  _showDialogEndExam() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('إنتهى الوقت'),
          content: const Text('لقد إنتهى وقت الامتحان'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const SelectLevel()),
                        (route) => false);
              },
              child: const Text('البدء من جديد'),
            ),
          ],
        );
      },
    );
  }

  _showDialogResult() {
    int countSuccess = 0;
    for (int i = 0; i < listWidgetInputs.length; i++) {
      int sum = exam[i].reduce((value, element) => value + element);
      if (int.tryParse(listTextEditingController[i].text) == sum) {
        countSuccess++;
      }
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          alignment: Alignment.center,
          title: const Text(
            'إنتهى',
            textAlign: TextAlign.center,
          ),
          content: SizedBox(
            height: 50,
            child: Column(
              children: [
                Text(
                  'عدد الإجابات الصحيحة : $countSuccess',
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.black),
                ),
                Text(
                  'عدد الإجابات الغلط : ${exam.length - countSuccess}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'مراجعة الإجابات',
                style: TextStyle(color: Colors.red),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const SelectLevel()),
                        (route) => false);
              },
              child: const Text(
                'البدء من جديد',
                style: TextStyle(color: Colors.green),
              ),
            ),
          ],
        );
      },
    );
  }

  double myPosition = 0.0;
  @override
  Widget build(BuildContext context) {
    widthScreen = MediaQuery.of(context).size.width;
    heightScreen = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: ()async{
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          centerTitle: true,
          title: Countdown(
            seconds: widget.initExam.timeEnd,
            build: (BuildContext context, double time) => Text(
              time.toInt().toString(),
              style: TextStyle(color: time <= 10 ? Colors.red : Colors.white),
            ),
            interval: const Duration(milliseconds: 100),
            onFinished: () {
              _showDialogEndExam();
            },
          ),
          elevation: 0.0,
        ),
        body: Column(
          children: [
            isLoading
                ? const Center()
                : Expanded(
              flex: 7,
              child: NotificationListener<ScrollNotification>(
                onNotification: (ScrollNotification scrollInfo) {
                  myPosition = scrollInfo.metrics.pixels;
                  print(scrollInfo.metrics.pixels);
                  return true;
                },
                child: ListView(
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal,
                  children: List.generate(exam.length, (index) {
                    return Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildTextIndex("${index + 1}"),
                            Column(
                              children: List.generate(exam[index].length, (indexRow) {
                                return _buildText("${exam[index][indexRow]}");
                              }),
                            ),
                            listWidgetInputs[index],
                            SizedBox(),
                          ],
                        ),
                      ],
                    );
                  }),
                ),
              ),
            ),

            // Row(
            //   children: [
            //     Expanded(child: SizedBox(
            //       height: 400,
            //       child:     Column(
            //         children: [
            //           Text("1"),
            //           SizedBox(height: 5),
            //           Text("3"),
            //           SizedBox(height: 5),
            //           Text("-3"),
            //           SizedBox(height: 5),
            //           Text("+8"),
            //           SizedBox(height:10),
            //           Flexible(
            //             child: TextField(
            //               controller: _textFieldController1,
            //               decoration: InputDecoration(
            //                 labelText: 'Input 1',
            //                 // Change color based on whether it's active or not
            //                 fillColor: _activeController == _textFieldController1 ? Colors.blue : Colors.transparent,
            //                 filled: true,
            //               ),
            //               readOnly: true,
            //               onTap: () {
            //                 setState(() {
            //                   _activeController = _textFieldController1;
            //                 });
            //               },
            //             ),
            //           ),
            //         ],
            //       ),
            //     ), ),
            //     Expanded(child: SizedBox(
            //       height: 400,
            //       child: Column(
            //         children: [
            //           Text("1"),
            //           SizedBox(height: 5),
            //           Text("3"),
            //           SizedBox(height: 5),
            //           Text("-3"),
            //           SizedBox(height: 5),
            //           Text("+8"),
            //           SizedBox(height:10),
            //           Flexible(
            //             child: TextField(
            //               controller: _textFieldController2,
            //               decoration: InputDecoration(
            //                 labelText: 'Input 2',
            //                 // Change color based on whether it's active or not
            //                 fillColor: _activeController == _textFieldController2 ? Colors.blue : Colors.transparent,
            //                 filled: true,
            //               ),
            //               readOnly: true,
            //               onTap: () {
            //                 setState(() {
            //                   _activeController = _textFieldController2;
            //                 });
            //               },
            //             ),
            //           ),
            //         ],
            //       ),
            //     ), ),
            //   ],
            // ),
            // const Spacer(),

            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 50,
                    width: 110,
                    margin: const EdgeInsets.all(2),
                  ),
                  InkResponse(
                    onTap: () {
                      _showDialogResult();
                    },
                    child: Container(
                      height: 50,
                      width: 110,
                      margin: const EdgeInsets.all(2),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.green,
                      ),
                      child: const Center(
                        child: Text(
                          "تم",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              height: 1,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  BackspaceButton(
                    controller: _activeController,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  NumberButton(
                    number: '1',
                    controller: _activeController,
                  ),
                  NumberButton(
                    number: '2',
                    controller: _activeController,
                  ),
                  NumberButton(
                    number: '3',
                    controller: _activeController,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  NumberButton(
                    number: '4',
                    controller: _activeController,
                  ),
                  NumberButton(
                    number: '5',
                    controller: _activeController,
                  ),
                  NumberButton(
                    number: '6',
                    controller: _activeController,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  NumberButton(
                    number: '7',
                    controller: _activeController,
                  ),
                  NumberButton(
                    number: '8',
                    controller: _activeController,
                  ),
                  NumberButton(
                    number: '9',
                    controller: _activeController,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MoveSelectionButton(
                    direction: Direction.left,
                    controller: _activeController,
                    onPressed: () {
                      _moveSelection(Direction.left);
                    },
                  ),
                  NumberButton(
                    number: '0',
                    controller: _activeController,
                  ),
                  MoveSelectionButton(
                    direction: Direction.right,
                    controller: _activeController,
                    onPressed: () {
                      _moveSelection(Direction.right);
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void _moveSelection(Direction direction) {
    if (direction == Direction.right) {
      if (indexSelectInput != exam.length - 1) {
        indexSelectInput++;
        scrollToSecondItem(true);
      }
    } else {
      if (indexSelectInput != 0) {
        indexSelectInput--;
        scrollToSecondItem(false);
      }
    }
    _activeController = listTextEditingController[indexSelectInput];

    reBuild();
    setState(() {});
  }

  reBuild() {
    listWidgetInputs.clear();
    for (int i = 0; i < exam.length; i++) {
      listWidgetInputs.add(Flexible(
          child: SizedBox(
            width:60,
            child: TextField(
              controller: listTextEditingController[i],
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                fillColor: _activeController == listTextEditingController[i]
                    ? Colors.blue.withOpacity(0.2)
                    : Colors.transparent,
                filled: true,
              ),
              readOnly: true,
              onTap: () {
                indexSelectInput = i;
                _activeController = listTextEditingController[i];
                indexSelectInput = i;
                _activeController = listTextEditingController[i];
                secondItemOffset = (widthScreen / 2) * i;
                _scrollController.animateTo(
                  secondItemOffset,
                  duration: const Duration(microseconds: 1),
                  curve: Curves.easeInOut,
                );
                reBuild();
              },
            ),
          )));
    }
    setState(() {});
  }

  _buildText(String msg) {
    return SizedBox(
      width: widthScreen/2,
      child: Text(
        msg,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: exam[0].length > 7 ?  20: 30,
            color: Colors.green.shade800),
      ),
    );
  }

  _buildTextIndex(String msg) {
    return Container(
      width: widthScreen/2,
      decoration: const BoxDecoration(
          color: Colors.grey,
          border: Border(
            bottom:BorderSide(color: Colors.black,width: 2),
          )
      ),
      child: Text(
        msg,
        textAlign: TextAlign.center,
        style:   TextStyle(
            fontSize:  exam[0].length  > 7 ?  22: 32,
            height: 1,color: Colors.black),
      ),
    );
  }
}

class NumberButton extends StatelessWidget {
  final String number;
  final TextEditingController controller;

  const NumberButton({
    required this.number,
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: () {
        controller.text += number;
      },
      child: Container(
          height: 55,
          width: 110,
          margin: const EdgeInsets.all(2),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.green,
          ),
          child: Center(
              child: Text(
                number,
                style: const TextStyle(
                    fontSize: 26, color: Colors.white, height: 1,
                    fontWeight: FontWeight.bold),
              ))),
    );
  }
}

class BackspaceButton extends StatelessWidget {
  final TextEditingController controller;

  const BackspaceButton({
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LongPressButton(
      onPressed: () {
        String text = controller.text;
        if (text.isNotEmpty) {
          controller.text = text.substring(0, text.length - 1);
        }
      },
      onLongPress: () {
        controller.clear();
      },
      child: Container(
        height: 50,
        width: 110,
        margin: const EdgeInsets.all(2),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.red,
        ),
        child: const Icon(Icons.backspace, color: Colors.white),
      ),
    );
  }
}

enum Direction { left, right }

class MoveSelectionButton extends StatelessWidget {
  final Direction direction;
  final TextEditingController controller;
  final VoidCallback onPressed;

  const MoveSelectionButton({
    required this.direction,
    required this.controller,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    IconData icon;
    if (direction == Direction.left) {
      icon = Icons.arrow_back;
    } else {
      icon = Icons.arrow_forward;
    }
    return InkResponse(
      onTap: onPressed,
      child: Container(
        height: 50,
        width: 110,
        margin: const EdgeInsets.all(2),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.green,
        ),
        child: Icon(icon, color: Colors.white, size: 30),
      ),
    );
  }
}

class LongPressButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  final VoidCallback onLongPress;

  const LongPressButton({
    required this.child,
    required this.onPressed,
    required this.onLongPress,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      onLongPress: onLongPress,
      child: child,
    );
  }
}
