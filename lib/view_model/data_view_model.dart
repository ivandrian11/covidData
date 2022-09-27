import 'package:data_covid/model/data.dart';
import 'package:data_covid/model/data_service.dart';
import 'package:get/get.dart';

import '../model/api_response.dart';

class DataViewModel extends GetxController {
  DataViewModel() {
    fetchData();
  }

  final _isTrackerOn = true.obs;
  get isTrackerOn => _isTrackerOn;
  void switchTrackOn() => _isTrackerOn.value = true;
  void switchTrackOff() => _isTrackerOn.value = false;

  final _apiResponse = ApiResponse.initial('Empty data').obs;
  get response => _apiResponse;

  final _dropdownValue = "DKI JAKARTA".obs;
  get dropwdownValue => _dropdownValue;

  set dropwdownValue(newValue) => _dropdownValue.value = newValue;

  int getIndexByValue() => _province.indexOf(_dropdownValue.value);

  final _province = <String>[];
  get province => _province;

  final _confirmed = <int>[];
  get confirmed => _confirmed;

  final _active = <int>[];
  get active => _active;

  final _recovered = <int>[];
  get recovered => _recovered;

  final _deceased = <int>[];
  get deceased => _deceased;

  void fetchData() async {
    _apiResponse.value = ApiResponse.loading('Fetching artist data');

    try {
      List results = await DataService.getResponse(
        'https://apicovid19indonesia-v2.vercel.app/api/indonesia/provinsi',
      );
      for (var json in results) {
        province.add(Data.fromJson(json).provinsi);
        confirmed.add(Data.fromJson(json).kasus);
        active.add(Data.fromJson(json).dirawat);
        recovered.add(Data.fromJson(json).sembuh);
        deceased.add(Data.fromJson(json).meninggal);
      }
      _apiResponse.value = ApiResponse.completed(province);
    } catch (e) {
      _apiResponse.value = ApiResponse.error(e.toString());
    }
  }
}
