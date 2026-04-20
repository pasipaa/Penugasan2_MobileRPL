import 'dart:convert';
<<<<<<< HEAD
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:semester2_postman/models/response_data_map.dart';
=======
import 'package:http/http.dart' as http;
>>>>>>> fa53fe357573f635c4230936b45c6e1f63f5cb5b
import 'package:semester2_postman/models/toko_models.dart';
import 'package:semester2_postman/models/response_data_list.dart';
import 'package:semester2_postman/models/user_login.dart';
import 'package:semester2_postman/services/url.dart' as url;

class AdminService {
  Future<ResponseDataList<AdminModel>> getAdmin() async {
<<<<<<< HEAD
    UserLogin userLogin = UserLogin();
    var user = await userLogin.getUserLogin();

    if (!user.status) {
      return ResponseDataList(
        status: false,
        message: "Token invalid / belum login",
        data: [],
      );
    }

    var res = await http.get(
      Uri.parse("${url.BaseUrl}/admin/getbarang"),
      headers: {
        "Authorization": "Bearer ${user.token}",
        "Accept": "application/json",
      },
    );

    print("GET STATUS: ${res.statusCode}");
    print("GET BODY: ${res.body}");

    if (res.statusCode == 200) {
      var data = json.decode(res.body);

      if (data["status"]) {
        List<AdminModel> list = (data["data"] as List)
            .map((e) => AdminModel.fromJson(e))
            .toList();

        return ResponseDataList(
          status: true,
          message: "Success",
          data: list,
        );
      } else {
        return ResponseDataList(
          status: false,
          message: data["message"],
          data: [],
        );
      }
    }

    return ResponseDataList(
      status: false,
      message: "Error ${res.statusCode}",
      data: [],
    );
  }

  Future<ResponseDataMap> insertBarang(request, File? image, int? id) async {
    UserLogin userLogin = UserLogin();
    var user = await userLogin.getUserLogin();

    if (!user.status) {
      return ResponseDataMap(
        status: false,
        message: "Token invalid / belum login",
      );
    }

    http.MultipartRequest req;

    if (id == null) {
      req = http.MultipartRequest(
        "POST",
        Uri.parse("${url.BaseUrl}/admin/insertbarang"),
      );
    } else {
      req = http.MultipartRequest(
        "POST",
        Uri.parse("${url.BaseUrl}/admin/updatebarang/$id"),
      );
    }

    req.headers.addAll({
      "Authorization": "Bearer ${user.token}",
    });

    req.fields['nama_barang'] = request["nama_barang"] ?? "";
    req.fields['stok'] = request["stok"].toString();
    req.fields['harga'] = request["harga"].toString();
    req.fields['deskripsi'] = request["deskripsi"] ?? "";

    if (image != null) {
      req.files.add(
        await http.MultipartFile.fromPath("image", image.path),
      );
    }

    var res = await req.send();
    var response = await http.Response.fromStream(res);

    print("INSERT/UPDATE STATUS: ${res.statusCode}");
    print("INSERT/UPDATE BODY: ${response.body}");

    if (res.statusCode == 200) {
      var data = json.decode(response.body);

      return ResponseDataMap(
        status: data["status"],
        message: data["message"] ?? "Berhasil",
      );
    }

    return ResponseDataMap(
      status: false,
      message: "Error ${res.statusCode}",
    );
  }

  Future<ResponseDataMap> deletebarang(int id) async {
    UserLogin userLogin = UserLogin();
    var user = await userLogin.getUserLogin();

    if (!user.status) {
      return ResponseDataMap(
        status: false,
        message: "Token invalid / belum login",
      );
    }

    final uri = Uri.parse("${url.BaseUrl}/admin/hapusbarang/$id");

    var res = await http.delete(
      uri,
      headers: {
        "Authorization": "Bearer ${user.token}",
        "Accept": "application/json",
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "id": id,
      }),
    );

    print("DELETE URL: $uri");
    print("DELETE STATUS: ${res.statusCode}");
    print("DELETE BODY: ${res.body}");

    if (res.statusCode == 200) {
      var data = json.decode(res.body);

      return ResponseDataMap(
        status: data["status"],
        message: data["message"] ?? "Berhasil hapus",
      );
    }

    return ResponseDataMap(
      status: false,
      message: "Error ${res.statusCode}",
    );
  }
}
=======
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
>>>>>>> fa53fe357573f635c4230936b45c6e1f63f5cb5b
