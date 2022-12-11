class SliderObject{
  String title;
  String subTitle;
  String image;
  SliderObject(this.title,this.subTitle,this.image);
}

class SliderViewObject{
  SliderObject sliderObject;
  int numOfSlider;
  int currentIndex;
  SliderViewObject(this.sliderObject,this.numOfSlider,this.currentIndex);
}