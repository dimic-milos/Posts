//
//  File.swift
//  
//
//  Created by Milos Dimic on 08.09.23.
//

public protocol PresentationMapperProtocol {

    associatedtype Model
    associatedtype APIModel

    static func toPresentationModel(from apiModel: APIModel) throws -> Model
}

public protocol PresentationConvertible {

    associatedtype Model
    var asPresentationModel: Model { get throws }
}

