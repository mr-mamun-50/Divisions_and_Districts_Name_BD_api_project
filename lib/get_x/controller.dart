import 'package:get/get.dart';

import 'division_model.dart';
import 'repository.dart';

class ControllerClass extends GetxController {
  var divListvar = List<DivisionModel>.empty().obs;
  var isLoadingDivs = true.obs;

  void fatchDivsData() async {
    print("Calling Divs");

    try {
      isLoadingDivs(true);

      var divData = await divList.getDivision();

      if (divData != null) {
        divListvar.value = divData;
      }
    } finally {
      isLoadingDivs(false);
    }
  }
}
