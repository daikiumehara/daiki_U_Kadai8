//
//  FirstModel.swift
//  Kadai8
//
//  Created by daiki umehara on 2021/07/10.
//

import Foundation

final class SliderModel {
    private(set) var value: Float = 0.0
    private(set) var sliderRange: ClosedRange<Float> = 0.0...1.0
    static let shered = SliderModel()
    private init() {}

    func changeValue(_ value: Float) {
        self.value = value
    }
}
