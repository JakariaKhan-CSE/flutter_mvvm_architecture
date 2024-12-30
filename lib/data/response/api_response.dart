//In Dart, the <T> in a class declaration represents a generic type parameter. It allows you to create classes, methods, or functions that can work with different data types while maintaining type safety.
import 'package:mvvm_architecture/data/response/status.dart';

class ApiResponse<T>{
 Status? status;
 T? data;
 String? message;

 ApiResponse(this.status, this.data, this.message);

 ApiResponse.loading(): status = Status.LOADING;

 ApiResponse.completed(): status = Status.COMPLETED;

 ApiResponse.error(): status = Status.ERROR;

 @override
 String toString(){
   return "Status: $status \n Message: $message \n Data: $data";
 }

}