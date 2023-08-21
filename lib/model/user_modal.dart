class UserModel {
  final id;
  final uuid;
  final uid;
  final image;
  final username;
  final name;
  final phoneNo;
  final password;
  final position;
  final email;
  final emailVerifiedAt;
  final gender;
  final birthOfDate;
  final createdAt;
  final updatedAt;

  UserModel({this.id,
    this.uuid,
    this.uid,
    this.image,
    this.username,
    this.name,
    this.phoneNo,
    this.password,
    this.position,
    this.email,
    this.emailVerifiedAt,
    this.gender,
    this.birthOfDate,
    this.createdAt,
    this.updatedAt});

}

// class ImageLink{

//   image({category}){
//     String image_link;
//     List image = [

//     ];
//     category=='Makanan'?
//     image_link = 'https://firebasestorage.googleapis.com/v0/b/shopper-89651.appspot.com/o/fried_rice.png?alt=media&token=2511425c-164a-42d7-b676-b616fc926979':
//     category=='Minuman'?
//     image_link = 'https://firebasestorage.googleapis.com/v0/b/shopper-89651.appspot.com/o/milk.png?alt=media&token=8dd3cfdf-a441-415c-85b7-d3b913840309' :
//     category=='Pakaian'?
//     image_link = 'https://firebasestorage.googleapis.com/v0/b/shopper-89651.appspot.com/o/clothes_rack.png?alt=media&token=bf6fad09-da39-4424-b3b2-f270b518fabc' :
//     category=='Elektronik'?
//         image_link = 'https://firebasestorage.googleapis.com/v0/b/shopper-89651.appspot.com/o/smart_refrigator.png?alt=media&token=a6e28ed0-1131-4175-b5eb-121539e4f2f0' :
//         image_link = 'https://firebasestorage.googleapis.com/v0/b/shopper-89651.appspot.com/o/folder.png?alt=media&token=68143e2b-9320-433b-8557-7e143a853a5f';
//     return image_link;
//   }
// }