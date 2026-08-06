import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/core/widgets/app_button.dart';
import 'package:flutter_application_1/app/core/widgets/app_text_field.dart';
import 'package:flutter_application_1/app/core/themes/color.dart';
import 'package:flutter_application_1/app/core/themes/font.dart';
import 'package:flutter_application_1/app/core/themes/icon.dart';
import 'package:flutter_application_1/app/core/themes/image.dart';
import 'package:flutter_application_1/app/module/navigations/home/controllers/customer_controller.dart';
import 'package:flutter_application_1/app/module/navigations/home/controllers/subway_controller.dart';
import 'package:flutter_application_1/app/module/navigations/home/models/best_partner_model.dart';
import 'package:flutter_application_1/app/routes/route.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SubwayScreen extends GetView<SubwayController> {
  SubwayScreen({super.key});

  final args = Get.arguments as Map<String, dynamic>;
  
  @override
  Widget build(BuildContext context) {
    final customerControler = Get.find<CustomerController>();
    final BestPartnerModel bestPartner = args['partner'];
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, isScroll) {
            return [
              SliverAppBar(
                toolbarHeight: 0,
                automaticallyImplyLeading: false,
                expandedHeight: 240,
                pinned: true,
                elevation: 0,
                backgroundColor: Colors.white,
                flexibleSpace: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(Images.subway, fit: BoxFit.cover),

                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: -1,
                      child: Container(
                        height: isScroll ? 100 : 10,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ];
          },

          body: SafeArea(
            bottom: false,
            child: Transform.translate(
              offset: Offset(-0, -40),
              child: Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 5,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      const SizedBox(height: 30),

                      Column(
                        spacing: 10,
                        children: [
                          Row(
                            mainAxisAlignment: .spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    bestPartner.name,
                                    style: Font.interLarge(weight: .w500, size: 24),
                                  ),
                                  SvgPicture.asset(IconsTheme.security),
                                ],
                              ),
                              Row(
                                spacing: 10,
                                children: [
                                  Text(
                                    "Take Away",
                                    style: Font.interSmall(color: ColorTheme.primary),
                                  ),
                                  Icon(Icons.favorite, size: 14, color: ColorTheme.primary),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            spacing: 10,
                            children: [
                              Text(
                                "Open",
                                style: Font.interSmall(weight: .w500, color: ColorTheme.green500),
                              ),
                              Icon(Icons.circle, size: 4),
                              Text("Ta Khmau", style: Font.interSmall()),
                            ],
                          ),

                          const Divider(),

                          Row(
                            spacing: 16,
                            children: [
                              AppButton(
                                width: 55,
                                height: 24,
                                raduis: 8,
                                child: Row(
                                  spacing: 5,
                                  mainAxisAlignment: .center,
                                  children: [
                                    Icon(Icons.star_rounded, size: 14, color: Colors.white),
                                    Text(
                                      "4.5",
                                      style: Font.inter(color: Colors.white, weight: .w600),
                                    ),
                                  ],
                                ),
                              ),

                              const Icon(Icons.circle, size: 4, color: ColorTheme.neutral400),

                              Row(
                                spacing: 5,
                                mainAxisAlignment: .center,
                                children: [
                                  Icon(Icons.timelapse, size: 18, color: ColorTheme.neutral400),
                                  Text("15 Mins", style: Font.inter(weight: .w500)),
                                ],
                              ),

                              const Icon(Icons.circle, size: 4, color: ColorTheme.neutral400),

                              Row(
                                spacing: 5,
                                mainAxisAlignment: .center,
                                children: [
                                  Icon(Icons.attach_money, size: 18, color: ColorTheme.neutral400),
                                  Text("15 Mins", style: Font.inter(weight: .w500)),
                                ],
                              ),
                            ],
                          ),

                          AppTextField(
                            hintText: "Promo Code",
                            prefixIcon: Icon(Icons.percent, color: ColorTheme.primary),
                          ),

                          const Divider(color: ColorTheme.neutral200),

                          TabBar(
                            isScrollable: false,
                            dividerColor: ColorTheme.neutral200,
                            indicatorColor: ColorTheme.primary,
                            indicatorSize: .tab,
                            indicatorWeight: 2.5,
                            labelStyle: Font.inter(color: ColorTheme.primary, weight: .w600),
                            tabs: [
                              Tab(text: "Delivery"),
                              Tab(text: "Review"),
                            ],
                          ),
                        ],
                      ).paddingSymmetric(horizontal: 16),

                      Expanded(
                        child: TabBarView(
                          children: [
                            Obx(() {
                              return _delivery(bestPartner);
                            }),
                            Obx(() => _review(customerControler)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _delivery(BestPartnerModel bestPartner) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text("Popular Items", style: Font.h5()),

          const SizedBox(height: 16),

          SingleChildScrollView(
            scrollDirection: .horizontal,
            child: Row(
              spacing: 10,
              children: List.generate(controller.burgerCombo.length, (index) {
                final subway = controller.subwayModel[index];
                return Column(
                  crossAxisAlignment: .start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(
                          Routes.subwayDetail,
                          arguments: {'subway': subway, 'partner': bestPartner},
                        );
                      },
                      child: Container(
                        width: 145,
                        height: 145,
                        decoration: BoxDecoration(
                          color: ColorTheme.primary.withValues(alpha: 0.3),
                          borderRadius: .circular(10),
                        ),
                        child: Center(
                          child: Image.network(
                            subway.img,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              }

                              return Center(child: CircularProgressIndicator());
                            },
                            errorBuilder: (context, error, stackTrace) {
                              return Text("No Image");
                            },
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    SizedBox(
                      width: 145,
                      child: Column(
                        children: [
                          Text(subway.name, style: Font.interMedium(weight: .w500), maxLines: 2),
                          Row(
                            spacing: 10,
                            children: [
                              Text(
                                "\$${subway.price}",
                                style: Font.inter(color: ColorTheme.green500),
                              ),
                              Icon(Icons.circle, size: 4, color: ColorTheme.neutral400),
                              Text(subway.type),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),

          const SizedBox(height: 24),

          Column(
            crossAxisAlignment: .start,
            children: [
              Text('Hot Burger Combo', style: Font.interMedium(weight: .w600)),

              const SizedBox(height: 16),

              Column(
                spacing: 24,
                children: List.generate(controller.burgerCombo.length, (index) {
                  final burgerCombo = controller.burgerCombo[index];
                  return Row(
                    spacing: 16,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: .circular(10),
                          color: ColorTheme.primary.withValues(alpha: 0.3),
                        ),
                        child: Center(
                          child: Image.network(
                            burgerCombo.img,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              }

                              return CircularProgressIndicator();
                            },
                            errorBuilder: (context, error, stackTrace) {
                              return Text("No Image");
                            },
                          ),
                        ),
                      ),

                      Column(
                        spacing: 12,
                        crossAxisAlignment: .start,
                        children: [
                          Row(
                            spacing: 24,
                            children: [
                              SizedBox(
                                width: 200,
                                child: Text(
                                  burgerCombo.name,
                                  style: Font.interMedium(weight: .w500),
                                  overflow: .ellipsis,
                                ),
                              ),
                              Icon(Icons.star_rounded, color: ColorTheme.primary),
                            ],
                          ),
                          Row(
                            spacing: 10,
                            children: [
                              Text(
                                "\$${burgerCombo.price}",
                                style: Font.inter(color: ColorTheme.primary),
                              ),
                              Icon(Icons.circle, size: 4, color: ColorTheme.neutral400),
                              Text(burgerCombo.type),
                            ],
                          ),
                        ],
                      ),
                    ],
                  );
                }),
              ),
            ],
          ),

          const SizedBox(height: 24),

          Column(
            crossAxisAlignment: .start,
            children: [
              Text('Fried Chicken Combo', style: Font.interMedium(weight: .w600)),

              const SizedBox(height: 16),

              Column(
                spacing: 24,
                children: List.generate(controller.chickenCombo.length, (index) {
                  final chickenCombo = controller.chickenCombo[index];
                  return Row(
                    spacing: 16,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: .circular(10),
                          color: ColorTheme.primary.withValues(alpha: 0.3),
                        ),
                        child: Center(
                          child: Image.network(
                            chickenCombo.img,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              }

                              return CircularProgressIndicator();
                            },
                            errorBuilder: (context, error, stackTrace) {
                              return Text("No Image");
                            },
                          ),
                        ),
                      ),

                      Column(
                        spacing: 12,
                        crossAxisAlignment: .start,
                        children: [
                          Row(
                            spacing: 24,
                            children: [
                              SizedBox(
                                width: 200,
                                child: Text(
                                  chickenCombo.name,
                                  style: Font.interMedium(weight: .w500),
                                  overflow: .ellipsis,
                                ),
                              ),
                              Icon(Icons.star_rounded, color: ColorTheme.primary),
                            ],
                          ),
                          Row(
                            spacing: 10,
                            children: [
                              Text(
                                "\$${chickenCombo.price}",
                                style: Font.inter(color: ColorTheme.primary),
                              ),
                              Icon(Icons.circle, size: 4, color: ColorTheme.neutral400),
                              Text(chickenCombo.type),
                            ],
                          ),
                        ],
                      ),
                    ],
                  );
                }),
              ),
            ],
          ),
        ],
      ).paddingSymmetric(horizontal: 16, vertical: 24),
    );
  }

  Widget _review(CustomerController customerControler) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            spacing: 24,
            children: List.generate(customerControler.customerModel.length, (index) {
              final customer = customerControler.customerModel[index];
              return Column(
                spacing: 16,
                children: [
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Row(
                        spacing: 16,
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: ColorTheme.primary.withValues(alpha: 0.3),
                              borderRadius: .circular(30),
                            ),
                            child: Center(
                              child: Image.network(
                                customer.prfile,
                                errorBuilder: (context, error, stackTrace) {
                                  return Center(
                                    child: Icon(
                                      Icons.person,
                                      color: ColorTheme.neutral400,
                                      size: 32,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),

                          Text(customer.name, style: Font.interMedium(weight: .w600)),
                        ],
                      ),
                      Text(customer.date),
                    ],
                  ),
                  Text(customer.comment),

                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Row(
                        spacing: 10,
                        children: [
                          Icon(Icons.favorite, size: 14, color: ColorTheme.primary),
                          Text("68 likes", style: Font.caption(color: ColorTheme.primary)),
                        ],
                      ),
                      Icon(Icons.flag, color: ColorTheme.neutral400),
                    ],
                  ),
                  if (index != customerControler.customerModel.length - 1) Divider(),
                ],
              );
            }),
          ),
        ],
      ).paddingSymmetric(horizontal: 16, vertical: 24),
    );
  }
}
