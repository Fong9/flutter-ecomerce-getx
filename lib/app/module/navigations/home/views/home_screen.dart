import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/core/widgets/app_button.dart';
import 'package:flutter_application_1/app/core/widgets/app_text_field.dart';
import 'package:flutter_application_1/app/core/themes/color.dart';
import 'package:flutter_application_1/app/core/themes/font.dart';
import 'package:flutter_application_1/app/core/themes/icon.dart';
import 'package:flutter_application_1/app/module/navigations/home/controllers/best_partner_controller.dart';
import 'package:flutter_application_1/app/module/navigations/home/controllers/category_controller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.find<CategoryController>();
    final bestPartnerController = Get.find<BestPartnerController>();
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      // DefaultTabController handles the tab state automatically without needing a StatefulWidget
      body: DefaultTabController(
        length: 4,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 60), // Status bar padding
                  AppTextField(
                    hintText: "Search on Coody",
                    prefixIcon: Icon(Icons.location_on, color: ColorTheme.neutral400),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(IconsTheme.deliver),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: .start,
                            children: [
                              Text('Delivery to', style: Font.inter(color: ColorTheme.primary)),
                              Row(
                                children: [
                                  const Text('Ta Khmau'),
                                  Icon(Icons.arrow_drop_down, color: ColorTheme.primary),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      AppButton(
                        width: 80,
                        height: 40,
                        color: ColorTheme.neutral100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(IconsTheme.filter),
                            const SizedBox(width: 5),
                            const Text('Filter'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Container(
                    height: 4,
                    width: 50,
                    decoration: BoxDecoration(
                      color: ColorTheme.neutral200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ],
              ).paddingOnly(left: 16, right: 16, bottom: 24),
            ),

            Expanded(
              child: NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    // The Content that scrolls away (Categories, Best Partners)
                    SliverToBoxAdapter(
                      child: Column(
                        children: [
                          const SizedBox(height: 24),
                          _buildCategorySection(categoryController),
                          const SizedBox(height: 24),
                          _buildBestPartnersSection(bestPartnerController),
                          const SizedBox(height: 24),
                        ],
                      ),
                    ),

                    // The TabBar that sticks to the top
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: _StickyTabBarDelegate(
                        child: Container(
                          color: const Color(0xFFF8F9FA),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TabBar(
                                isScrollable: false,
                                indicatorColor: const Color(0xFFF2994A),
                                indicatorWeight: 3,
                                indicatorSize: TabBarIndicatorSize.label,
                                labelColor: const Color(0xFFF2994A),
                                unselectedLabelColor: const Color(0xFF1E232A),
                                labelStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                                unselectedLabelStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                                tabs: const [
                                  Tab(text: "Nearby"),
                                  Tab(text: "Sales"),
                                  Tab(text: "Rate"),
                                  Tab(text: "Fast"),
                                ],
                              ),
                              Container(height: 1, color: Colors.grey.shade300),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ];
                },

                // The independent scrollable lists for each Tab
                body: TabBarView(
                  children: [
                    _buildRestaurantList(bestPartnerController),
                    const Center(child: Text("Sales Data")),
                    _buildRestaurantList(bestPartnerController),
                    const Center(child: Text("Fast Data")),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategorySection(CategoryController controller) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Category", style: Font.h5(weight: FontWeight.w600)),
              Text("See all", style: Font.interMedium()),
            ],
          ),
          const SizedBox(height: 16),
          Divider(color: ColorTheme.neutral200),
          const SizedBox(height: 16),
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(controller.categories.length, (index) {
                final categories = controller.categories[index];
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () => Get.toNamed(categories.route),
                      child: Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          color: ColorTheme.primary.withValues(alpha: 0.3),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(child: SvgPicture.asset(categories.img)),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(categories.name, style: Font.interSmall(weight: FontWeight.w400)),
                  ],
                );
              }),
            ),
          ),
        ],
      ).paddingSymmetric(horizontal: 16, vertical: 24),
    ).paddingSymmetric(horizontal: 16);
  }

  Widget _buildBestPartnersSection(BestPartnerController controller) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Best Partners", style: Font.h5(weight: FontWeight.w600)),
              Text("See all", style: Font.interMedium()),
            ],
          ),
          const SizedBox(height: 24),
          Divider(color: ColorTheme.neutral200),
          const SizedBox(height: 24),
          Obx(
            () => SizedBox(
              height: 230,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => const SizedBox(width: 16),
                itemCount: controller.bestPartner.length,
                itemBuilder: (context, index) {
                  final bestPartner = controller.bestPartner[index];
                  return Column(
                    crossAxisAlignment: .start,
                    children: [
                      GestureDetector(
                        onTap: () => Get.toNamed(
                          bestPartner.route,
                          arguments: {
                            'partner': bestPartner,
                          }
                        ),
                        child: Container(
                          height: 120,
                          width: 250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: ColorTheme.primary.withValues(alpha: 0.3),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              bestPartner.img,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  width: double.infinity,
                                  color: Colors.grey.shade200,
                                  alignment: Alignment.center,
                                  child: const Text("No image"),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text(bestPartner.name, style: Font.interLarge(weight: FontWeight.w600)),
                          const SizedBox(width: 5),
                          SvgPicture.asset(IconsTheme.security),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            bestPartner.status ? "Open" : "Close",
                            style: Font.interSmall(color: ColorTheme.green500),
                          ),
                          const SizedBox(width: 10),
                          Icon(Icons.circle, size: 4, color: ColorTheme.neutral200),
                          const SizedBox(width: 10),
                          Text(bestPartner.location),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          AppButton(
                            width: 50,
                            height: 24,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.star, color: Colors.white, size: 14),
                                const SizedBox(width: 3),
                                Text(
                                  "${bestPartner.rating}",
                                  style: Font.interSmall(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          Icon(Icons.circle, size: 4, color: ColorTheme.neutral200),
                          const SizedBox(width: 10),
                          Text("${bestPartner.distance}"),
                          const SizedBox(width: 10),
                          Icon(Icons.circle, size: 4, color: ColorTheme.neutral200),
                          const SizedBox(width: 10),
                          Text(bestPartner.shipping),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ).paddingSymmetric(horizontal: 16, vertical: 24),
    ).paddingSymmetric(horizontal: 16);
  }

  Widget _buildRestaurantList(BestPartnerController controller) {
    return Obx(() {
      final restaurants = controller.bestPartner;
      return ListView.separated(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 40),
        itemCount: restaurants.length,
        separatorBuilder: (context, index) => const SizedBox(height: 28),
        itemBuilder: (context, index) {
          final item = restaurants[index];
          return Column(
            crossAxisAlignment: .start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  item.img, // Changed back to .network assuming API image
                  width: double.infinity,
                  height: 190,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 190,
                      width: double.infinity,
                      color: Colors.grey.shade200,
                      alignment: Alignment.center,
                      child: const Text("No image"),
                    );
                  },
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Text(
                    item.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1F2937),
                    ),
                  ),
                  const SizedBox(width: 6),
                  SvgPicture.asset(IconsTheme.security),
                ],
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  const Text(
                    "Open",
                    style: TextStyle(
                      color: Color(0xFF00B074),
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  _buildDot(),
                  Text("Burger", style: TextStyle(color: Colors.grey.shade500)),
                  _buildDot(),
                  Text("Rice", style: TextStyle(color: Colors.grey.shade500)),
                  _buildDot(),
                  Text("Spaghetti", style: TextStyle(color: Colors.grey.shade500)),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFA800),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.star, size: 14, color: Colors.white),
                        const SizedBox(width: 4),
                        Text(
                          "${item.rating}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  _buildDot(),
                  const Icon(Icons.location_on, size: 16, color: Color(0xFFB0B7C3)),
                  const SizedBox(width: 4),
                  Text(
                    "${item.distance}",
                    style: const TextStyle(fontWeight: FontWeight.w500, color: Color(0xFF4B5563)),
                  ),
                  _buildDot(),
                  const Icon(Icons.attach_money, size: 16, color: Color(0xFFB0B7C3)),
                  const Text(
                    "Free shipping",
                    style: TextStyle(fontWeight: FontWeight.w500, color: Color(0xFF4B5563)),
                  ),
                ],
              ),
            ],
          );
        },
      );
    });
  }

  Widget _buildDot() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        width: 3,
        height: 3,
        decoration: const BoxDecoration(color: Color(0xFFD1D5DB), shape: BoxShape.circle),
      ),
    );
  }
}

class _StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  _StickyTabBarDelegate({required this.child});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => 50.0; // Height of the TabBar

  @override
  double get minExtent => 50.0;

  @override
  bool shouldRebuild(covariant _StickyTabBarDelegate oldDelegate) {
    return false;
  }
}
