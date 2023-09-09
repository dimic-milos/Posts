//
//  File.swift
//  
//
//  Created by Milos Dimic on 09.09.23.
//

import Foundation

enum CommentMapper {

    typealias Model = CommentModel
    typealias APIModel = CommentAPIModel
}

// MARK: - PresentationMapperProtocol

extension CommentMapper: PresentationMapperProtocol {

    static func toPresentationModel(from apiModel: APIModel) throws -> Model {
        .init(email: apiModel.email, title: apiModel.name, comment: apiModel.body)
    }
}

// MARK: - PresentationConvertible

extension CommentAPIModel: PresentationConvertible {

    public var asPresentationModel: CommentModel {
        get throws {
            try CommentMapper.toPresentationModel(from: self)
        }
    }
}
