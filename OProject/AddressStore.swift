//
//  AddressStore.swift
//  과제
//
//  Created by 오지연 on 2017. 10. 5..
//  Copyright © 2017년 SWUCOMPUTER. All rights reserved.
//

import UIKit

class AddressStore: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var putString: String!
    
    @IBOutlet var pickerAddress: UIPickerView!
    @IBOutlet var pickerChoose: UIButton!
    @IBOutlet var checkView: UILabel!
    @IBOutlet var yes2Button: UIButton!
    
    //---정보 받아오기
    var Name: String!
    var Phone: String!
    var Address: String!
    var PaySegIndex: Int!

    override func viewDidLoad() {
        super.viewDidLoad()
        pickerChoose.layer.cornerRadius = 10
        yes2Button.layer.cornerRadius = 10
        
    }
    
    //--- Picker 배열
    var plusAddress:[String] = ["서울시 노원구 화랑로", "서울시 강동구 암사동", "서울시 광진구 구의동", "경기도 남양주시 경춘로"]
    
    //--- 선택 후 라벨로 텍스트 내보내기
    @IBAction func getValueAction(_ sender: UIButton) {
        putString = plusAddress[self.pickerAddress.selectedRow(inComponent: 0)]
        checkView.text = "선택하신 주소가 " + putString + " 맞습니까?"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "Choose"{
                let destVC = segue.destination as! Choose
                
                destVC.reName = Name
                destVC.rePhone = Phone
                destVC.reAddress = putString
                destVC.rePaySegIndex = PaySegIndex
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
