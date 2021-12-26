// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ServiceDataAdapter extends TypeAdapter<ServiceData> {
  @override
  final int typeId = 0;

  @override
  ServiceData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ServiceData(
      fields[0] as int,
      fields[1] as int,
      fields[2] as String,
      fields[3] as String,
      fields[4] as int,
      fields[5] as bool,
      fields[6] as bool,
      fields[7] as int,
      fields[8] as int,
      fields[9] as int,
      fields[10] as String,
      fields[11] as int,
      fields[12] as int,
      fields[13] as String,
      fields[14] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ServiceData obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.serviceId)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.code)
      ..writeByte(4)
      ..write(obj.price)
      ..writeByte(5)
      ..write(obj.isDefault)
      ..writeByte(6)
      ..write(obj.transportCostIncluded)
      ..writeByte(7)
      ..write(obj.qty)
      ..writeByte(8)
      ..write(obj.minQty)
      ..writeByte(9)
      ..write(obj.maxQty)
      ..writeByte(10)
      ..write(obj.description)
      ..writeByte(11)
      ..write(obj.contractorSharePercent)
      ..writeByte(12)
      ..write(obj.unitMeasureId)
      ..writeByte(13)
      ..write(obj.unitMeasureName)
      ..writeByte(14)
      ..write(obj.superContractorsId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ServiceDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
