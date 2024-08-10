import 'dart:ffi';
import 'dart:math';

import 'package:get/get.dart';
import 'package:r_store/const/list_card.dart';
import 'package:r_store/const/package_const.dart';
import 'package:r_store/controller/cart-controller.dart';
import 'package:r_store/model/cart.dart';
import 'package:r_store/model/sku-product.dart';
import 'package:r_store/model/inventory.dart';
import 'package:r_store/model/product_model/product.dart';
import 'package:r_store/service/sku_service.dart';

class ProductDetailsController extends GetxController {
  RxInt indexCurrent = 0.obs;
  List<int> indexstoreY = [];
  int? indexstore2;
  bool isContain = false;
  List<Details> selectDetails = List.empty(growable: true);
  final Product product = Get.arguments;
  RxBool loading = RxBool(true);
  final _skuService = SkuProductService();
  RxList<DetailsView> detailsView = RxList.empty(growable: true);
  RxList<DetailsView> detailsbase = RxList.empty(growable: true);
  List<Details> listSelected = List.empty(growable: true);
  List<Details> listSingleDetails = List.empty(growable: true);
  List<SkuProduct> detailsResponses = [];
  SkuProduct? skuProductForCart;
  CartController cartController = Get.find();

  setIndex(index) {
    indexCurrent.value = index;
  }

  getDetails(productId) async {
    detailsResponses = await _skuService.getSkuByproduct(productId);

    detailsView.value =
        DetailsView.convertDetailsToDetailsView(detailsResponses);

    loading.value = false;
  }

  selected(int indexSelextedY, int indexSelextedX) {
    restDetailsList();
    List<Details> listShow = List.empty(growable: true);

    Details detailSelected =
        detailsView[indexSelextedY].values![indexSelextedX];
    detailSelected.isSelected = !detailSelected.isSelected!;
    if (detailSelected.isSelected!) {
      listSelected.add(detailSelected);
    } else {
      listSelected.remove(detailSelected);
    }
    detailsView[indexSelextedY].values!.forEach((element) {
      if (element != detailSelected && !listSingleDetails.contains(element)) {
        element.isSelected = false;
        listSelected.remove(element);
      }
    });
    indexstoreY.add(indexSelextedY);
    listShow.add(detailSelected);
    print(listSelected);
    detailsResponses.forEach((element) {
      if (listSelected.isNotEmpty &&
          listSelected.containsAll(element.details!)) {
        print(element.details);
        skuProductForCart = element;
      }
    });

    // if (skuProductForCart != null) {
    //   print("ok : ${skuProductForCart.toString()}");
    // } else {
    //   Get.defaultDialog(
    //     title: "Error",
    //     middleText: "the item not Avalibale",
    //   );
    //   detailSelected.isSelected = false;
    // }

    update();
  }

  addToListCart() {
    if (listSelected.length + listSingleDetails.length < detailsView.length) {
      Get.defaultDialog(
          title: "Error ..!",
          middleText: "there details no selected......... ");
    } else if (skuProductForCart != null) {
      Cart cart =
          Cart(product: product, skuProduct: skuProductForCart, quentity: 1);
      if (carts.any(
          (element) => element.skuProduct!.sku == skuProductForCart!.sku)) {
        Get.defaultDialog(
            title: "Wirning ..!",
            middleText: "the product in Cart  ......... ");
      } else {
        carts.add(cart);
        cartController.setTotal();

        Get.defaultDialog(
            title: "Successful ..!",
            middleText:
                "add Product to your Cart ... go to Cart for see there ");
      }
    }
  }

  restDetailsList() {
    for (var detailsVeiw in detailsView) {
      for (var detail in detailsVeiw.values!) {
        detail.isShow = true;
      }
    }
  }

  initDetailsList() {
    for (var dv in detailsView) {
      if (dv.values!.length == 1) {
        dv.values!.forEach((e) {
          e.isSelected = true;
          listSingleDetails.add(e);
          listSelected.add(e);
        });
      }
      listSingleDetails.forEach((element) {
        detailsView.remove(element);
      });
    }
  }

  @override
  void onInit() async {
    await getDetails(Get.arguments.id);
    initDetailsList();
    print(listSelected);

    indexstore2 = 0;
    selected(0, 0);
    super.onInit();
  }
}
