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
    @IBOutlet var lastestButton: UIButton!
    @IBOutlet var yesButton: UIButton!
    
    //-- Address Store에서 주소정보 가져오기
    var chooseAddress: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //--- 버튼 모서리 둥글게 지정
        lastestButton.layer.cornerRadius = 10
        yesButton.layer.cornerRadius = 10
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //-- Address Store에서 받아온 주소 출력
        if chooseAddress != nil {
            addressTextField.text = chooseAddress
            chooseAddress = nil
        }
    }

    //---- 키보드 사라지게 하기
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //--- Segue 통해 값 넘기기
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     
        if segue.identifier == "AddressStore"{
            let destVC = segue.destination as! AddressStore
            destVC.title = "주소 찾기"
            destVC.chooseVC = self
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
