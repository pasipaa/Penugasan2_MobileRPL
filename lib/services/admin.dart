import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:semester2_postman/models/toko_models.dart';
import 'package:semester2_postman/models/response_data_list.dart';
import 'package:semester2_postman/models/user_login.dart';
import 'package:semester2_postman/services/url.dart' as url;

class AdminService {
  Future<ResponseDataList<AdminModel>> getAdmin() async {
    try {
      UserLogin userLogin = UserLogin();
      var user = await userLogin.getUserLogin();

      if (user.status == false) {
        return ResponseDataList<AdminModel>(
          status: false,
          message: "Belum login",
          data: [],
        );
      }

      var uri = Uri.parse(url.BaseUrl+"/admin/getbarang");
      Map<String, String> headers = {"Authorization": "Bearer ${user.token}"};

      var response = await http.get(
        uri,
        headers: headers,
      );

      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);

        List<AdminModel> adminList =
            (jsonData["data"] as List)
                .map((e) => AdminModel.fromJson(e))
                .toList();

        return ResponseDataList<AdminModel>(
          status: true,
          message: "Success",
          data: adminList,
        );
      } else {
        return ResponseDataList<AdminModel>(
          status: false,
          message: "Error ${response.statusCode}",
          data: [],
        );
      }
    } catch (e) {
      return ResponseDataList<AdminModel>(
        status: false,
        message: "Error $e",
        data: [],
      );
    }
  }
}
