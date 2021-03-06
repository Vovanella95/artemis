import 'package:artemis/generator/data.dart';
import 'package:test/test.dart';

import '../../helpers.dart';

void main() {
  group('On AST schema', () {
    test(
      'Field was not found on mutation',
      () async => testGenerator(
        query: query,
        schema: r'''
          schema {
            mutation: MutationRoot
          }

          input CreateThingInput {
            clientId: ID!
            message: String
          }

          type Thing {
            id: ID!
            message: String
          }

          type CreateThingResponse {
            thing: Thing
          }

          type MutationRoot {
            createThing(input: CreateThingInput): CreateThingResponse
          }
        ''',
        libraryDefinition: libraryDefinition,
        generatedFile: generatedFile,
      ),
    );
  });
}

const query = r'''
mutation createThing($createThingInput: CreateThingInput) {
  createThing(input: $createThingInput) {
    thing {
      id
      message
    }
  }
}
''';

final LibraryDefinition libraryDefinition =
    LibraryDefinition(basename: r'query.graphql', queries: [
  QueryDefinition(
      queryName: r'createThing',
      queryType: r'CreateThing$MutationRoot',
      classes: [
        ClassDefinition(
            name: r'CreateThing$MutationRoot$CreateThingResponse$Thing',
            properties: [
              ClassProperty(
                  type: r'String',
                  name: r'id',
                  isOverride: false,
                  isNonNull: true,
                  isResolveType: false),
              ClassProperty(
                  type: r'String',
                  name: r'message',
                  isOverride: false,
                  isNonNull: false,
                  isResolveType: false)
            ],
            factoryPossibilities: {},
            typeNameField: r'__typename',
            isInput: false),
        ClassDefinition(
            name: r'CreateThing$MutationRoot$CreateThingResponse',
            properties: [
              ClassProperty(
                  type: r'CreateThing$MutationRoot$CreateThingResponse$Thing',
                  name: r'thing',
                  isOverride: false,
                  isNonNull: false,
                  isResolveType: false)
            ],
            factoryPossibilities: {},
            typeNameField: r'__typename',
            isInput: false),
        ClassDefinition(
            name: r'CreateThing$MutationRoot',
            properties: [
              ClassProperty(
                  type: r'CreateThing$MutationRoot$CreateThingResponse',
                  name: r'createThing',
                  isOverride: false,
                  isNonNull: false,
                  isResolveType: false)
            ],
            factoryPossibilities: {},
            typeNameField: r'__typename',
            isInput: false),
        ClassDefinition(
            name: r'CreateThing$CreateThingInput',
            properties: [
              ClassProperty(
                  type: r'String',
                  name: r'clientId',
                  isOverride: false,
                  isNonNull: true,
                  isResolveType: false),
              ClassProperty(
                  type: r'String',
                  name: r'message',
                  isOverride: false,
                  isNonNull: false,
                  isResolveType: false)
            ],
            factoryPossibilities: {},
            typeNameField: r'__typename',
            isInput: true)
      ],
      inputs: [
        QueryInput(
            type: r'CreateThing$CreateThingInput',
            name: r'createThingInput',
            isNonNull: false)
      ],
      generateHelpers: false,
      suffix: r'Mutation')
]);

const generatedFile = r'''// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:meta/meta.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'query.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class CreateThing$MutationRoot$CreateThingResponse$Thing with EquatableMixin {
  CreateThing$MutationRoot$CreateThingResponse$Thing();

  factory CreateThing$MutationRoot$CreateThingResponse$Thing.fromJson(
          Map<String, dynamic> json) =>
      _$CreateThing$MutationRoot$CreateThingResponse$ThingFromJson(json);

  String id;

  String message;

  @override
  List<Object> get props => [id, message];
  Map<String, dynamic> toJson() =>
      _$CreateThing$MutationRoot$CreateThingResponse$ThingToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateThing$MutationRoot$CreateThingResponse with EquatableMixin {
  CreateThing$MutationRoot$CreateThingResponse();

  factory CreateThing$MutationRoot$CreateThingResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CreateThing$MutationRoot$CreateThingResponseFromJson(json);

  CreateThing$MutationRoot$CreateThingResponse$Thing thing;

  @override
  List<Object> get props => [thing];
  Map<String, dynamic> toJson() =>
      _$CreateThing$MutationRoot$CreateThingResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateThing$MutationRoot with EquatableMixin {
  CreateThing$MutationRoot();

  factory CreateThing$MutationRoot.fromJson(Map<String, dynamic> json) =>
      _$CreateThing$MutationRootFromJson(json);

  CreateThing$MutationRoot$CreateThingResponse createThing;

  @override
  List<Object> get props => [createThing];
  Map<String, dynamic> toJson() => _$CreateThing$MutationRootToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateThing$CreateThingInput with EquatableMixin {
  CreateThing$CreateThingInput({@required this.clientId, this.message});

  factory CreateThing$CreateThingInput.fromJson(Map<String, dynamic> json) =>
      _$CreateThing$CreateThingInputFromJson(json);

  String clientId;

  String message;

  @override
  List<Object> get props => [clientId, message];
  Map<String, dynamic> toJson() => _$CreateThing$CreateThingInputToJson(this);
}
''';
