//
//  ModelLocator.swift
//  Kadai8
//
//  Created by akio0911 on 2021/07/11.
//

import Foundation

final class ModelLocator {
    let valueModel = ValueModel()

    static let shared = ModelLocator()
    private init() {}
}
