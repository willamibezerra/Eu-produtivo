import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:image_convert/app/modules/home/presentation/view/state/controllers/itens_sprint_controller.dart';
import 'package:image_convert/app/modules/home/presentation/view/widgets/sprint_card_widget.dart';
import 'package:image_convert/app/shared/widgets/style/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool autoplay = false;
  bool startDrag = false;
  final ItensSprintController controller = ItensSprintController();
  final CarouselSliderController _carouselController =
      CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    List<Widget> progressLisrt = [];
    List<Widget> todoList = [
      Draggable(
        onDragStarted: () {
          setState(() {
            startDrag = true;
            autoplay = false;
          });
        },
        onDragEnd: (details) {
          if (details.offset.dx > screenWidth * 0.8) {
            progressLisrt.add(cardWidget(startDrag));
            controller.loadSprint(progressLisrt);

            _carouselController.nextPage();
          }
          setState(() {
            startDrag = false;
          });
        },
        data: 'Flutter',
        feedback: cardWidget(startDrag),
        childWhenDragging: Container(),
        child: cardWidget(startDrag),
      ),
    ];
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
          backgroundColor: AppColors.kPrimaryColor,
          title: const Center(
            child: Text(
              'Sprint',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          actions: [
            Center(
              child: IconButton(
                onPressed: () {
                  setState(() {
                    autoplay = !autoplay;
                    controller.addOneItem(todoList);
                  });
                },
                icon: const Icon(
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
              ),
            ),
          ]),
      body: Stack(
        children: [
          Column(
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
                        autoPlay: autoplay,
                        autoPlayAnimationDuration:
                            const Duration(microseconds: 100),
                        height: MediaQuery.of(context).size.height * 0.8,
                        enableInfiniteScroll: false,
                      ),
                      items: [
                        Builder(
                          builder: (BuildContext context) {
                            return SprintCardWidget(
                                title: 'Para fazer',
                                content: controller.resultInitial);
                          },
                        ),
                        Builder(
                          builder: (BuildContext context) {
                            return SprintCardWidget(
                              title: 'Em progresso',
                              content: controller.resultInProgress,
                            );
                          },
                        ),
                        Builder(
                          builder: (BuildContext context) {
                            return SprintCardWidget(
                              title: 'Feito',
                              content: controller.conclued,
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
        ],
      ),
    );
  }
}

Widget cardWidget(bool isdraged) {
  return Positioned(
    child: SizedBox(
      height: 100,
      width: 200,
      child: Container(
        decoration: BoxDecoration(color: Colors.yellow[200], boxShadow: [
          if (isdraged)
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
        ]),
      ),
    ),
  );
}
