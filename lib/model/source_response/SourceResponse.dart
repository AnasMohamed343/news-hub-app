import 'Source.dart';

class SourceResponse {
  SourceResponse({
    this.status,
    this.sources,
    this.code,
    this.message,
  });

  SourceResponse.fromJson(dynamic json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    if (json['sources'] != null) {
      sources = [];
      json['sources'].forEach((v) {
        sources?.add(Source.fromJson(v));
      });
    }
  }
  String? status;
  String? code;
  String? message;
  List<Source>? sources;
  SourceResponse copyWith({
    String? status,
    List<Source>? sources,
  }) =>
      SourceResponse(
        status: status ?? this.status,
        sources: sources ?? this.sources,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (sources != null) {
      map['sources'] = sources?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
