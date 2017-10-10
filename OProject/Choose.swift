//
//  Choose.swift
//  과제
//
//  Created by SWUCOMPUTER on 2017. 10. 3..
//  Copyright © 2017년 SWUCOMPUTER. All rights reserved.
//

import UIKit

class Choose: UIViewController, UITextFieldDelegate {

    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var phoneTextField: UITextField!
    @IBOutlet var addressTextField: UITextField!
    @IBOutlet var payment: UISegmentedControl!
    @IBOutlet var lastestButton: UIButton! // 디자인지정 위해 생성
    @IBOutlet var yesButton: UIButton! // 디자인지정 위해 생성

    //--- 정보 다시 받아오기
    var reName: String!
    var rePhone: String!
    var reAddress: String!
    var rePaySegIndex: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lastestButton.layer.cornerRadius = 10 // 버튼 모서리 둥글게
        yesButton.layer.cornerRadius = 10
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        //--- Address Store에서 받아온 정보를 출력
        nameTextField.text = reName
        phoneTextField.text = rePhone
        addressTextField.text = reAddress
        payment.selectedSegmentIndex = rePaySegIndex
    }
    
    //---- 키보드 없애기
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //--- Segue 통해 값 넘기기
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     
        if segue.identifier == "AddressStore"{
            let destVC = segue.destination as! AddressStore
            destVC.title = "주소 찾기"
  
            //--- 정보넘기기
            destVC.Name = nameTextField.text
            destVC.Phone = phoneTextField.text
            destVC.Address = addressTextField.text
            destVC.PaySegIndex = payment.selectedSegmentIndex
        }
        
        else{
            let destVC = segue.destination as! Last
            destVC.title = "결제창"
            
            destVC.lastName = nameTextField.text
            destVC.lastPhone = phoneTextField.text
            destVC.lastAddress = addressTextField.text
            destVC.lastPaySeg = payment.titleForSegment(at: payment.selectedSegmentIndex)!
        }
    }
}
