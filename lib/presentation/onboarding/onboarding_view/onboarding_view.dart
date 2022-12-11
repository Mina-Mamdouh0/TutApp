
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tut_app/doman/models.dart';
import 'package:tut_app/presentation/onboarding/onboarding_viewmodel/onboarding_viewmodel.dart';
import 'package:tut_app/presentation/resources/asset_manager.dart';
import 'package:tut_app/presentation/resources/color_manager.dart';
import 'package:tut_app/presentation/resources/constant_manager.dart';
import 'package:tut_app/presentation/resources/routes_manager.dart';
import 'package:tut_app/presentation/resources/strings_manager.dart';
import 'package:tut_app/presentation/resources/values_manager.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  _OnBoardingViewState createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {


  final PageController _pageController=PageController();
  final OnBoardingViewModel _viewModel = OnBoardingViewModel();

  _bing(){
    _viewModel.start();
  }
  @override
  void initState() {
    _bing();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SliderViewObject>(
      stream: _viewModel.outputSliderViewObject,
        builder: (context,snapshot){
        return _getContentWidget(snapshot.data);
        });
  }

  Widget _getContentWidget(SliderViewObject? sliderViewObject){
    if(sliderViewObject ==null){
      return Container();
    }else{
      return Scaffold(
        backgroundColor: ColorManager.white,
        appBar: AppBar(
          backgroundColor: ColorManager.white,
          elevation: AppSize.s0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.white,
            statusBarIconBrightness: Brightness.dark,
          ),
        ),
        body: PageView.builder(
            controller: _pageController,
            itemCount: sliderViewObject.numOfSlider,
            onPageChanged: (value){
              _viewModel.pageChanged(value);
            },
            itemBuilder: (context,index){
              return OnBoardingPage(sliderObject:sliderViewObject.sliderObject ,);
            }),
        bottomSheet: Container(
          color: ColorManager.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: (){
                    Navigator.pushReplacementNamed(context, Routes.loginRoute);
                  },
                  child:  Text(StringManager.skip,
                      textAlign: TextAlign.end,
                      style: Theme.of(context).textTheme.titleMedium),
                ),
              ),
              getBottomSheetWidget(sliderViewObject),
            ],
          ),
        ),
      );
    }

  }
  Widget getBottomSheetWidget(SliderViewObject sliderViewObject){
    return Container(
      color: ColorManager.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
              padding:const EdgeInsets.all(AppPadding.p14),
          child: GestureDetector(
            child: SizedBox(
              height: AppSize.s20,
              width: AppSize.s20,
              child: SvgPicture.asset(AssetImages.leftArrowIc),
            ),
            onTap: (){
              _pageController.animateToPage(_viewModel.onPrevious(), duration: const Duration(milliseconds:AppConstant.sliderAnimationTime ), curve: Curves.bounceInOut);
            },
          ),),
          Row(
            children: [
              for(int i=0;i<sliderViewObject.numOfSlider;i++)
                Padding(padding: const EdgeInsets.all(AppPadding.p8),
                child: _getProperCircle(i,sliderViewObject.currentIndex)),
            ],
          ),
          Padding(
            padding:const EdgeInsets.all(AppPadding.p14),
            child: GestureDetector(
              child: SizedBox(
                height: AppSize.s20,
                width: AppSize.s20,
                child: SvgPicture.asset(AssetImages.rightArrowIc),
              ),
              onTap: (){
                _pageController.animateToPage(_viewModel.onNext(), duration: const Duration(milliseconds:AppConstant.sliderAnimationTime ), curve: Curves.bounceInOut);
              },
            ),)
        ],
      ),
    );
  }

  Widget _getProperCircle(int index,int currentIndex){
    if(index==currentIndex){
      return SvgPicture.asset(AssetImages.hollowCircleIc);
    }else{
      return SvgPicture.asset(AssetImages.solidCircleIc);
    }
  }


  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}



class OnBoardingPage extends StatelessWidget {
  final SliderObject sliderObject;
  const OnBoardingPage({Key? key, required this.sliderObject}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: AppSize.s40,),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(sliderObject.title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.displayLarge,),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(sliderObject.subTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,),
        ),
        const SizedBox(height: AppSize.s60,),
        SvgPicture.asset(sliderObject.image)
      ],
    );
  }
}

