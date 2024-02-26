import '../../features/home/data/models/product_model.dart';
import '../../features/onboarding/data/models/onboarding_model.dart';

class Constants {
  static const String baseURL = "https://student.valuxapps.com/api/";

  static List<OnBoardingModel> onBoardingListData = [
    OnBoardingModel(
      img: "assets/images/on1.png",
      title: "Discover and\n Shop with Ease",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry, lorem Ipsum is simply dummy text",
    ),
    OnBoardingModel(
      img: "assets/images/on2.png",
      title: "Seamless Experience For lifetime shopping",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry, lorem Ipsum is simply dummy text",
    ),
    OnBoardingModel(
      img: "assets/images/on3.png",
      title: "Join us now\n and enjoy our offers",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry, lorem Ipsum is simply dummy text",
    ),
  ];

  static List<ProductModel> productList = [
    ProductModel(
      discountValue: 0,
      image: "assets/images/hat.png",
      title: "hat",
      description:
          "Find both comfort and sophisticated style among our selection of furniture. Visit AZ furniture store to browse more and buy.",
      price: 60,
      productId: 1,
    ),
    ProductModel(
      discountValue: 0,
      image: "assets/images/hat2.png",
      title: "Brown Bag",
      description:
          "Find both comfort and sophisticated style among our selection of furniture. Visit AZ furniture store to browse more and buy.  Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Excepteur sint occaecat cupidatat non proident, sunt in culpa qui...",
      price: 120,
      productId: 2,
    ),
    ProductModel(
      discountValue: 0,
      image: "assets/images/glasses.png",
      title: "glasses",
      description:
          "Find both comfort and sophisticated style among our selection of furniture. Visit AZ furniture store to browse more and buy.  Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Excepteur sint occaecat cupidatat non proident, sunt in culpa qui...",
      price: 800,
      productId: 3,
    ),
    ProductModel(
      discountValue: 0,
      image: "assets/images/sofa.png",
      title: "sofa",
      description:
          "Find both comfort and sophisticated style among our selection of furniture. Visit AZ furniture store to browse more and buy.  Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Excepteur sint occaecat cupidatat non proident, sunt in culpa qui...",
      price: 2000,
      productId: 4,
    ),
  ];

  static List<ProductModel> favList = [];
  static List<ProductModel> flashOffersList = [
    ProductModel(
      discountValue: 50,
      image: "assets/images/glasses.png",
      title: "glasses",
      description:
          "Find both comfort and sophisticated style among our selection of furniture. Visit AZ furniture store to browse more and buy.  Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Excepteur sint occaecat cupidatat non proident, sunt in culpa qui...",
      price: 800,
      productId: 3,
    ),
    ProductModel(
      discountValue: 20,
      image: "assets/images/hat.png",
      title: "hat",
      description:
          "Find both comfort and sophisticated style among our selection of furniture. Visit AZ furniture store to browse more and buy.",
      price: 60,
      productId: 1,
    ),
    ProductModel(
      discountValue: 40,
      image: "assets/images/sofa.png",
      title: "sofa",
      description:
          "Find both comfort and sophisticated style among our selection of furniture. Visit AZ furniture store to browse more and buy.  Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Excepteur sint occaecat cupidatat non proident, sunt in culpa qui...",
      price: 2000,
      productId: 4,
    ),
    ProductModel(
      discountValue: 30,
      image: "assets/images/hat2.png",
      title: "Brown Bag",
      description:
          "Find both comfort and sophisticated style among our selection of furniture. Visit AZ furniture store to browse more and buy.  Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Excepteur sint occaecat cupidatat non proident, sunt in culpa qui...",
      price: 120,
      productId: 2,
    ),
  ];
  static List<ProductModel> bestSellerList = [
    ProductModel(
      discountValue: 0,
      image: "assets/images/hat2.png",
      title: "Brown Bag",
      description:
          "Find both comfort and sophisticated style among our selection of furniture. Visit AZ furniture store to browse more and buy.  Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Excepteur sint occaecat cupidatat non proident, sunt in culpa qui...",
      price: 120,
      productId: 2,
    ),
    ProductModel(
      discountValue: 0,
      image: "assets/images/sofa.png",
      title: "sofa",
      description:
          "Find both comfort and sophisticated style among our selection of furniture. Visit AZ furniture store to browse more and buy.  Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Excepteur sint occaecat cupidatat non proident, sunt in culpa qui...",
      price: 2000,
      productId: 4,
    ),
    ProductModel(
      discountValue: 0,
      image: "assets/images/glasses.png",
      title: "glasses",
      description:
          "Find both comfort and sophisticated style among our selection of furniture. Visit AZ furniture store to browse more and buy.  Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Excepteur sint occaecat cupidatat non proident, sunt in culpa qui...",
      price: 800,
      productId: 3,
    ),
    ProductModel(
      discountValue: 0,
      image: "assets/images/hat.png",
      title: "hat",
      description:
          "Find both comfort and sophisticated style among our selection of furniture. Visit AZ furniture store to browse more and buy.",
      price: 60,
      productId: 1,
    ),
  ];
  static List<ProductModel> recommendationProductList = [
    ProductModel(
      discountValue: 0,
      image: "assets/images/hat2.png",
      title: "Brown Bag",
      description:
          "Find both comfort and sophisticated style among our selection of furniture. Visit AZ furniture store to browse more and buy.  Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Excepteur sint occaecat cupidatat non proident, sunt in culpa qui...",
      price: 120,
      productId: 2,
    ),
    ProductModel(
      discountValue: 0,
      image: "assets/images/sofa.png",
      title: "sofa",
      description:
          "Find both comfort and sophisticated style among our selection of furniture. Visit AZ furniture store to browse more and buy.  Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Excepteur sint occaecat cupidatat non proident, sunt in culpa qui...",
      price: 2000,
      productId: 4,
    ),
    ProductModel(
      discountValue: 0,
      image: "assets/images/glasses.png",
      title: "glasses",
      description:
          "Find both comfort and sophisticated style among our selection of furniture. Visit AZ furniture store to browse more and buy.  Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Excepteur sint occaecat cupidatat non proident, sunt in culpa qui...",
      price: 800,
      productId: 3,
    ),
    ProductModel(
      discountValue: 0,
      image: "assets/images/hat.png",
      title: "hat",
      description:
          "Find both comfort and sophisticated style among our selection of furniture. Visit AZ furniture store to browse more and buy.",
      price: 60,
      productId: 1,
    ),
  ];
}
