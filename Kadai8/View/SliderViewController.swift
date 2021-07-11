//
//  ViewController.swift
//  Kadai8
//
//  Created by daiki umehara on 2021/07/10.
//

import UIKit

protocol SliderView: AnyObject {
    func setRangeAndValue(range: ClosedRange<Float>, value: Float)
    func updateValue(_ value: Float)
    func updateValueSliderRange(range: ClosedRange<Float>)
}

class SliderViewController: UIViewController, SliderView {
    @IBOutlet private var valueLabel: UILabel!
    @IBOutlet private var valueSlider: UISlider!
    private var backgroundColor: UIColor!
    private var presenter: SliderPresenterProtocol!
    private var range: ClosedRange<Float>!
    private var initialValue: Float!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = backgroundColor
        presenter.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewWillAppear()
    }

    func setRangeAndValue(range: ClosedRange<Float>, value: Float) {
        self.range = range
        self.initialValue = value
    }

    func updateValue(_ value: Float) {
        valueSlider.setValue(value, animated: false)
        valueLabel.text = String(value)
    }

    static func instantiate(_ presenter: SliderPresenterProtocol, _ color: UIColor) -> SliderViewController {
        guard let vc = UIStoryboard(name: "SliderViewController", bundle: nil).instantiateInitialViewController() as? SliderViewController else {
            fatalError("ViewControllerが見つかりません")
        }

        vc.presenter = presenter
        presenter.setView(vc)
        vc.backgroundColor = color

        return vc
    }

    @IBAction func didChangeSliderValue(_ sender: Any) {
        presenter.didChangeSliderValue(valueSlider.value)
    }

    func updateValueSliderRange(range: ClosedRange<Float>) {
        valueSlider.maximumValue = range.upperBound
        valueSlider.minimumValue = range.lowerBound
    }
}
