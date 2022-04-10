// To parse this JSON data, do
//
//     final userLoginModal = userLoginModalFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

UserLoginModal userLoginModalFromJson(String str) =>
    UserLoginModal.fromJson(json.decode(str));

String userLoginModalToJson(UserLoginModal data) => json.encode(data.toJson());

class UserLoginModal {
  UserLoginModal({
    required this.code,
    required this.status,
    required this.message,
    required this.data,
  });

  String code;
  String status;
  String message;
  UserLoginModalData data;

  factory UserLoginModal.fromJson(Map<String, dynamic> json) => UserLoginModal(
        code: json["code"],
        status: json["status"],
        message: json["message"],
        data: UserLoginModalData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class UserLoginModalData {
  UserLoginModalData({
    required this.data,
    required this.permissions,
    required this.settings,
  });

  DataData data;
  Permissions permissions;
  List<Setting> settings;

  factory UserLoginModalData.fromJson(Map<String, dynamic> json) =>
      UserLoginModalData(
        data: DataData.fromJson(json["data"]),
        permissions: Permissions.fromJson(json["permissions"]),
        settings: List<Setting>.from(
            json["settings"].map((x) => Setting.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "permissions": permissions.toJson(),
        "settings": List<dynamic>.from(settings.map((x) => x.toJson())),
      };
}

class DataData {
  DataData({
    required this.id,
    required this.uniqueId,
    required this.name,
    required this.userCode,
    required this.email,
    required this.password,
    required this.mobile,
    required this.isActive,
    required this.deletedAt,
    required this.token,
    required this.createdAt,
    required this.updatedAt,
    required this.roleMasterId,
    required this.wareHouseId,
    required this.reportingHeadId,
    required this.roleMaster,
    required this.warehouses,
  });

  int id;
  String uniqueId;
  String name;
  dynamic userCode;
  String email;
  dynamic password;
  String mobile;
  bool isActive;
  dynamic deletedAt;
  String token;
  DateTime createdAt;
  DateTime updatedAt;
  int roleMasterId;
  dynamic wareHouseId;
  dynamic reportingHeadId;
  RoleMaster roleMaster;
  dynamic warehouses;

  factory DataData.fromJson(Map<String, dynamic> json) => DataData(
        id: json["id"],
        uniqueId: json["unique_id"],
        name: json["name"],
        userCode: json["user_code"],
        email: json["email"],
        password: json["password"],
        mobile: json["mobile"],
        isActive: json["is_active"],
        deletedAt: json["deleted_at"],
        token: json["token"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        roleMasterId: json["roleMasterId"],
        wareHouseId: json["wareHouseId"],
        reportingHeadId: json["reportingHeadId"],
        roleMaster: RoleMaster.fromJson(json["role_master"]),
        warehouses: json["warehouses"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "unique_id": uniqueId,
        "name": name,
        "user_code": userCode,
        "email": email,
        "password": password,
        "mobile": mobile,
        "is_active": isActive,
        "deleted_at": deletedAt,
        "token": token,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "roleMasterId": roleMasterId,
        "wareHouseId": wareHouseId,
        "reportingHeadId": reportingHeadId,
        "role_master": roleMaster.toJson(),
        "warehouses": warehouses,
      };
}

class RoleMaster {
  RoleMaster({
    required this.id,
    required this.roleName,
    required this.roleDescription,
    required this.createdBy,
    required this.updatedBy,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String roleName;
  String roleDescription;
  int createdBy;
  int updatedBy;
  bool isActive;
  DateTime createdAt;
  DateTime updatedAt;

  factory RoleMaster.fromJson(Map<String, dynamic> json) => RoleMaster(
        id: json["id"],
        roleName: json["role_name"],
        roleDescription: json["role_description"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        isActive: json["is_active"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "role_name": roleName,
        "role_description": roleDescription,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "is_active": isActive,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}

class Permissions {
  Permissions();

  factory Permissions.fromJson(Map<String, dynamic> json) => Permissions();

  Map<String, dynamic> toJson() => {};
}

class Setting {
  Setting({
    required this.key,
    required this.value,
  });

  String key;
  String value;

  factory Setting.fromJson(Map<String, dynamic> json) => Setting(
        key: json["key"],
        value: json["value"] == null ? null : json["value"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "value": value == null ? null : value,
      };
}
