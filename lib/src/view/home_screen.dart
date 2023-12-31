import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/src/model/task_todo_data_model.dart';
import 'package:todo_app/src/utils/app_color.dart';
import 'package:todo_app/src/utils/custom_appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isTaskFinish = false;
  Color taskCircleColor = Colors.white;
  Color borderCircleColor = AppColors.buttonColor;
  IconData iconData = Icons.done_rounded;

  List<TaskTodoDataModel> taskTodoDataModel = [];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              decoration: const BoxDecoration(color: AppColors.secondaryColor),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: width * 0.22,
                    height: height * 0.12,
                    decoration: const BoxDecoration(
                      color: AppColors.scaffoldColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Flexible(
                    child: Text(
                      "Drawer Header",
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppColors.scaffoldColor),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              )),
          ListTile(
              leading: const Icon(
                Icons.add_box_outlined,
                color: AppColors.primaryColor,
              ),
              title: Text(
                "Add New Task",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              onTap: () {
                context.goNamed('add_task_screen');
              }),
          ListTile(
            leading: const Icon(
              Icons.star_border_rounded,
              color: AppColors.primaryColor,
            ),
            title: Text(
              "Favorite Tasks",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            onTap: () {},
          ),
          ListTile(
              leading: const Icon(Icons.lock_outline_rounded, color: AppColors.primaryColor),
              title: Text(
                "Set a password",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              onTap: () {
                context.goNamed('set_a_password_screen');
              }),
          ListTile(
              leading: const Icon(Icons.settings_outlined, color: AppColors.primaryColor),
              title: Text(
                "Settings",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              onTap: () {
                context.goNamed('settings_screen');
              }),
        ],
      )),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            CustomAppBar(
                iconData: Icons.menu,
                appbarTitle: "Home Screen",
                horizontal: width * 0.144,
                onPressed: () {
                  _scaffoldKey.currentState!.openDrawer();
                }),
            SizedBox(
              height: height * 0.025,
            ),
            //TODO: Chnage the name of the user
            Text(
              "What's up , Ahmad",
              style: Theme.of(context).textTheme.labelMedium,
            ),
            SizedBox(
              height: height * 0.025,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "My Tasks",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                Text(
                  "4/4",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
            SizedBox(
              height: height * 0.015,
            ),

            taskTodoDataModel.isNotEmpty
                ? SizedBox(
                    width: width * 1,
                    height: height * 0.75,
                    child: Center(
                        child: Image.asset(
                      'assets/4019684_2108004.jpg',
                    )),
                  )
                : ListView.builder(
                    itemCount: 5,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          context.goNamed('task_detail_screen');
                        },
                        child: Container(
                          width: width * 1,
                          height: height * 0.07,
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(color: AppColors.todoTileColor, borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isTaskFinish = !isTaskFinish;
                                  });
                                },
                                child: Container(
                                  height: height * 0.065,
                                  width: width * 0.065,
                                  margin: const EdgeInsets.symmetric(horizontal: 15),
                                  decoration: BoxDecoration(
                                      color: isTaskFinish ? AppColors.containerForImage : taskCircleColor,
                                      border: Border.all(color: isTaskFinish ? AppColors.containerForImage : borderCircleColor, width: 2.5),
                                      shape: BoxShape.circle),
                                  child: isTaskFinish
                                      ? Icon(
                                          iconData,
                                          color: Colors.white,
                                          size: 20,
                                        )
                                      : null,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "My Task My Tasksdakjlashdkjsah fkjasdfkjasdkhkjh",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(decoration: isTaskFinish ? TextDecoration.lineThrough : TextDecoration.none),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.goNamed('add_task_screen');
        },
        backgroundColor: AppColors.buttonColor,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    ));
  }
}
