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



}
