import 'package:flutter_shop/modules/loginmodel.dart';

abstract class Appstates {

}

class initstate extends Appstates{

}

class changeicon extends Appstates{

}

class Loadingloginstate extends Appstates{

}

class Succesloginstate extends Appstates{
  late Loginmodel model;
  Succesloginstate(
      this.model
      );
}

class Errorloginstate extends Appstates{

  late String error;

  Errorloginstate(this.error);

}

class Chnagebottomnavigtor extends Appstates{


}

class Loadingloginstateshop extends Appstates{

}

class Succesloginstateshop extends Appstates {

}

class Errorloginstateshop extends Appstates{



}

class LoadingCategoriesshop extends Appstates{

}

class SuccesCategoriesshop extends Appstates {

}

class ErrorCategoriesshop extends Appstates{


}


class LoadingFavoritessshop extends Appstates{

}

class SuccesFavoritesshop extends Appstates {

}

class Favoritesshop extends Appstates {

}

class LoadingSetting extends Appstates{

}

class SuccesSetting extends Appstates {

}

