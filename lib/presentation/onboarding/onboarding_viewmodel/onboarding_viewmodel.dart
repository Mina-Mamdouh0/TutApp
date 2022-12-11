
import 'dart:async';

import 'package:tut_app/doman/models.dart';
import 'package:tut_app/presentation/base/base_view_model.dart';
import 'package:tut_app/presentation/resources/asset_manager.dart';
import 'package:tut_app/presentation/resources/strings_manager.dart';

class OnBoardingViewModel extends BaseViewModel with OnBoardingViewModelInput,OnBoardingViewModelOutput{

  StreamController streamController=StreamController<SliderViewObject>();
  late final List<SliderObject> _list;
  int currentIndex=0;

  @override
  void start() {
    _list=_getSliderObject();
    _postDateToView();
  }
  
  @override
  void dispose() {
    streamController.close();
  }

  @override
  int onNext() {
    int nextIndex=++currentIndex;
    if(nextIndex==_list.length){
      nextIndex=0;
    }
    return nextIndex;
  }

  @override
  int onPrevious() {
    int previousIndex=--currentIndex;
    if(previousIndex==-1){
      previousIndex=_list.length-1;
    }
    return previousIndex;
  }

  @override
  void pageChanged(int index) {
    currentIndex=index;
    _postDateToView();
  }

  @override

  Sink get inputSliderViewObject => streamController.sink;

  @override
  Stream <SliderViewObject>get outputSliderViewObject => streamController.stream.map((sliderViewObject) => sliderViewObject);

  List<SliderObject> _getSliderObject() =>[
    SliderObject(StringManager.onBoardingTitle1, StringManager.onBoardingSubTitle1, AssetImages.onBoardingLogo1),
    SliderObject(StringManager.onBoardingTitle2, StringManager.onBoardingSubTitle2, AssetImages.onBoardingLogo2),
    SliderObject(StringManager.onBoardingTitle3, StringManager.onBoardingSubTitle3, AssetImages.onBoardingLogo3),
    SliderObject(StringManager.onBoardingTitle4, StringManager.onBoardingSubTitle4, AssetImages.onBoardingLogo4),
  ];

  void _postDateToView(){
    inputSliderViewObject.add(SliderViewObject(_list[currentIndex], _list.length, currentIndex));
  }
} 
abstract class OnBoardingViewModelInput{
  int onNext();
  int onPrevious();
  void pageChanged(int index);
  Sink get inputSliderViewObject;
}

abstract class OnBoardingViewModelOutput{
  Stream<SliderViewObject> get outputSliderViewObject;
}