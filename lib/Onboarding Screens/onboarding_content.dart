class OnboardingContent {
  String image;
  String title;
  String description;

  OnboardingContent(
      {required this.image, required this.title, required this.description});
}

List<OnboardingContent> content = [
  OnboardingContent(
    image:
        'https://img.freepik.com/free-vector/settings-concept-illustration_114360-3056.jpg',
    title: 'Customized Requirements',
    description:
        "Get the relevant technician according to your needs, without any hesitation",
  ),
  OnboardingContent(
    image:
        'https://cdni.iconscout.com/illustration/premium/thumb/online-order-2750347-2294212.png',
    title: 'Get to your needs',
    description:
        "One platform for every technician and home persons, connect them in every possible ways for better solution",
  ),
  OnboardingContent(
    image:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2r7j3WfqFJTLdF3_s5afxNEG4qPuNaV8fYf240kktrASNDGOiBSAjRNEw79ygTq9icwY&usqp=CAU',
    title: 'Contact them hustle free',
    description:
        "Get the correct technician at your power of paw with modern day tech revolutionary things",
  ),
];
