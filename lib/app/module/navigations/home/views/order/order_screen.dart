import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/core/widgets/app_button.dart';
import 'package:flutter_application_1/app/core/widgets/app_text_field.dart';
import 'package:flutter_application_1/app/core/themes/color.dart';
import 'package:flutter_application_1/app/core/themes/font.dart';
import 'package:flutter_application_1/app/core/themes/icon.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          spacing: 24,
          children: [
            Container(
              color: Colors.white,
              child: Column(
                spacing: 24,
                children: [
                  AppTextField(
                    hintText: "Search on Condy",
                    prefixIcon: Icon(Icons.location_on, color: ColorTheme.neutral400),
                  ),
                  TabBar(
                    isScrollable: false,
                    indicatorWeight: 3,
                    indicatorColor: ColorTheme.primary,
                    indicatorSize: .tab,
                    labelColor: ColorTheme.primary,
                    dividerColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                    labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    unselectedLabelStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    tabs: [
                      Text("Ongoing").paddingOnly(bottom: 16),
                      Text("History").paddingOnly(bottom: 16),
                    ],
                  ),
                ],
              ).paddingOnly(top: 24, left: 16, right: 16),
            ),

            Expanded(
              child: TabBarView(
                children: [
                  Center(child: Text("Empty")),
                  _history(),
                ],
              )
            ),
          ],
        ),
      ),
    );
  }

  Widget _history() {
    return ListView.builder(
      itemCount: 2,
      itemBuilder: (context, index) {
        return Container(
          color: Colors.white,
          child: Column(
            spacing: 16,
            children: [
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Row(
                    spacing: 12,
                    children: [
                      Text("Drink", style: Font.inter(color: ColorTheme.neutral500)),
                      Text("Completed", style: Font.inter(color: ColorTheme.green500)),
                    ],
                  ),
                  Text("Tuesday, 03 March 2023", style: Font.inter(color: ColorTheme.neutral500)),
                ],
              ),
    
              const Divider(),
    
              Row(
                crossAxisAlignment: .start,
                spacing: 10,
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    color: ColorTheme.blue500,
                    child: Center(child: Icon(Icons.backpack)),
                  ),
                  Column(
                    crossAxisAlignment: .start,
                    children: [
                      Row(children: [Text("Starbucks"), SvgPicture.asset(IconsTheme.security)]),
                      Text("250 Ta Khmau, Kandal"),
                      Row(
                        spacing: 10,
                        children: [
                          Text("\$40"),
                          Icon(Icons.circle, size: 4, color: ColorTheme.neutral200),
                          Text("2 items"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                spacing: 10,
                children: [
                  Expanded(
                    child: AppButton(
                      height: 50,
                      color: ColorTheme.neutral200,
                      child: Center(child: Text("Rate")),
                    ),
                  ),
                  Expanded(
                    child: AppButton(height: 50, child: Center(child: Text("Re-Order"))),
                  ),
                ],
              ),
            ],
          ).paddingAll(16),
        ).paddingOnly(left: 16, right: 16, bottom: 24);
      },
    );
  }
}
