import 'package:chopper/chopper.dart';
import 'package:pando_app/Utils/GlobalDetails.dart';
part 'Api.chopper.dart';

@ChopperApi(baseUrl: "https://development1.pandostaging.in/")
abstract class Api extends ChopperService {
  //AUTH - LOGIN
  @Put(path: "api/login")
  Future<Response> getLogin(@Body() dynamic body);


  //COMMON - CITY LIST
  @Get(path: 'api/order/filter')
  Future<Response> getOrderList(
      {@Query('category') int category,
        @Query('page') int page,
        @Query('depot_id') String depot_id});

  static Api create() {
    final client = ChopperClient(
      services: [
        _$Api(),
      ],
      interceptors: [
        HttpLoggingInterceptor(),
        HeadersInterceptor(GlobalDetails.getInstance().auth != null
            ? {
                'Content-type': 'application/json',
                'Accept': 'application/json',
                'Authorization': 'Bearer ' + GlobalDetails.getInstance().auth,

              }
            : {
                'Content-type': 'application/json',
                'Accept': 'application/json',
              })
      ],
    );
    return _$Api(client);
  }
}
