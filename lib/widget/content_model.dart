class UnboardingContent {
  String image;
  String title;
  String description;
  UnboardingContent({
    required this.description,
    required this.image,
    required this.title
  });
}

List<UnboardingContent> contents=[
  UnboardingContent(
    description: "Pick your food form our menu\n     More than 35 times",
    image: "images/Step1.png",
    title: "Select from Our\n  Best Menu"
  ),

  UnboardingContent(
    description: "Deliver your food at your\n    Doorstep",
    image: "images/Step2.png",
    title: "Quick Delivery at Your Doorstep"
  ),

  UnboardingContent(
    description: "Deliver your food at your\n    Doorstep",
    image: "images/Step3.png",
    title: "Quick Delivery at Your Doorstep"
  )
];