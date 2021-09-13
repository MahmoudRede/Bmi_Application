class Model{

    String ?STRTitle;
    String ?STRDescription;
    String ?RequestType_Name;
    String ?STRTypeIndDisplay;


   Model.formJson(Map<String,dynamic> json){

     STRTitle=json['STRTitle'];
     STRDescription=json['STRDescription'];
     RequestType_Name=json['RequestType_Name'];
     STRTypeIndDisplay=json['STRTypeIndDisplay'];

   }

}
