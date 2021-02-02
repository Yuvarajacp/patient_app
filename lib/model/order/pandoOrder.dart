
import 'dart:convert';

OrderList orderListFromJson(String str) => OrderList.fromJson(json.decode(str));

String orderListToJson(OrderList data) => json.encode(data.toJson());

class OrderList {
  OrderList({
    this.data,
  });

  List<OrderModel> data;

  factory OrderList.fromJson(Map<String, dynamic> json) => OrderList(
    data: json["data"] == null ? null : List<OrderModel>.from(json["data"].map((x) => OrderModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class OrderModel {
  OrderModel({
    this.id,
    this.status,
    this.orderNumber,
    this.movement,
    this.orderType,
    this.deliveryType,
    this.vehicle,
    //this.baseFrieght,
    this.freightType,
    this.orderIn,
    this.depotId,
    this.hasQuote,
    this.reporTedAt,
    this.createdAt,
    this.updatedAt,
    this.vehicleType,
    this.transporter,
    this.gates,
    this.docks,
    this.consigneeS,
    this.flow,
    this.driver,
    this.lorRyReceipt,
    this.approvalStatus,
  });

  String id;
  int status;
  String orderNumber;
  int movement;
  int orderType;
  String deliveryType;
  Driver vehicle;
  //BaseFrieght baseFrieght;
  int freightType;
  int orderIn;
  String depotId;
  bool hasQuote;
  dynamic reporTedAt;
  DateTime createdAt;
  DateTime updatedAt;
  VehicleType vehicleType;
  Transporter transporter;
  List<Gate> gates;
  List<dynamic> docks;
  List<Consignee> consigneeS;
  Flow flow;
  Driver driver;
  List<dynamic> lorRyReceipt;
  int approvalStatus;

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
    id: json["id"] == null ? null : json["id"],
    status: json["status"] == null ? null : json["status"],
    orderNumber: json["order_number"] == null ? null : json["order_number"],
    movement: json["movement"] == null ? null : json["movement"],
    orderType: json["order_type"] == null ? null : json["order_type"],
    deliveryType: json["delivery_type"] == null ? null : json["delivery_type"],
    vehicle: json["vehicle"] == null ? null : Driver.fromJson(json["vehicle"]),
    //baseFrieght: json["base_frieght"] == null ? null : BaseFrieght.fromJson(json["base_frieght"]),
    freightType: json["freight_type"] == null ? null : json["freight_type"],
    orderIn: json["order_in"] == null ? null : json["order_in"],
    depotId: json["depot_id"] == null ? null : json["depot_id"],
    hasQuote: json["has_quote"] == null ? null : json["has_quote"],
    reporTedAt: json["repor ted_at"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    vehicleType: json[" vehicle_type"] == null ? null : VehicleType.fromJson(json[" vehicle_type"]),
    transporter: json["transporter"] == null ? null : Transporter.fromJson(json["transporter"]),
    gates: json["gates"] == null ? null : List<Gate>.from(json["gates"].map((x) => Gate.fromJson(x))),
    docks: json["docks"] == null ? null : List<dynamic>.from(json["docks"].map((x) => x)),
    consigneeS: json["consignee s"] == null ? null : List<Consignee>.from(json["consignee s"].map((x) => Consignee.fromJson(x))),
    flow: json["flow"] == null ? null : Flow.fromJson(json["flow"]),
    driver: json["driver"] == null ? null : Driver.fromJson(json["driver"]),
    lorRyReceipt: json["lor ry_receipt"] == null ? null : List<dynamic>.from(json["lor ry_receipt"].map((x) => x)),
    approvalStatus: json["approval_status"] == null ? null : json["approval_status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "status": status == null ? null : status,
    "order_number": orderNumber == null ? null : orderNumber,
    "movement": movement == null ? null : movement,
    "order_type": orderType == null ? null : orderType,
    "delivery_type": deliveryType == null ? null : deliveryType,
    "vehicle": vehicle == null ? null : vehicle.toJson(),
    //"base_frieght": baseFrieght == null ? null : baseFrieght.toJson(),
    "freight_type": freightType == null ? null : freightType,
    "order_in": orderIn == null ? null : orderIn,
    "depot_id": depotId == null ? null : depotId,
    "has_quote": hasQuote == null ? null : hasQuote,
    "repor ted_at": reporTedAt,
    "created_at": createdAt == null ? null : createdAt.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
    " vehicle_type": vehicleType == null ? null : vehicleType.toJson(),
    "transporter": transporter == null ? null : transporter.toJson(),
    "gates": gates == null ? null : List<dynamic>.from(gates.map((x) => x.toJson())),
    "docks": docks == null ? null : List<dynamic>.from(docks.map((x) => x)),
    "consignee s": consigneeS == null ? null : List<dynamic>.from(consigneeS.map((x) => x.toJson())),
    "flow": flow == null ? null : flow.toJson(),
    "driver": driver == null ? null : driver.toJson(),
    "lor ry_receipt": lorRyReceipt == null ? null : List<dynamic>.from(lorRyReceipt.map((x) => x)),
    "approval_status": approvalStatus == null ? null : approvalStatus,
  };
}

// class BaseFrieght {
//   BaseFrieght({
//     this.freightCharge,
//     this.freightUnit,
//   });
//
//   int freightCharge;
//   int freightUnit;
//
//   factory BaseFrieght.fromJson(Map<String, dynamic> json) => BaseFrieght(
//     freightCharge: json["freight_charge"] == null ? null : json["freight_charge"],
//     freightUnit: json["freight_unit"] == null ? null : json["freight_unit"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "freight_charge": freightCharge == null ? null : freightCharge,
//     "freight_unit": freightUnit == null ? null : freightUnit,
//   };
// }

class Consignee {
  Consignee({
    this.id,
    this.referenceId,
    this.name,
    this.city,
    this.state,
    this.country,
    this.combine,
    this.region,
    this.category,
    this.optimaCategory,
    this.excluDeVehicles,
    this.createdAt,
    this.updatedAt,
    this.coordinates,
    this.soldTo,
    this.lrAttachmentIds,
    this.podAttachmentIds,
    this.gateId,
    this.expectedDelivery,
    this.consigneeUnloaderAvailable,
    this.paidBy,
    this.unloaderAvailable,
  });

  String id;
  String referenceId;
  String name;
  String city;
  String state;
  String country;
  bool combine;
  String region;
  String category;
  dynamic optimaCategory;
  List<dynamic> excluDeVehicles;
  DateTime createdAt;
  String updatedAt;
  List<double> coordinates;
  SoldTo soldTo;
  List<dynamic> lrAttachmentIds;
  List<dynamic> podAttachmentIds;
  String gateId;
  DateTime expectedDelivery;
  int consigneeUnloaderAvailable;
  int paidBy;
  int unloaderAvailable;

  factory Consignee.fromJson(Map<String, dynamic> json) => Consignee(
    id: json["id"] == null ? null : json["id"],
    referenceId: json["reference_id"] == null ? null : json["reference_id"],
    name: json["name"] == null ? null : json["name"],
    city: json["city"] == null ? null : json["city"],
    state: json["state"] == null ? null : json["state"],
    country: json["country"] == null ? null : json["country"],
    combine: json["combine"] == null ? null : json["combine"],
    region: json["region"] == null ? null : json["region"],
    category: json["category"] == null ? null : json["category"],
    optimaCategory: json["optima_category"],
    excluDeVehicles: json["exclu de_vehicles"] == null ? null : List<dynamic>.from(json["exclu de_vehicles"].map((x) => x)),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : json["updated_at"],
    coordinates: json["coordinates"] == null ? null : List<double>.from(json["coordinates"].map((x) => x.toDouble())),
    soldTo: json["sold_to"] == null ? null : SoldTo.fromJson(json["sold_to"]),
    lrAttachmentIds: json["lr_attachment_ids"] == null ? null : List<dynamic>.from(json["lr_attachment_ids"].map((x) => x)),
    podAttachmentIds: json["pod_attachment_ids"] == null ? null : List<dynamic>.from(json["pod_attachment_ids"].map((x) => x)),
    gateId: json["gate_id"] == null ? null : json["gate_id"],
    expectedDelivery: json["expected_delivery"] == null ? null : DateTime.parse(json["expected_delivery"]),
    consigneeUnloaderAvailable: json["unloader_available "] == null ? null : json["unloader_available "],
    paidBy: json["paid_by"] == null ? null : json["paid_by"],
    unloaderAvailable: json["unloader_available"] == null ? null : json["unloader_available"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "reference_id": referenceId == null ? null : referenceId,
    "name": name == null ? null : name,
    "city": city == null ? null : city,
    "state": state == null ? null : state,
    "country": country == null ? null : country,
    "combine": combine == null ? null : combine,
    "region": region == null ? null : region,
    "category": category == null ? null : category,
    "optima_category": optimaCategory,
    "exclu de_vehicles": excluDeVehicles == null ? null : List<dynamic>.from(excluDeVehicles.map((x) => x)),
    "created_at": createdAt == null ? null : createdAt.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt,
    "coordinates": coordinates == null ? null : List<dynamic>.from(coordinates.map((x) => x)),
    "sold_to": soldTo == null ? null : soldTo.toJson(),
    "lr_attachment_ids": lrAttachmentIds == null ? null : List<dynamic>.from(lrAttachmentIds.map((x) => x)),
    "pod_attachment_ids": podAttachmentIds == null ? null : List<dynamic>.from(podAttachmentIds.map((x) => x)),
    "gate_id": gateId == null ? null : gateId,
    "expected_delivery": expectedDelivery == null ? null : expectedDelivery.toIso8601String(),
    "unloader_available ": consigneeUnloaderAvailable == null ? null : consigneeUnloaderAvailable,
    "paid_by": paidBy == null ? null : paidBy,
    "unloader_available": unloaderAvailable == null ? null : unloaderAvailable,
  };
}

class SoldTo {
  SoldTo({
    this.id,
    this.optimaCategory,
    this.excludeVehicles,
    this.soldToOptimaCategory,
    this.excludEVehicles,
    this.excluDeVehicles,
  });

  String id;
  dynamic optimaCategory;
  List<dynamic> excludeVehicles;
  dynamic soldToOptimaCategory;
  List<dynamic> excludEVehicles;
  List<dynamic> excluDeVehicles;

  factory SoldTo.fromJson(Map<String, dynamic> json) => SoldTo(
    id: json["id"] == null ? null : json["id"],
    optimaCategory: json["optima _category"],
    excludeVehicles: json["exclude_vehicles"] == null ? null : List<dynamic>.from(json["exclude_vehicles"].map((x) => x)),
    soldToOptimaCategory: json["optima_category"],
    excludEVehicles: json["exclud e_vehicles"] == null ? null : List<dynamic>.from(json["exclud e_vehicles"].map((x) => x)),
    excluDeVehicles: json["exclu de_vehicles"] == null ? null : List<dynamic>.from(json["exclu de_vehicles"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "optima _category": optimaCategory,
    "exclude_vehicles": excludeVehicles == null ? null : List<dynamic>.from(excludeVehicles.map((x) => x)),
    "optima_category": soldToOptimaCategory,
    "exclud e_vehicles": excludEVehicles == null ? null : List<dynamic>.from(excludEVehicles.map((x) => x)),
    "exclu de_vehicles": excluDeVehicles == null ? null : List<dynamic>.from(excluDeVehicles.map((x) => x)),
  };
}

class Driver {
  Driver({this.id, this.number});

  String id;
  String number;

  factory Driver.fromJson(Map<String, dynamic> json) => Driver(
    id: json["id"] == null ? null : json["id"],
    number: json["number"] == null ? null : json["number"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "number": number == null ? null : number,
  };
}

class Flow {
  Flow({
    this.inspection,
    this.driverAccepted,
    this.documentationStatus,
    this.simTracking,
    this.changeVehicleTypeId,
  });

  Driver inspection;
  bool driverAccepted;
  DocumentationStatus documentationStatus;
  SimTracking simTracking;
  Driver changeVehicleTypeId;

  factory Flow.fromJson(Map<String, dynamic> json) => Flow(
    inspection: json["inspection"] == null ? null : Driver.fromJson(json["inspection"]),
    driverAccepted: json["driver_accepted"] == null ? null : json["driver_accepted"],
    documentationStatus: json["documentation_status"] == null ? null : DocumentationStatus.fromJson(json["documentation_status"]),
    simTracking: json["sim_tracking"] == null ? null : SimTracking.fromJson(json["sim_tracking"]),
    changeVehicleTypeId: json["change_vehicle_type_id"] == null ? null : Driver.fromJson(json["change_vehicle_type_id"]),
  );

  Map<String, dynamic> toJson() => {
    "inspection": inspection == null ? null : inspection.toJson(),
    "driver_accepted": driverAccepted == null ? null : driverAccepted,
    "documentation_status": documentationStatus == null ? null : documentationStatus.toJson(),
    "sim_tracking": simTracking == null ? null : simTracking.toJson(),
    "change_vehicle_type_id": changeVehicleTypeId == null ? null : changeVehicleTypeId.toJson(),
  };
}

class DocumentationStatus {
  DocumentationStatus({
    this.lorryReceipt,
    this.ewayBill,
    this.materials,
  });

  bool lorryReceipt;
  bool ewayBill;
  bool materials;

  factory DocumentationStatus.fromJson(Map<String, dynamic> json) => DocumentationStatus(
    lorryReceipt: json["lorry_receipt"] == null ? null : json["lorry_receipt"],
    ewayBill: json["eway_bill"] == null ? null : json["eway_bill"],
    materials: json["materials"] == null ? null : json["materials"],
  );

  Map<String, dynamic> toJson() => {
    "lorry_receipt": lorryReceipt == null ? null : lorryReceipt,
    "eway_bill": ewayBill == null ? null : ewayBill,
    "materials": materials == null ? null : materials,
  };
}

class SimTracking {
  SimTracking({
    this.isEnabled,
  });

  bool isEnabled;

  factory SimTracking.fromJson(Map<String, dynamic> json) => SimTracking(
    isEnabled: json["is_enabled"] == null ? null : json["is_enabled"],
  );

  Map<String, dynamic> toJson() => {
    "is_enabled": isEnabled == null ? null : isEnabled,
  };
}

class Gate {
  Gate({
    this.id,
    this.loaderAvailable,
    this.loadingDate,
    this.paidBy,
    this.arrivedAt,
    this.dispatchedAt,
  });

  String id;
  int loaderAvailable;
  String loadingDate;
  int paidBy;
  dynamic arrivedAt;
  dynamic dispatchedAt;

  factory Gate.fromJson(Map<String, dynamic> json) => Gate(
    id: json["id"] == null ? null : json["id"],
    loaderAvailable: json["loader_available"] == null ? null : json["loader_available"],
    loadingDate: json["loading_date"] == null ? null : json["loading_date"],
    paidBy: json["paid_by"] == null ? null : json["paid_by"],
    arrivedAt: json["arrived_at"],
    dispatchedAt: json["dispatched_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "loader_available": loaderAvailable == null ? null : loaderAvailable,
    "loading_date": loadingDate == null ? null : loadingDate,
    "paid_by": paidBy == null ? null : paidBy,
    "arrived_at": arrivedAt,
    "dispatched_at": dispatchedAt,
  };
}

class Transporter {
  Transporter({
    this.id,
    this.name,
  });

  String id;
  String name;

  factory Transporter.fromJson(Map<String, dynamic> json) => Transporter(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
  };
}

class VehicleType {
  VehicleType({
    this.id,
    this.name,
    this.type,
    this.cft,
    this.kg,
  });

  String id;
  String name;
  String type;
  int cft;
  int kg;

  factory VehicleType.fromJson(Map<String, dynamic> json) => VehicleType(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    type: json["type"] == null ? null : json["type"],
    cft: json["cft"] == null ? null : json["cft"],
    kg: json["kg"] == null ? null : json["kg"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "type": type == null ? null : type,
    "cft": cft == null ? null : cft,
    "kg": kg == null ? null : kg,
  };
}