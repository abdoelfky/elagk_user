import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../auth/presentation/components/screen_background.dart';
import '../../shared/utils/app_assets.dart';
import '../components/onboarding_appBar.dart';
import '../controllers/onboarding_cubit.dart';
import '../controllers/onboarding_model.dart';
import '../controllers/onboarding_state.dart';

class OnBoardingScreen extends StatelessWidget {
  var boardController = PageController();

  List<BoardingModel> boarding = [
    BoardingModel(
        title: 'جميع أنواع الأدويه في مكان واحد',
        body: 'Facilitates Follow-up patients and discuss issues with the nurse',
        image:  'assets/images/onboarding/1/image.png',
        color:Color(0xff04914F),
        bColor: Color(0xff45DC95)
    ),
    BoardingModel(
        title: 'هتلاقينا جمبك في كل مكان',
        body: 'Together,let\’s innovate for impact',
        image: 'assets/images/onboarding/2/image.png',
        color:Color(0xff1D71B8),
        bColor: Color(0xff1ECEE9)
    ),
    BoardingModel(
        title: 'اسرع توصيل في مصر',
        body:
            'Smart application to make doctor always aware of the patient\'s condition',
        image: 'assets/images/onboarding/3/image.png',
        color:Color(0xffEB5353),
        bColor: Color(0xffFF7171)
        )
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnboardingCubit, OnboardingStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = OnboardingCubit.get(context);
        return Scaffold(
          body: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: boardController,
                  onPageChanged: (int index) {
                    cubit.changeOnBoarding(index, boarding.length);
                  },
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) =>
                      buildBoardingItem(boarding[index], context),
                  itemCount: boarding.length,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildBoardingItem(BoardingModel model, context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: model.color,
          body: ScreenBackground(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  OnboardingAppBar(
                      context: context,
                      title: "",
                      onTap: () {
                        OnboardingCubit.get(context).submit(context);
                      },
                      actionWidget: TextButton(
                          onPressed: () {
                            OnboardingCubit.get(context).submit(context);
                          },
                          child: Row(
                            children: const [
                              Text(
                                'تخطى',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ))),
                  Expanded(
                    child: Image(
                      image: AssetImage(
                        '${model.image}',
                      ),
                    ),
                  ),
                  Text(
                    '${model.title}',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    '${model.body}',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      SmoothPageIndicator(
                        controller: boardController,
                        effect: ExpandingDotsEffect(
                          activeDotColor: Colors.white,
                          dotColor: model.bColor,
                          dotHeight: 10,
                          expansionFactor: 3,
                          dotWidth: 10,
                          spacing: 5,
                        ),
                        count: boarding.length,
                      ),
                      Spacer(),
                      FloatingActionButton(
                        backgroundColor: model.bColor,
                        onPressed: () {
                          if (OnboardingCubit.get(context).isLast) {
                            OnboardingCubit.get(context).submit(context);
                          } else {
                            boardController.nextPage(
                              duration: Duration(
                                milliseconds: 750,
                              ),
                              curve: Curves.fastLinearToSlowEaseIn,
                            );
                          }
                        },
                        child: Icon(Icons.arrow_forward_ios),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
