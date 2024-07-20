


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:management_states/library/blocs/init_exam/init_exam_bloc.dart';
import 'package:management_states/library/blocs/init_exam/init_exam_state.dart';
import 'package:management_states/library/constant/colors_app.dart';
import 'package:management_states/views/math/math_page.dart';

class InitExamPage extends StatefulWidget {
  const InitExamPage({super.key,required this.level});
  final int level;

  @override
  State<InitExamPage> createState() => _InitExamPageState();
}

class _InitExamPageState extends State<InitExamPage> {

  late InitExamBloc cubit;

  @override
  void initState() {
    super.initState();
    cubit = InitExamBloc();
    cubit.getTheExam(widget.level);
    cubit.initRealTime(widget.level);
  }

  @override
  void dispose() {
    cubit.subscription!.cancel();
    cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: BlocBuilder<InitExamBloc, InitExamState>(
          bloc: cubit,
          builder: (context, state) {
            if(state.loading) {
              return const Center(child: CircularProgressIndicator());
            }else if(state.hasError){
              return Center(
                child: TextButton(
                  onPressed: (){
                    cubit.getTheExam(widget.level);
                  },
                  child: const Text("إنقر لإعادة التحميل"),
                ),
              );
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Center(child: Text("ok")),
                const SizedBox(height: 20),
                if(cubit.initExam!.isStart)
                _buildButtonLogIn(context,width)

              ],
            );
          }
          ),
    );
  }



  Widget _buildButtonLogIn(BuildContext context , width) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.linear,
      width:  width * 0.3,
      height: 40,
      child: MaterialButton(
        onPressed: () {
          Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context) => MathPage(initExam: cubit.initExam!)), (route) => false);
        },
        color: ColorsApp.primaryColor,
        highlightColor: Colors.transparent,
        enableFeedback: false,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: const Text(
          "بدأ الامتحان",
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontFamily: "Al-Jazeera"),
        ),
      ),
    );
  }

}
