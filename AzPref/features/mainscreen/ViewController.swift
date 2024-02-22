//
//  ViewController.swift
//  AzPref
//
//  Created by Sefa Aycicek on 22.02.2024.
//

import UIKit

class ViewController: BaseViewController {

    @IBOutlet weak var pickerView: UIPickerView!
    
    let viewModel = ViewControllerViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        viewModel.save()
    }
    
}

extension ViewController : UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(viewModel.getItemTitleForComponent(component: component, row: row))
        viewModel.selectComponent(component: component, row: row)
        if component == 0 {
            self.pickerView.reloadComponent(1)
        }
    }
}

extension ViewController : UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return viewModel.getItemCountForComponent(component: component)
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return viewModel.getItemTitleForComponent(component: component, row: row)
    }
    
}
