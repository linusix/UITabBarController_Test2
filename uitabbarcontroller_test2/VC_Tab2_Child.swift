//
//  VC_Tab2_Child.swift
//  uitabbarcontroller_test2
//
//  Created by Hyeon Jong Kim on 12/10/24.
//

import UIKit

class VC_Tab2_Child: UIViewController {

    deinit {
        print("\(#function), \(self)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("\(#function), \(self) \(Date().timeIntervalSince1970)")
    }
   
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        print("\(#function), \(self) \(Date().timeIntervalSince1970)")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("\(#function), \(self) \(Date().timeIntervalSince1970)")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        print("\(#function), \(self) \(Date().timeIntervalSince1970)")
    }
    
}
