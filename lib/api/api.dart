import 'package:untitled3/domain/address.dart';
import 'package:dio/dio.dart';

class AddressApi {
  final String domain = 'https://brasilapi.com.br';
  final dio = Dio();

  Future<Address> findAddressByCep(String cep) async {
    final response = await dio.get('$domain/api/cep/v2/$cep');
    Address address = Address.fromJson(response.data);

    print(response);
    return address;

    <manifest ...
    <application ...
    <meta-data android:name="com.google.android.geo.API_KEY"
    android:value="AIzaSyCaZJAlH2GIFrnMoNpv7gRp6YJX9QleFfY"/>
  }
}