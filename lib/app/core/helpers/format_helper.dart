class FormatHelper {
  static valueToStringList(dynamic value) {
    List<String> list = [];
    var valueList = value as List;
    for (var e in valueList) {
      list.add(e);
    }
    return list;
  }
}
