import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/module/navigations/delivery-tracking/delivery_tracking_screen.dart';

class DeliveryScreen extends StatefulWidget {
  const DeliveryScreen({super.key});

  @override
  State<DeliveryScreen> createState() => _DeliveryScreenState();
}

class _DeliveryScreenState extends State<DeliveryScreen> {
  bool hasOrder = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DeliveryTrackingScreen(),
    );
  }
}