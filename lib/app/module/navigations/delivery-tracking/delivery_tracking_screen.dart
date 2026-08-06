import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/core/widgets/app_button.dart';
import 'package:flutter_application_1/app/core/themes/color.dart';
import 'package:flutter_application_1/app/core/themes/font.dart';
import 'package:get/utils.dart';

class DeliveryTrackingScreen extends StatefulWidget {
  const DeliveryTrackingScreen({super.key});

  @override
  State<DeliveryTrackingScreen> createState() => _DeliveryTrackingScreenState();
}

class _DeliveryTrackingScreenState extends State<DeliveryTrackingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Transform.scale(
              scaleY: 1.2,
              scaleX: 1.2,
              child: Image.network(
                "https://developer.trimblemaps.com/mobile-maps-sdk/img/mobile-maps-simple-routing.png",
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child; // image loaded
                  }

                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Center(child: Icon(Icons.error, color: Colors.red));
                },
              ),
            ),
            Positioned(
              bottom: 350,
              left: 0,
              right: 0,
              child: AppButton(
                color: Colors.white,
                child: Column(
                  spacing: 16,
                  children: [
                    Row(
                      crossAxisAlignment: .start,
                      spacing: 10,
                      children: [
                        AppButton(
                          height: 40,
                          width: 40,
                          child: Icon(
                            Icons.shopping_bag,
                            color: ColorTheme.neutral100.withValues(alpha: 0.3),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: .start,
                          children: [
                            Text("Delivery Your Order", style: Font.interMedium(weight: .w600)),
                            Text(
                              "Coming within 30 minutes",
                              style: Font.caption(color: ColorTheme.neutral500),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const Divider(),

                    Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: .start,
                          children: [
                            Text("data"),
                            Row(
                              spacing: 5,
                              children: [
                                Text("data"),
                                Icon(Icons.circle, size: 4, color: ColorTheme.neutral200),
                                Text("data"),
                                Icon(Icons.circle, size: 4, color: ColorTheme.neutral200),
                                Text("data"),
                              ],
                            ),
                          ],
                        ),
                        AppButton(
                          width: 100,
                          height: 50,
                          child: Center(
                            child: Text(
                              "Detail",
                              style: Font.inter(color: Colors.white, weight: .w500),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ).paddingAll(16),
              ).paddingSymmetric(horizontal: 16),
            ),

            Positioned(
              bottom: 70,
              left: 0,
              right: 0,
              child: AppButton(
                color: Colors.white,
                child: Column(
                  spacing: 16,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Delivery Tracking", style: Font.h5()),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Icon(Icons.location_on, color: Colors.red, size: 20),

                            Container(height: 45, width: 2, color: ColorTheme.neutral300),

                            Icon(Icons.my_location, color: ColorTheme.primary, size: 22),
                          ],
                        ),

                        const SizedBox(width: 16),

                        // Locations
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Subway Restaurant", style: Font.inter(weight: .w600)),

                              Text(
                                "Order pickup location",
                                style: Font.inter(color: ColorTheme.neutral400),
                              ),

                              const SizedBox(height: 24),

                              Text("My Location", style: Font.inter(weight: .w600)),

                              Text(
                                "Ta Khmau, Kandal",
                                style: Font.inter(color: ColorTheme.neutral400),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    Divider(),

                    Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Preparing your order", style: Font.inter(weight: .w600)),

                            Text(
                              "Estimated arrival 20 mins",
                              style: Font.inter(color: ColorTheme.neutral400),
                            ),
                          ],
                        ),

                        AppButton(
                          width: 80,
                          height: 35,
                          child: Center(
                            child: Text("Call", style: Font.inter(color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ).paddingAll(16),
              ).paddingSymmetric(horizontal: 16),
            ),
          ],
        ),
      ),
    );
  }
}
