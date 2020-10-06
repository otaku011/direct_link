import 'dart:convert';

import 'package:direct_link/actions/parse.dart';
import 'package:direct_link/models/site_model.dart';
import 'package:requests/requests.dart';

Future<List<SiteModel>> youtube(String url) async {
  List<SiteModel> result = [];
  Parse parse = Parse();

  var r = await Requests.get(url); // get data from url
  r.raiseForStatus();

  try {
    var content = r.content().replaceAll("\\\"", "\"");
    content = content.replaceAll("\\\\", "");
    content = content.replaceAll("\\\/", "/");
    content = content.replaceAll("\"\"", "\"");
    content = content.replaceAll("\\\\u0026", "&");
    content = parse.replace(content, "Y29kZWNzPSI=", "Y29kZWNzPQ==");

    var start = parse.indexOf(content, "InN0cmVhbWluZ0RhdGEiOg==");
    var end = parse.indexOf(content, "LCJwbGF5YmFja1RyYWNraW5nIg==");

    content = '{' + content.substring(start, end) + '}';
    var data = json.decode(content.toString());
    data = data[parse.decode("c3RyZWFtaW5nRGF0YQ==")];

    for (var item in data[parse.decode("Zm9ybWF0cw==")]) {
      var label = parse.decode("cXVhbGl0eUxhYmVs");
      var url = parse.decode("dXJs");

      if (item[label] != null || item[url] != null)
        result
            .add(SiteModel(quality: item[label], link: item[url])); // add data
    }
    return result; // return data
  } catch (_) {
    return null;
  }
}
