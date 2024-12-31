import 'package:mvvm_architecture/data/network/BaseApiServices.dart';
import 'package:mvvm_architecture/data/network/NetworkApiServices.dart';
import 'package:mvvm_architecture/res/app_url.dart';

// this is the main benefits of mvvm not write entire helper code only write single line code
class AuthRepository{
  BaseApiServices _apiServices = NetworkApiServices();
// dynamic means mix of (various data type) int, float, bool and any others data types
  Future<dynamic> loginApi(dynamic data)async{
    try{
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.loginEndPoint, data);
      return response;
    }catch(e){
      throw e;
    }
  }

  // register
  Future<dynamic> registerApi(dynamic data)async{
    try{
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.loginEndPoint, data);
      return response;
    }catch(e){
      throw e;
    }
  }

  // without using mvvm write entire code every time
/*
 @override
  Future getPostApiResponse(String url, dynamic data) async{
    dynamic responseJson;
    try{
      // 5 second timeout set korsi
      final response = await http.post(Uri.parse(url),
      body: data  // this data send to backend via body
      ).timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    }on SocketException{
      // FetchDataException this class already i create in api_response.dart file
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

 dynamic returnResponse(http.Response response){
    switch(response.statusCode){
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 500:
      case 404:
        throw UnauthorizedException(response.body.toString());
      default:
        throw FetchDataException('Error Occurred when communicating with server '+
        'with Status Code: ' + response.statusCode.toString());
    }
  }
 */
}