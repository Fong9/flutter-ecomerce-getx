import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/core/widgets/app_button.dart';
import 'package:flutter_application_1/app/core/widgets/app_text_field.dart';
import 'package:flutter_application_1/app/core/themes/color.dart';
import 'package:flutter_application_1/app/core/themes/font.dart';
import 'package:flutter_application_1/app/module/navigations/home/models/best_partner_model.dart';
import 'package:flutter_application_1/app/module/navigations/home/models/subway-model/subway_model.dart';
import 'package:flutter_application_1/app/module/navigations/home/views/best-partner/controllers/counter_controller.dart';
import 'package:flutter_application_1/app/routes/route.dart';
import 'package:get/get.dart';

class SubwayOrder extends StatefulWidget {
  const SubwayOrder({super.key});

  @override
  State<SubwayOrder> createState() => _SubwayOrderState();
}

class _SubwayOrderState extends State<SubwayOrder> {
  late BestPartnerModel bestPartner;
  late SubwayModel subway;
  late CounterController controller;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    final args = Get.arguments as Map<String, dynamic>;

    controller = args['controller'];
    bestPartner = args['partner'];
    subway = args['subway'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Confirm Order', style: Font.h5()),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          spacing: 16,
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.white, borderRadius: .circular(10)),
              child: Column(
                spacing: 24,
                crossAxisAlignment: .start,
                children: [
                  Text("Delivery to", style: Font.h5()),
                  Divider(),
                  Row(
                    crossAxisAlignment: .start,
                    spacing: 10,
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          color: ColorTheme.neutral200,
                          borderRadius: .circular(10),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: .start,
                          children: [
                            Text("Ta Khmau, Kandal, Cambodia", maxLines: 2),
                            Row(
                              spacing: 5,
                              children: [
                                Icon(Icons.location_pin, size: 14, color: ColorTheme.neutral400),
                                Text('1.5 km', style: Font.inter(color: ColorTheme.neutral400)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ).paddingAll(16),
            ).paddingSymmetric(horizontal: 16, vertical: 16),

            Container(
              decoration: BoxDecoration(color: Colors.white, borderRadius: .circular(10)),
              child: Column(
                spacing: 24,
                crossAxisAlignment: .start,
                children: [
                  Text(bestPartner.name, style: Font.h5()),
                  Divider(),
                  Row(
                    crossAxisAlignment: .center,
                    spacing: 10,
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(color: Colors.white, borderRadius: .circular(10)),
                        child: Center(child: Image.network(subway.img)),
                      ),
                      Expanded(
                        child: Column(
                          spacing: 10,
                          crossAxisAlignment: .start,
                          children: [
                            Text(subway.name, maxLines: 2),
                            Row(
                              spacing: 24,
                              children: [
                                AppButton(
                                  width: 80,
                                  height: 30,
                                  raduis: 10,
                                  color: ColorTheme.neutral200,
                                  child: Row(
                                    mainAxisAlignment: .spaceBetween,
                                    children: [
                                      AppButton(
                                        onTap: () {
                                          controller.increment();
                                        },
                                        width: 14,
                                        height: 14,
                                        color: ColorTheme.neutral400,
                                        child: Center(
                                          child: Icon(Icons.add, color: Colors.white, size: 14),
                                        ),
                                      ),
                                      Obx(() => Text("${controller.number}")),
                                      AppButton(
                                        onTap: () {
                                          controller.decrement();
                                        },
                                        width: 14,
                                        height: 14,
                                        child: Center(
                                          child: Icon(Icons.remove, size: 14, color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ).paddingSymmetric(horizontal: 10),
                                ),
                                Text(
                                  '\$${subway.price}',
                                  style: Font.inter(color: ColorTheme.primary),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    spacing: 10,
                    children: [
                      _row(
                        name: Text('Subtotal', style: Font.inter()),
                        value: Text("\$ ${subway.price}"),
                      ),
                      Divider(),
                      _row(name: Text('Delivery'), value: Text("\$ ${0.00}")),
                      Divider(),
                      _row(name: Text('Voucher'), value: Text("_")),
                      Divider(),
                      _row(
                        name: Text('Total', style: Font.interMedium(weight: .w600)),
                        value: Text(
                          "\$ ${subway.price}",
                          style: Font.interMedium(color: ColorTheme.primary, weight: .w600),
                        ),
                      ),
                    ],
                  ),
                ],
              ).paddingAll(16),
            ).paddingSymmetric(horizontal: 16),

            AppButton(
              height: 60,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Row(
                    spacing: 10,
                    children: [
                      Icon(Icons.percent, color: ColorTheme.primary),
                      Text("Add Voucher"),
                    ],
                  ),
                  AppButton(
                    width: 80,
                    raduis: 16,
                    color: ColorTheme.primary.withValues(alpha: 0.1),
                    child: Center(
                      child: Text(
                        "Add",
                        style: Font.inter(color: ColorTheme.primary, weight: .w600),
                      ),
                    ),
                  ),
                ],
              ).paddingAll(16),
            ).paddingSymmetric(horizontal: 16),
            AppButton(
              color: Colors.white,
              raduis: 0,
              child: Column(
                spacing: 16,
                children: [
                  Row(
                    spacing: 16,
                    mainAxisAlignment: .center,
                    children: [
                      AppButton(
                        width: 120,
                        height: 60,
                        color: ColorTheme.primary.withValues(alpha: 0.1),
                        child: Row(
                          spacing: 10,
                          mainAxisAlignment: .center,
                          children: [
                            Icon(Icons.paypal, color: ColorTheme.blue600),
                            Column(
                              crossAxisAlignment: .start,
                              mainAxisAlignment: .center,
                              children: [
                                Text(
                                  "\$ ${subway.price}",
                                  style: Font.inter(color: ColorTheme.primary, weight: .w600),
                                ),
                                Text("Paypal", style: Font.caption(color: ColorTheme.primary)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      AppButton(
                        width: 120,
                        height: 60,
                        color: ColorTheme.neutral400.withValues(alpha: 0.2),
                        child: Row(
                          spacing: 10,
                          mainAxisAlignment: .center,
                          children: [
                            Icon(Icons.money, color: ColorTheme.green400),
                            Column(
                              crossAxisAlignment: .start,
                              mainAxisAlignment: .center,
                              children: [
                                Text("\$ ${subway.price}", style: Font.inter(weight: .w600)),
                                Text("Cash", style: Font.caption(color: ColorTheme.neutral400)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  AppButton(
                    onTap: () async {
                      setState(() {
                        isLoading = true;
                      });

                      await Future.delayed(Duration(seconds: 2));

                      setState(() {
                        isLoading = false;
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (context) {
                            bool isPaying = false;
                            return StatefulBuilder(
                              builder: (context, bottomSheetState) {
                                return Container(
                                  height: MediaQuery.of(context).size.height / 2,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  child: Column(
                                    spacing: 24,
                                    children: [
                                      SizedBox(
                                        width: 50,
                                        child: Divider(
                                          color: ColorTheme.neutral200,
                                          thickness: 5,
                                          radius: .circular(10),
                                        ),
                                      ),
                                      Text("Add your payment methods", style: Font.h5()),
                                      Divider(),
                                      Column(
                                        spacing: 24,
                                        children: [
                                          AppTextField(
                                            prefixIcon: Icon(
                                              Icons.credit_card,
                                              color: ColorTheme.neutral400,
                                            ),
                                            hintText: "Credit-Card number",
                                            suffixIcon: Icon(
                                              Icons.check_rounded,
                                              color: ColorTheme.neutral400,
                                            ),
                                          ),

                                          Row(
                                            spacing: 16,
                                            children: [
                                              Expanded(child: AppTextField(hintText: "MM/YY")),
                                              Expanded(child: AppTextField(hintText: "CVC")),
                                            ],
                                          ),

                                          Column(
                                            spacing: 10,
                                            children: [
                                              AppButton(
                                                onTap: () async {
                                                  bottomSheetState(() {
                                                    isPaying = true;
                                                  });

                                                  await Future.delayed(Duration(seconds: 2));

                                                  bottomSheetState(() {
                                                    isPaying = false;
                                                    Get.back();

                                                    showDialog(
                                                      context: context,
                                                      barrierDismissible: false,
                                                      builder: (index) {
                                                        return Center(
                                                          child: Container(
                                                            height: 300,
                                                            width: 300,
                                                            decoration: BoxDecoration(
                                                              color: Colors.white,
                                                              borderRadius: .circular(10)
                                                            ),
                                                            child: Column(
                                                              spacing: 16,
                                                              mainAxisAlignment: .center,
                                                              children: [
                                                                Icon(Icons.check_circle_rounded, color: ColorTheme.green500, size: 64,),
                                                                Text("Your ordered successfully", style: Font.interMedium(weight: .w600),),
                                                                Text("You successfully place an order, your order is confirmed and delivered within 20 minutes. Wish you enjoy the food", textAlign: .center,),
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    Get.offAllNamed(Routes.navbar, arguments: {"index": 1});
                                                                  },
                                                                  child: Text("KEEP BROWSING", style: Font.inter(color: ColorTheme.primary),))
                                                              ],
                                                            ).paddingAll(24),
                                                          ),
                                                        );
                                                    });

                                                  });
                                                  

                                                },
                                                height: 50,
                                                child: Center(
                                                  child: isPaying
                                                      ? SizedBox(
                                                          width: 20,
                                                          height: 20,
                                                          child: CircularProgressIndicator(strokeWidth: 2.5,),
                                                        )
                                                      : Text(
                                                          "Add Card",
                                                          style: Font.inter(
                                                            color: Colors.white,
                                                            weight: .w600,
                                                          ),
                                                        ),
                                                ),
                                              ),
                                              AppButton(
                                                height: 50,
                                                child: Center(
                                                  child: Text(
                                                    "Scan Card",
                                                    style: Font.inter(weight: .w600),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ).paddingSymmetric(horizontal: 24, vertical: 16),
                                );
                              },
                            );
                          },
                        );
                      });
                    },
                    height: 50,
                    child: Center(
                      child: isLoading
                          ? SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(strokeWidth: 2.5),
                            )
                          : Text("Submit", style: Font.h6(color: Colors.white)),
                    ),
                  ),
                ],
              ).paddingAll(24),
            ),
          ],
        ),
      ),
    );
  }

  Widget _row({required Text name, required Text value}) {
    return Row(mainAxisAlignment: .spaceBetween, children: [name, value]);
  }
}
