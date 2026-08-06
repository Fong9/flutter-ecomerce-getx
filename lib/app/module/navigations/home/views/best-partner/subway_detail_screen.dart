import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/core/widgets/app_button.dart';
import 'package:flutter_application_1/app/core/themes/color.dart';
import 'package:flutter_application_1/app/core/themes/font.dart';
import 'package:flutter_application_1/app/module/navigations/home/models/best_partner_model.dart';
import 'package:flutter_application_1/app/module/navigations/home/models/subway-model/subway_model.dart';
import 'package:flutter_application_1/app/module/navigations/home/views/best-partner/controllers/counter_controller.dart';
import 'package:flutter_application_1/app/module/navigations/home/views/best-partner/controllers/select_size_controller.dart';
import 'package:flutter_application_1/app/routes/route.dart';
import 'package:get/get.dart';

class SubwayDetailScreen extends StatefulWidget {
  const SubwayDetailScreen({super.key});

  @override
  State<SubwayDetailScreen> createState() => _SubwayDetailScreenState();
}

class _SubwayDetailScreenState extends State<SubwayDetailScreen> {
  late BestPartnerModel bestPartner;
  late SubwayModel subway;

  @override
  void initState() {
    super.initState();

    final args = Get.arguments as Map<String, dynamic>;

    bestPartner = args['partner'];
    subway = args['subway'];
  }

  final controller = Get.find<CounterController>();
  final selectController = Get.find<SelectSizeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Center(
          child: Column(
            spacing: 16,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: .only(topLeft: .circular(25), topRight: .circular(10)),
                  ),
                  child: Column(
                    spacing: 16,
                    children: [
                      SizedBox(
                        width: 50,
                        child: Divider(
                          thickness: 4,
                          radius: .circular(10),
                          color: ColorTheme.neutral200,
                        ),
                      ),
                      Column(
                        children: [
                          Text(subway.name, style: Font.interLarge(size: 20, weight: .w600)),
                          Text(
                            "A signature flame-grilled beef patty\ntopped with smoked bacon.",
                            textAlign: .center,
                            style: Font.inter(color: ColorTheme.neutral500),
                          ),
                        ],
                      ),

                      Image.network(
                        subway.img,
                        errorBuilder: (context, error, stackTrace) {
                          return Center(child: Text("No Image"));
                        },
                      ),

                      Obx(
                        () => Row(spacing: 24, mainAxisAlignment: .center, 
                          children: [
                            _container("S", 0),
                            _container("M", 1),
                            _container("L", 2),
                          ],
                        ),
                      ),

                      const SizedBox(height: 24),

                      Row(
                        mainAxisAlignment: .center,
                        spacing: 16,
                        children: [
                          AppButton(
                            onTap: () {
                              controller.decrement();
                            },
                            height: 40,
                            width: 40,
                            raduis: 30,
                            color: ColorTheme.primary.withValues(alpha: 0.3),
                            child: Icon(Icons.remove, color: ColorTheme.primary),
                          ),

                          Obx(
                            () => Text(
                              "${controller.number}",
                              style: Font.interMedium(weight: .w600),
                            ),
                          ),

                          AppButton(
                            onTap: () {
                              controller.increment();
                            },
                            height: 40,
                            width: 40,
                            raduis: 30,
                            color: ColorTheme.primary.withValues(alpha: 0.3),
                            child: Icon(Icons.add, color: ColorTheme.primary),
                          ),
                        ],
                      ),

                      Spacer(),

                      Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text("Price", style: Font.inter(weight: .w600)),
                              Text(
                                "\$ ${subway.price}",
                                style: Font.interMedium(weight: .w600, color: ColorTheme.primary),
                              ),
                            ],
                          ),
                          AppButton(
                            onTap: () {
                              Get.toNamed(
                                Routes.subwayOrder,
                                arguments: {
                                  'controller': controller,
                                  'partner': bestPartner,
                                  'subway': subway,
                                },
                              );
                            },
                            raduis: 20,
                            width: 200,
                            height: 50,
                            child: Center(
                              child: Text(
                                "Add to Order",
                                style: Font.interSmall(color: Colors.white, weight: .w500),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ).paddingSymmetric(horizontal: 24, vertical: 24),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _container(String size, int index) {
    final isSelected = selectController.currentIndex.value == index;

    return GestureDetector(
      onTap: () {
        selectController.onSelect(index);
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color:  isSelected ? ColorTheme.primary : ColorTheme.white,
          borderRadius: .circular(10),
          boxShadow: [
            BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 5, spreadRadius: 0.5),
          ],
        ),
        child: Center(child: Text(size)),
      ),
    );
  }
}
