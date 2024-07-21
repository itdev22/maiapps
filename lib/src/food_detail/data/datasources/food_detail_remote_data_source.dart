import 'package:dio/dio.dart';
import 'package:maiapps/core/env/http_client.dart';
import 'package:maiapps/core/errors/exceptions.dart';
import 'package:maiapps/core/utils/constants_services.dart';
import 'package:maiapps/src/food_detail/data/models/body/food_detail_body.dart';
import 'package:maiapps/src/food_detail/data/models/response/food_detail_model.dart';

abstract class FoodDetailRemoteDataSource {
  const FoodDetailRemoteDataSource();

  Future<FoodDetailModel> getFoodDetail({
    required String? id,
  });
}

class FoodDetailRemoteDataSourceImpl extends FoodDetailRemoteDataSource {
  const FoodDetailRemoteDataSourceImpl();

  @override
  Future<FoodDetailModel> getFoodDetail({required String? id}) async {
    try {
      final foodDetailBody = FoodDetailBody(id: id ?? '');

      final httpClientConfig = HttpClientConfig();

      final response = await httpClientConfig.dio.get(
        ConstantsServices.getItemDetail + '${foodDetailBody.id}',
      );

      if (response.statusCode == 200) {
        final foodList = FoodDetailModel.fromMap(response.data);
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
      print('Error Nya apa : $e');
      throw ServerException(
        message: e.toString(),
        statusCode: '505',
      );
    }
  }
}
