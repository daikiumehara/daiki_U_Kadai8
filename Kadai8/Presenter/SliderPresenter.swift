//
//  SliderPresenter.swift
//  Kadai8
//
//  Created by daiki umehara on 2021/07/10.
//

import Foundation

protocol Presenter: AnyObject {
    func setView(_ view: View)
    func setSliderValue(_ value: Float)
    func updateView()
}

class SliderPresenter: Presenter {
    private weak var view: View!
    private let model = SliderModel.shered
    
    func setView(_ view: View) {
        self.view = view
        view.setRangeAndValue(range: model.sliderRange, value: model.value)
    }

    func setSliderValue(_ value: Float) {
        model.changeValue(value)
    }

    func updateView() {
        self.view.updateView(model.value)
    }
}
