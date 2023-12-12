// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
part 'concession_request_model.g.dart';

@JsonSerializable()
class ConcessionRequestModel {
  @JsonKey(name: "passNum")
  int? passNum;
  @JsonKey(name: "status")
  final String status;
  @JsonKey(name: "statusMessage")
  final String statusMessage;
  @JsonKey(name: "time")
  final Timestamp time;
  @JsonKey(name: "uid")
  final String uid;

  ConcessionRequestModel({
    this.passNum,
    required this.status,
    required this.statusMessage,
    required this.time,
    required this.uid,
  });

  factory ConcessionRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ConcessionRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$ConcessionRequestModelToJson(this);
}
