//
//  File.swift
//  
//
//  Created by Milos Dimic on 08.09.23.
//

import Foundation

enum PostMapper {

    typealias Model = PostModel
    typealias APIModel = PostAPIModel
    typealias DBModel = PostDBModel
}

// MARK: - PresentationMapperProtocol

extension PostMapper: PresentationMapperProtocol {

    static func toPresentationModel(from apiModel: APIModel) throws -> Model {
        .init(id: apiModel.id, title: apiModel.title, body: apiModel.body)
    }
}

// MARK: - DatabaseMapperProtocol

extension PostMapper: DatabaseMapperProtocol {
    
    static func toDatabaseModel(from model: Model) throws -> DBModel {
        .init(id: model.id, title: model.title, body: model.body)
    }
    
    static func toPresentationModel(from dbModel: DBModel) throws -> Model {
        .init(id: dbModel.id, title: dbModel.title, body: dbModel.body)
    }
}

// MARK: - DatabaseConvertible

extension PostModel: DatabaseConvertible {

    public var asDatabaseModel: PostDBModel {
        get throws {
            try PostMapper.toDatabaseModel(from: self)
        }
    }
}

// MARK: - PresentationConvertible

extension PostAPIModel: PresentationConvertible {

    public var asPresentationModel: PostModel {
        get throws {
            try PostMapper.toPresentationModel(from: self)
        }
    }
}

extension PostDBModel: PresentationConvertible {

    public var asPresentationModel: PostModel {
        get throws {
            try PostMapper.toPresentationModel(from: self)
        }
    }
}
