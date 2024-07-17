import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:management_states/config/constant/icons_app.dart';
import 'package:management_states/library/blocs/general_page/add_news/add_news_bloc.dart';
import 'package:management_states/library/blocs/general_page/add_news/add_news_state.dart';
import 'package:management_states/library/constant/colors_app.dart';

class AddGeneralNewPage extends StatefulWidget {
  const AddGeneralNewPage({super.key});

  @override
  State<AddGeneralNewPage> createState() => _AddGeneralNewPageState();
}

class _AddGeneralNewPageState extends State<AddGeneralNewPage> {
  late AddNewsBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = AddNewsBloc();
  }

  @override
  void dispose() {
    bloc.close();
    bloc.title.clear();
    bloc.description.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              BlocBuilder<AddNewsBloc, AddNewsState>(
                  bloc: bloc,
                  builder: (context, state) {
                    return _buildPost();
                  }),
              const SizedBox(height: 10),
              _buildTextField(
                bloc.description,
                hintText: 'اكتب منشورك',
              ),
            ],
          ),
        ));
  }

  Widget _buildPost() {
    return Center(
      child: Container(
        height: 320,
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "منذ يومين",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w700),
                ),
                const Expanded(child: Center()),
                Text(
                  bloc.news.nameUser,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      height: 1,
                      color: ColorsApp.primaryColor,
                      fontWeight: FontWeight.w900,
                      fontSize: 20),
                ),
                const SizedBox(width: 10),
                Image.asset(
                  ImagesApp.personImage,
                  width: 50,
                  height: 50,
                ),
              ],
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Text(
                '${bloc.description.text}',
                style: const TextStyle(
                  fontSize: 17,
                ),
                textAlign: TextAlign.end,
              ),
            ),
            const Spacer(),
            Image.asset(
              ImagesApp.postImage,
              width: 300,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, {String? hintText}) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: TextFormField(
        keyboardType: TextInputType.text,
        textAlign: TextAlign.left,
        controller: controller,
        maxLines: 5,
        decoration: InputDecoration(
          fillColor: ColorsApp.primaryColor,
          hintText: hintText,
          alignLabelWithHint: true,
          hintStyle: TextStyle(color: ColorsApp.gry.withOpacity(0.8)),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: ColorsApp.primaryColor, width: 1.5),
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorsApp.primaryColor, width: 1.5),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorsApp.primaryColor, width: 1.5),
            borderRadius: BorderRadius.circular(10.0),
          ),
          prefixIconColor: ColorsApp.gry.withOpacity(0.2),
        ),
        onChanged: (String text) {
          bloc.onChangeDescription();
        },
      ),
    );
  }
}
