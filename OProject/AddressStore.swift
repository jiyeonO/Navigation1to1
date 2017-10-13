//
//  AddressStore.swift
//  과제
//
//  Created by 오지연 on 2017. 10. 5..
//  Copyright © 2017년 SWUCOMPUTER. All rights reserved.
//

import UIKit

class AddressStore: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet var pickerAddress: UIPickerView!
    @IBOutlet var pickerChoose: UIButton!
    @IBOutlet var checkView: UILabel!
    @IBOutlet var yesButton: UIButton!
    
    var chooseVC: UIViewController? = nil
    var putString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //--- 버튼 모서리 둥글게 하기
        pickerChoose.layer.cornerRadius = 10
        yesButton.layer.cornerRadius = 10
    }
    
    //--- Picker 배열
    var plusAddress:[String] = ["서울시 노원구 화랑로", "서울시 강동구 암사동", "서울시 광진구 구의동", "경기도 남양주시 경춘로"]
    
    //--- 주소저장 + 라벨로 텍스트 내보내기
    @IBAction func getValueAction(_ sender: UIButton) {
        putString = plusAddress[self.pickerAddress.selectedRow(inComponent: 0)]
        checkView.text = "선택하신 주소가 " + putString! + " 맞습니까?"
    }
    
    //--- 선택된 주소있다면 값 저장 후 pop
    @IBAction func popAction(_ sender: UIButton) {
        if let targetVC = chooseVC as? Choose {
            if putString != nil {
                targetVC.chooseAddress = putString
                _ = self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    //---  PickerView 위한 delegate, datasource method 정의
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func  pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return plusAddress.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return plusAddress[row]
    }

}
