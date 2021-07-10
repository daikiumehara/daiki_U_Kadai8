//
//  ViewController.swift
//  Kadai8
//
//  Created by daiki umehara on 2021/07/10.
//

import UIKit

protocol View: AnyObject {
    func setPresenter(_ presenter: Presenter)
    func setRangeAndValue(range: ClosedRange<Float>, value: Float)
    func updateView(_ value: Float)
}

class SliderViewController: UIViewController, View {
    @IBOutlet private var valueLabel: UILabel!
    @IBOutlet private var valueSlider: UISlider!
    private var backgroundColor: UIColor!
    private var presenter: Presenter!
    private var range: ClosedRange<Float>!
    private var initialValue: Float!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = backgroundColor
        self.valueSlider.maximumValue = range.upperBound
        self.valueSlider.minimumValue = range.lowerBound
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showView()
    }

    func setPresenter(_ presenter: Presenter) {
        self.presenter = presenter
        presenter.setView(self)
    }

    func setRangeAndValue(range: ClosedRange<Float>, value: Float) {
        self.range = range
        self.initialValue = value
    }

    func showView() {
        self.presenter.updateView()
    }

    func updateView(_ value: Float) {
        self.valueSlider?.setValue(value, animated: false)
        self.valueLabel?.text = String(value)
    }

    static func instantiate(_ presenter: Presenter, _ color: UIColor) -> SliderViewController {
        guard let vc = UIStoryboard.init(name: "SliderViewController", bundle: nil).instantiateInitialViewController() as? SliderViewController else {
            fatalError("ViewControllerが見つかりません")
        }
        vc.setPresenter(presenter)
        vc.backgroundColor = color
        return vc
    }

    @IBAction func didChangeSliderValue(_ sender: Any) {
        presenter.setSliderValue(valueSlider.value)
        self.valueLabel.text = String(valueSlider.value)
    }
}

