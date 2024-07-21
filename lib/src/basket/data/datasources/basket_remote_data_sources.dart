import 'package:dio/dio.dart';
import 'package:maiapps/core/env/http_client.dart';
import 'package:maiapps/core/errors/exceptions.dart';
import 'package:maiapps/core/utils/constants_services.dart';
import 'package:maiapps/src/basket/data/models/response/basket_model.dart';

abstract class BasketRemoteDataSource {
  const BasketRemoteDataSource();

  Future<BasketModel> getBasketList();
}

class BasketRemoteDataSourceImpl extends BasketRemoteDataSource {
  @override
  Future<BasketModel> getBasketList() async {
    try {
      final httpClientConfig = HttpClientConfig();

      final response = await httpClientConfig.dio.get(
        ConstantsServices.getBasketList,
      );

      if (response.statusCode == 200) {
        final basketList = BasketModel.fromMap(response.data);
        return basketList;
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
