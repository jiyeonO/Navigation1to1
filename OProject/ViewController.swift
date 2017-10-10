//
//  ViewController.swift
//  OProject
//
//  Created by 오지연 on 2017. 10. 11..
//  Copyright © 2017년 jiyeon. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    @IBOutlet var chooseButton: UIButton!
    @IBOutlet var ItemView: UILabel!
    @IBOutlet var buyButton: UIButton!
    @IBOutlet var chooseView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chooseButton.layer.cornerRadius = 10 // 버튼 모서리 둥글게
        buyButton.layer.cornerRadius = 10
    }
    
    //--- Picker 내용 요소
    let chooseArray: Array<String> = ["Regular", "Button Down", "Wide", "Chinese", "Tap"]
    
    
    //--- 선택 버튼 누르면 액션
    @IBAction func getValue(_ sender: UIButton) {
        let Item:String = chooseArray[self.chooseView.selectedRow(inComponent: 0)]
        ItemView.text = Item + "을 선택하셨습니다."
    }
    
    //--- segue통해 title 지정
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Choose"{
            let destVC = segue.destination as! Choose
            let Item:String! = chooseArray[self.chooseView.selectedRow(inComponent: 0)]
            destVC.title = Item + " 항목 결제"
        }
    }
    
    //--- PickerView 위한 delegate, datasource method 정의
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func  pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return chooseArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return chooseArray[row]
    }
}

