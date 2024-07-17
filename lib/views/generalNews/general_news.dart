import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:management_states/config/constant/icons_app.dart';
import 'package:management_states/library/blocs/general_page/general_news/general_news_bloc.dart';
import 'package:management_states/library/blocs/general_page/general_news/general_news_state.dart';
import 'package:management_states/library/constant/colors_app.dart';
import 'package:management_states/library/data_structure/news/news.dart';
import 'package:management_states/library/data_structure/user/user.dart';
import 'package:management_states/library/utils/shared_preferences_helper.dart';
import 'package:management_states/utils/ui/my_drawer.dart';
import 'package:management_states/views/generalNews/add_news.dart';

class GeneralNewsPage extends StatefulWidget {
  const GeneralNewsPage({super.key});

  @override
  State<GeneralNewsPage> createState() => _GeneralNewsPageState();
}

class _GeneralNewsPageState extends State<GeneralNewsPage> {
  late GeneralNewsBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = GeneralNewsBloc();
    bloc.getNews();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ColorsApp.liteWhite,
      endDrawer: MyDrawer(width: width, height: height),
      appBar: AppBar(
        backgroundColor: ColorsApp.liteWhite,
        title: Text(
          "الأخبار العامة",
          style: TextStyle(
              color: ColorsApp.primaryColor, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<GeneralNewsBloc, GeneralNewsState>(
          bloc: bloc,
          builder: (context, state) {
            if (state.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return ListView.builder(
              itemCount: bloc.news.length,
              itemBuilder: (context, index) => Card(
                // shadowColor: Theme.of(context).primaryColor,
                child: _buildPost(bloc.news[index]),
              ),
            );
          }),
      floatingActionButton:
          SharedPreferencesHelper.getUser()!.roleUser == RoleUser.admin
              ? FloatingActionButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddGeneralNewPage(),
                        ));
                  },
                  child: const Icon(Icons.add),
                )
              : null,
    );
  }

  _buildPost(NewsModel news) {
    return Center(
      child: Container(
        height: 320,
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(bottom: 5),
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
                  news.nameUser,
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
                news.description,
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
}
