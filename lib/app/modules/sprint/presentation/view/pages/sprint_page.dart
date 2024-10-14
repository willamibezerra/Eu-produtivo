import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'package:image_convert/app/modules/sprint/presentation/view/state/controllers/itens_sprint_controller.dart';
import 'package:image_convert/app/modules/sprint/presentation/view/widgets/sprint_card_widget.dart';
import 'package:image_convert/app/shared/widgets/style/app_colors.dart';

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
  bool startDrag = false;
  List<String>? tasks;
  String result = "";

  final CarouselSliderController _carouselController =
      CarouselSliderController();

  final DatabaseReference databaseRef =
      FirebaseDatabase.instance.ref().child('tasks');

  @override
  void initState() {
    widget.controller.loadTask();
    super.initState();
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
                              child: const Text('Salvar'))
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
        body: FutureBuilder(
          future: _fApp,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text('erro');
            } else if (snapshot.hasData) {
              return bodyContent(context, screenWidth);
            } else {
              return const CircularProgressIndicator();
            }
          },
        ));
  }

  Stack bodyContent(BuildContext context, double screenWidth) {
    DatabaseReference _sprintDataBase =
        FirebaseDatabase.instance.ref().child('tasks');
    _sprintDataBase.onValue.listen(
      (event) {
        result = event.snapshot.value.toString();
      },
    );
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: CarouselSlider(
                      carouselController: _carouselController,
                      options: CarouselOptions(
                        autoPlayAnimationDuration:
                            const Duration(microseconds: 100),
                        height: MediaQuery.of(context).size.height * 0.8,
                        enableInfiniteScroll: false,
                      ),
                      items: [
                        Builder(
                          builder: (BuildContext context) {
                            return SprintCardWidget(
                                onTapDelete: (index) {
                                  widget.controller.deleteItenToDO(index);
                                },
                                onDragEnd: (details, index) {
                                  if (details.offset.dx > screenWidth * 0.6) {
                                    widget.controller.loadInProgress(
                                        widget.controller.resultInitial![index],
                                        index,
                                        true);

                                    _carouselController.nextPage();
                                  }
                                  setState(() {
                                    startDrag = false;
                                  });
                                },
                                title: 'Para fazer',
                                content: widget.controller.resultInitial);
                            // controller.resultInitial);
                          },
                        ),
                        Builder(
                          builder: (BuildContext context) {
                            return SprintCardWidget(
                              onTapDelete: (index) {
                                widget.controller.deleteItenInProgress(index);
                                setState(() {});
                              },
                              onDragEnd: (details, index) {
                                if (details.offset.dx > screenWidth * 0.6) {
                                  widget.controller.changeToConclued(
                                      widget
                                          .controller.resultInProgress![index],
                                      index);

                                  _carouselController.nextPage();
                                } else if (details.offset.dx <
                                    screenWidth * 0.16) {
                                  widget.controller.toDoItem(
                                      widget
                                          .controller.resultInProgress![index],
                                      index);
                                  _carouselController.previousPage();
                                }
                                setState(() {
                                  startDrag = false;
                                });
                              },
                              title: 'Em progresso',
                              content: widget.controller.resultInProgress,
                            );
                          },
                        ),
                        Builder(
                          builder: (BuildContext context) {
                            return SprintCardWidget(
                              onTapDelete: (index) {
                                widget.controller.deleteconcludes(index);
                              },
                              onDragEnd: (details, index) {
                                if (details.offset.dx < screenWidth * 0.6) {
                                  widget.controller.loadInProgress(
                                      widget.controller.conclued![index],
                                      index,
                                      false);
                                  widget.controller.deleteconcludes(index);
                                  _carouselController.previousPage();
                                  //    setState(() {});
                                }
                              },
                              title: 'Feito',
                              content: widget.controller.conclued,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

Widget cardWidget(bool isdraged, String? task, VoidCallback onTapDelete) {
  return Positioned(
    child: SizedBox(
      width: 150,
      child: Container(
        decoration:
            BoxDecoration(color: AppColors.kPrimaryLiggtColor, boxShadow: [
          if (!isdraged)
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
                              ))
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
