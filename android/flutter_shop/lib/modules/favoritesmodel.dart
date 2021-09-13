class FavoriteModel{

  bool ?status;
  String ?message;

  FavoriteModel.formJson(Map<String,dynamic> json){

    status=json['status'];
    message=json['message'];

  }

}