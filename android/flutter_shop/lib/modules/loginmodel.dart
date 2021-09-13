class Loginmodel{

   late bool status;
   late String message;
   Userdata ?datal;

   Loginmodel.formJson(Map<String,dynamic> json){

     status=json['status'];
     message=json['message'];
     datal=json['data']!=null? Userdata.formJson(json['data']) : null;

   }

}

class Userdata{

  late int id;
  late String name;
  late String email;
  late String phone;
  late String image;
  late int points;
  late int credit;
  late String token;

  Userdata.formJson(Map<String,dynamic> json){

    id=json['id'];
    name=json['name'];
    email=json['email'];
    phone=json['phone'];
    image=json['image'];
    points=json['points'];
    credit=json['credit'];
    token=json['token'];
  }
  }
