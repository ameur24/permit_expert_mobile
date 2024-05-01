import 'package:get/get.dart';
import 'package:test2/data/repository/notification_repo.dart';
import 'package:test2/models/notification_model.dart';

class NotificationController extends GetxController{
final NotificationRepo  notificationRepo;
NotificationController({required this.notificationRepo});
List<NotificationModel> _NotificationList=[];
List<dynamic>  get NotificationList => _NotificationList;

@override
onInit(){
  getNotificationList();
}
 Future<void> getNotificationList() async{
    var response = await notificationRepo.getNotificationList();
    if(response.statusCode==200){
response.body. foreach((e)=>
_NotificationList.add(NotificationModel.fromJson(e))
) ; //  _NotificationList.addAll();
       //update();
    }else{

    }
 }
}