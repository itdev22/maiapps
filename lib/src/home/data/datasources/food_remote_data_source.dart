import 'package:dio/dio.dart';
import 'package:maiapps/core/env/http_client.dart';
import 'package:maiapps/core/errors/exceptions.dart';
import 'package:maiapps/core/utils/constants_services.dart';
import 'package:maiapps/src/home/data/models/response/food_model.dart';

abstract class FoodRemoteDataSource {
  const FoodRemoteDataSource();

  Future<FoodModel> getFoodList();
}

class FoodRemoteDataSourceImpl extends FoodRemoteDataSource {
  const FoodRemoteDataSourceImpl();

  @override
  Future<FoodModel> getFoodList() async {
    try {
      final httpClientConfig = HttpClientConfig();

      final response = await httpClientConfig.dio.get(
        ConstantsServices.getItemList,
      );

      if (response.statusCode == 200) {
        final foodList = FoodModel.fromMap(response.data);
        return foodList;
      } else {
        throw ServerException(
          message: response.data['message'] ?? 'Unknown error occurred',
          statusCode: response.statusCode.toString(),
        );
      }
    } on DioException catch (dioError) {
      if (dioError.response != null) {
        throw ServerException(
          message:
              dioError.response!.data['message'] ?? 'Unknown error occurred',
          statusCode: dioError.response!.statusCode.toString(),
        );
      } else {
        throw ServerException(
          message: dioError.message.toString(),
          statusCode: '505',
        );
      }
    } catch (e) {
      print(e.toString());
      throw ServerException(
        message: e.toString(),
        statusCode: '505',
      );
    }
  }
}
