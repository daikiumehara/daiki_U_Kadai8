//
//  SliderPresenter.swift
//  Kadai8
//
//  Created by daiki umehara on 2021/07/10.
//

import Foundation

protocol SliderPresenterProtocol: AnyObject {
    func setView(_ view: SliderView)
    func didChangeSliderValue(_ value: Float)
    func viewWillAppear()
    func viewDidLoad()
}

class SliderPresenter: SliderPresenterProtocol {
    private weak var view: SliderView!
    private let model: ValueModel

    init(model: ValueModel) {
        self.model = model
    }
    
    func setView(_ view: SliderView) {
        self.view = view
    }

    func didChangeSliderValue(_ value: Float) {
        model.changeValue(value)
        view.updateValue(value)
    }

    func viewWillAppear() {
        view.updateValue(model.value)
    }

    func viewDidLoad() {
        view.updateValueSliderRange(range: model.sliderRange)
        view.setRangeAndValue(range: model.sliderRange, value: model.value)
    }
}
