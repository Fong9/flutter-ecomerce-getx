import 'package:flutter_application_1/app/core/themes/image.dart';
import 'package:flutter_application_1/app/module/navigations/home/models/best_partner_model.dart';
import 'package:flutter_application_1/app/module/navigations/home/repository/best-partner/best_partner_repo.dart';
import 'package:flutter_application_1/app/routes/route.dart';

class BestPartnerRepoImple extends BestPartnerRepo{
  @override
  Future<List<BestPartnerModel>> getBestPartner() async{
    return [
      BestPartnerModel(
        name: "Subway", 
        status: true, 
        location: "Phnom Penh", 
        rating: 4.5, 
        distance: 1.5, 
        shipping: "Free shipping",
        img: "https://www.cmgassets.com/s3fs-public/styles/article_details_tablet_image/public/2025-11/image-2.png.webp?itok=ZT4VQINT",
        route: Routes.subway,
      ),
      BestPartnerModel(
        name: "KFC", 
        status: false, 
        location: "Ta Khmau", 
        rating: 4.3, 
        distance: 2.4, 
        shipping: "Free shipping",
        img: "https://thekfcmenu.com/wp-content/uploads/2026/02/KFC-Chicken-Tenders-768x432.webp",
        route: "",
      ),
      BestPartnerModel(
        name: "Burger King", 
        status: false, 
        location: "Toul Kouk", 
        rating: 4.3, 
        distance: 2.4, 
        shipping: "Free shipping",
        img: Images.burgerKing,
        route: "",
      ),
    ];
  }
}