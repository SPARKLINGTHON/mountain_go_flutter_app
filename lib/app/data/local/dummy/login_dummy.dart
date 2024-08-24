import 'dart:convert';

import 'package:myapp/app/data/mountain_metadata.dart';
import 'package:myapp/app/data/response/mountain_info_response.dart';
import 'package:myapp/app/data/source/login_data_source.dart';

class LoginDummy implements LoginDataSource {
  @override
  Future<MountainInfoResponse> getMountainInfo() async {
    Map<String, dynamic> result = await asyncMountainList();

    return Future(() => MountainInfoResponse(
          type: "SUCCESS",
          errorMessage: null,
          result: MountainInfoResult.fromJson(result),
        ));
  }

  Future<Map<String, dynamic>> asyncMountainList() async {
    return json.decode(dummyData);
  }

  String dummyData = '''
{
  "type": "success",
  "errorMessage": "",
  "result": [
    {
      "name": "Mount Everest",
      "level": 5,
      "conquerDate": "2024-08-24T10:30:00.000Z",
      "conquered": 1
    },
    {
      "name": "K2",
      "level": 5,
      "conquerDate": null,
      "conquered": 0
    },
    {
      "name": "Mount Kilimanjaro",
      "level": 4,
      "conquerDate": null,
      "conquered": 0
    },
    {
      "name": "Denali",
      "level": 5,
      "conquerDate": null,
      "conquered": 0
    },
    {
      "name": "Mount Fuji",
      "level": 3,
      "conquerDate": null,
      "conquered": 0
    },
    {
      "name": "Mont Blanc",
      "level": 4,
      "conquerDate": null,
      "conquered": 0
    }
  ]
}
''';
}
