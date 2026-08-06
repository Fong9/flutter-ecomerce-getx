import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/core/widgets/app_button.dart';
import 'package:flutter_application_1/app/core/widgets/app_text_field.dart';
import 'package:flutter_application_1/app/core/themes/color.dart';
import 'package:flutter_application_1/app/core/themes/font.dart';
import 'package:flutter_application_1/app/core/themes/image.dart';
import 'package:flutter_application_1/app/routes/route.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ChooseLocation extends StatelessWidget {
  const ChooseLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            SvgPicture.asset(Images.map),
            Column(
              spacing: 10,
              children: [
                const SizedBox(height: 30,),
                Text("Find Nearby Restaurants", style: Font.h4(),),
                Text("Enter your location or allow access to your\nlocation to find restaurants near you.", textAlign: .center, style: Font.interSmall(color: ColorTheme.neutral500),)
              ],
            ),

            const SizedBox(height: 24,),

            AppButton(
              color: ColorTheme.neutral200,
              height: 50,
              child: Center(child: Text("Use current location", style: Font.interSmall(weight: .w600),))
            ),

            const SizedBox(height: 16,),

            AppTextField(hintText: "Enter a new address", prefixIcon: Icon(Icons.location_on, color: ColorTheme.neutral400,), suffixIcon: Icon(Icons.cancel),),
            
            const SizedBox(height: 16,),

            AppButton(
              onTap: () => Get.toNamed(Routes.navbar),
              height: 50,
              child: Center(child: Text("Next", style: Font.interSmall(color: Colors.white, weight: .bold),),))
          ],
        ).paddingSymmetric(horizontal: 24, vertical: 102),
      ),
    );
  }
}