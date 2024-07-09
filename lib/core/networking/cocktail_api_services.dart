import 'package:dio/dio.dart';
import 'package:food_recipes_app/core/networking/api_constant.dart';
import 'package:retrofit/http.dart';

part 'cocktail_api_services.g.dart';

@RestApi(baseUrl: ApiConstant.cocktailBaseUrl)
abstract class CocktailApiServices {
  factory CocktailApiServices(Dio dio, {String baseUrl}) = _CocktailApiServices;
}
