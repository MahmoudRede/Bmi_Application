class CategoriesModel{

  bool ?status;
  CategoriesModelData ?data;

  CategoriesModel.formJson(Map<String,dynamic> json){

    status=json['status'];
    data=CategoriesModelData.formJson(json['data']);
  }

}

class CategoriesModelData{
  int ?current_page;
  List<DataModel> data=[];

  CategoriesModelData.formJson(Map<String,dynamic> json){

    current_page=json['current_page'];
    json['data'].forEach((element){
      data.add(DataModel.formJson(element));
    });
  }

}

class DataModel{

  int ?id;
  String ?name;
  String ?image;

  DataModel.formJson(Map<String,dynamic> json){

    id=json['id'];
    name=json['name'];
    image=json['image'];
  }


}