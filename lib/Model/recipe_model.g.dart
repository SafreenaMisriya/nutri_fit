// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecipeModelAdapter extends TypeAdapter<RecipeModel> {
  @override
  final int typeId = 1;

  @override
  RecipeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RecipeModel(
      label: fields[0] as String,
      image: fields[1] as String,
      url: fields[2] as String,
      shareAs: fields[3] as String,
      calories: fields[4] as double,
      dietLabels: (fields[5] as List).cast<String>(),
      healthLabels: (fields[6] as List).cast<String>(),
      mealType: (fields[7] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, RecipeModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.label)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.url)
      ..writeByte(3)
      ..write(obj.shareAs)
      ..writeByte(4)
      ..write(obj.calories)
      ..writeByte(5)
      ..write(obj.dietLabels)
      ..writeByte(6)
      ..write(obj.healthLabels)
      ..writeByte(7)
      ..write(obj.mealType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecipeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
