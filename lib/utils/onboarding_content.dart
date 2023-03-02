class UnboardingContent {
  String image;
  String title;
  String description;

  UnboardingContent({required this.image, required this.title, required this.description});
}

List<UnboardingContent> contents = [
  UnboardingContent(
    image: "assets/images/onboard_1.png",
    title: "Track Your Goals",
    description: "Don't worry if you have trouble determining your goals, We can help you determine your goals and track your goals"
  ),
  UnboardingContent(
    image: "assets/images/onboard_2.png",
    title: "Get Burn",
    description: "Let’s keep burning, to achive yours goals, it hurts only temporarily, if you give up now you will be in pain forever"
  ),
  UnboardingContent(
    image: "assets/images/onboard_3.png",
    title: "Have Fun ;)",
    description: "We believe that fitness should be enjoyable and rewarding. That's why we've made our app easy to use and packed with exciting features that will keep you motivated and engaged."
  ),
  UnboardingContent(
    image: "assets/images/onboard_4.png",
    title: "FitTrack",
    description: "Welcome to our fitness app designed for everyone to help you track your fitness progress and set achievable goals. Everyone can TRACK and TRAIN!"
  ),
];