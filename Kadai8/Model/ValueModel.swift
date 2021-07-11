//
//  ValueModel.swift
//  Kadai8
//
//  Created by daiki umehara on 2021/07/10.
//

import Foundation

final class ValueModel {
    private(set) var value: Float = 0.0
    let sliderRange: ClosedRange<Float> = 0.0...1.0

    func changeValue(_ value: Float) {
        self.value = value
    }
}
