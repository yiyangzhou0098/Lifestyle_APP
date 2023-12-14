//
//  LoginAndMeParentVC.swift
//  LifestyleApp
//
//  Created by ZYY on 12/12/23.
//

import UIKit
import LeanCloud

class LoginAndMeParentVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Test 
        loginForTest()
        
        if let user = LCApplication.default.currentUser {
            print("Has loged in")
            let meVC = storyboard!.instantiateViewController(identifier: kMeVCID)
            add(child: meVC)
        } else {
            // MARK: TODO Not implemented login pages
//            let loginVC = storyboard?.storyboard?.instantiateViewController(identifier: kLoginVCID)
//            add(child: loginVC)
            let meVC = storyboard!.instantiateViewController(identifier: kMeVCID)
            add(child: meVC)
        }
    }
    
    func loginForTest() {
//        do {
//            // 创建实例
//            let user = LCUser()
//
//            // 等同于 user.set("username", value: "Tom")
//            user.username = LCString("zyy")
//            user.password = LCString("770823669")
//
//            // 可选
//            user.email = LCString("yiyangzhou49@163.com")
//
//            // 设置其他属性的方法跟 LCObject 一样
//            try user.set("gender", value: "secret")
//
//            _ = user.signUp { (result) in
//                switch result {
//                case .success:
//                    break
//                case .failure(error: let error):
//                    print(error)
//                }
//            }
//            print("创建成功")
//        } catch {
//            print(error)
//        }
        
        LCUser.logIn(username: "zyy", password: "770823669")
    }
}
