import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:image_convert/app/modules/sprint/presentation/view/state/controllers/itens_sprint_controller.dart';
import 'package:image_convert/app/modules/sprint/presentation/view/widgets/body_sprint_widget.dart';
import 'package:image_convert/app/modules/sprint/presentation/view/widgets/sprint_card_widget.dart';
import 'package:image_convert/app/shared/widgets/style/app_colors.dart';
import 'package:mobx/mobx.dart';

class SprintPage extends StatefulWidget {
  final ItensSprintController controller;
  const SprintPage({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<SprintPage> createState() => _SprintPageState();
}

class _SprintPageState extends State<SprintPage> {
  List<String>? tasks;
  String result = "";

  final CarouselSliderController _carouselController =
      CarouselSliderController();

  final DatabaseReference databaseRef =
      FirebaseDatabase.instance.ref().child('tasks');

  @override
  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((_) {
      widget.controller.loadTask();
    });
  }

  final Future<FirebaseApp> _fApp = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    final taskController = TextEditingController();
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(
            Icons.add,
            size: 50,
            color: Colors.blue,
            shadows: [
              Shadow(
                offset: Offset(2, 2),
                blurRadius: 4,
                color: Colors.white,
              ),
            ],
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Expanded(
                    child: SizedBox(
                      height: 200,
                      width: 200,
                      child: Column(
                        children: [
                          const Text(
                            'Adicionar tarefa',
                            style: TextStyle(fontSize: 16),
                          ),
                          TextField(
                            controller: taskController,
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              widget.controller
                                  .toDoItem(taskController.text, null);

                              Navigator.pop(context);
                            },
                            child: const Text('Salvar'),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: AppColors.kPrimaryColor,
          title: const Center(
            child: Text(
              'Sprint',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        drawer: const Drawer(),
        body: Observer(
          builder: (context) {
            final future = widget.controller.loadTaskFuture;

            if (future == null || future.status == FutureStatus.pending) {
              return const Center(child: CircularProgressIndicator());
            } else if (future.status == FutureStatus.rejected) {
              return const Center(child: Text("Erro ao carregar tarefas."));
            }
            final tasks = widget.controller.resultInitial;

            if (tasks != null || tasks!.isNotEmpty) {
              return BodySprintWidget(
                controller: widget.controller,
                screenWidth: screenWidth,
                carouselController: _carouselController,
              );
            } else {
              return Container();
            }
          },
        ));
  }
}

Widget cardWidget(bool elevation, String? task, VoidCallback onTapDelete) {
  return Positioned(
    child: SizedBox(
      width: 150,
      child: Container(
        decoration:
            BoxDecoration(color: AppColors.kPrimaryLiggtColor, boxShadow: [
          if (elevation)
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
        ]),
        child: task != null
            ? Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              task,
                              style: const TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w600),
                            ),
                          ),
                          IconButton(
                            onPressed: onTapDelete,
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
              )
            : const SizedBox(
                height: 50,
              ),
      ),
    ),
  );
}
