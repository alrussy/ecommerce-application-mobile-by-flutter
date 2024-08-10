class Address extends Object {
    int? id;
    String? countryCode;
    String? city;
    String? line1;
    String? line2;
    String? other;
    int? userId;

    Address({this.id, this.countryCode, this.city, this.line1, this.line2, this.other, this.userId});

    Address.fromJson(Map<String, dynamic> json) {
        id = json["id"];
        countryCode = json["country_code"];
        city = json["city"];
        line1 = json["line1"];
        line2 = json["line2"];
        other = json["other"];
        userId = json["userId"];
    }

    static List<Address> fromList(List<dynamic> list) {
        return list.map((map) => Address.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["id"] = id;
        _data["country_code"] = countryCode;
        _data["city"] = city;
        _data["line1"] = line1;
        _data["line2"] = line2;
        _data["other"] = other;
        _data["userId"] = userId;
        return _data;
    }

@override
      String toString() {
    return "$city - $line1 ";
  }
}

