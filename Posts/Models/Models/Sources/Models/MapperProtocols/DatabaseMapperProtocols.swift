//
//  File.swift
//  
//
//  Created by Milos Dimic on 08.09.23.
//

public protocol DatabaseMapperProtocol {

    associatedtype Model
    associatedtype DBModel

    static func toDatabaseModel(from model: Model) throws -> DBModel
    static func toPresentationModel(from dbModel: DBModel) throws -> Model
}

public protocol DatabaseConvertible {

    associatedtype DBModel
    var asDatabaseModel: DBModel { get throws }
}

