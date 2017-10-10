//
//  Last.swift
//  과제
//
//  Created by 오지연 on 2017. 10. 5..
//  Copyright © 2017년 SWUCOMPUTER. All rights reserved.
//

import UIKit

class Last: UIViewController {

    @IBOutlet var name: UILabel!
    @IBOutlet var phone: UILabel!
    @IBOutlet var addressCheck: UILabel!
    @IBOutlet var payCheck: UILabel!
    
    //--- 정보 가져오기
    var lastName: String!
    var lastPhone: String!
    var lastAddress: String!
    var lastPaySeg: String!
    
    //--- 받아온 정보 출력
    override func viewDidLoad() {
        super.viewDidLoad()
        
        name.text = "이름 : " + lastName
        phone.text = "휴대폰 : " + lastPhone
        addressCheck.text = "주소 : " + lastAddress
        payCheck.text = "결제방법 : " + lastPaySeg
    }
}
