import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'package:image_convert/app/modules/sprint/presentation/view/state/controllers/itens_sprint_controller.dart';
import 'package:image_convert/app/modules/sprint/presentation/view/widgets/sprint_card_widget.dart';

class BodySprintWidget extends StatefulWidget {
  final ItensSprintController controller;
  final double screenWidth;
  final CarouselSliderController? carouselController;
  const BodySprintWidget({
    Key? key,
    required this.controller,
    required this.screenWidth,
    this.carouselController,
  }) : super(key: key);

  @override
  State<BodySprintWidget> createState() => _BodySprintWidgetState();
}

class _BodySprintWidgetState extends State<BodySprintWidget> {
  bool startDrag = false;
  @override
  Widget build(BuildContext context) {
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
                      carouselController: widget.carouselController,
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
                                  setState(() {});
                                },
                                onDragEnd: (details, index) {
                                  if (details.offset.dx >
                                      widget.screenWidth * 0.6) {
                                    widget.controller.loadInProgress(
                                        widget.controller.resultInitial![index],
                                        index,
                                        true);

                                    widget.carouselController!.nextPage();
                                  }
                                  setState(() {
                                    startDrag = false;
                                  });
                                },
                                title: 'Para fazer',
                                content: widget.controller.resultInitial);
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
                                if (details.offset.dx >
                                    widget.screenWidth * 0.6) {
                                  widget.controller.changeToConclued(
                                      widget
                                          .controller.resultInProgress![index],
                                      index);

                                  widget.carouselController!.nextPage();
                                } else if (details.offset.dx <
                                    widget.screenWidth * 0.16) {
                                  widget.controller.toDoItem(
                                      widget
                                          .controller.resultInProgress![index],
                                      index);
                                  widget.carouselController!.previousPage();
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
                                if (details.offset.dx <
                                    widget.screenWidth * 0.16) {
                                  widget.controller.loadInProgress(
                                      widget.controller.conclued![index],
                                      index,
                                      false);
                                  widget.controller.deleteconcludes(index);
                                  widget.carouselController!.previousPage();
                                  setState(() {});
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
