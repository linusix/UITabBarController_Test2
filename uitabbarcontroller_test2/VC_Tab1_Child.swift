//
//  VC_Tab1_Child.swift
//  uitabbarcontroller_test2
//
//  Created by Hyeon Jong Kim on 12/10/24.
//

import UIKit

import RxSwift
import RxCocoa
import SnapKit

//extension UINavigationController {
//    func pushToViewController(_ viewController: UIViewController, animated:Bool = true, completion: @escaping ()->()) {
//        CATransaction.begin()
//        CATransaction.setCompletionBlock(completion)
//        self.pushViewController(viewController, animated: animated)
//        CATransaction.commit()
//    }
//
//    func popViewController(animated:Bool = true, completion: @escaping ()->()) {
//        CATransaction.begin()
//        CATransaction.setCompletionBlock(completion)
//        self.popViewController(animated: animated)
//        CATransaction.commit()
//    }
//
//    func popToViewController(_ viewController: UIViewController, animated:Bool = true, completion: @escaping ()->()) {
//        CATransaction.begin()
//        CATransaction.setCompletionBlock(completion)
//        self.popToViewController(viewController, animated: animated)
//        CATransaction.commit()
//    }
//
//    func popToRootViewController(animated:Bool = true, completion: @escaping ()->()) {
//        CATransaction.begin()
//        CATransaction.setCompletionBlock(completion)
//        self.popToRootViewController(animated: animated)
//        CATransaction.commit()
//    }
//}

class MyButton: UIButton {
    deinit {
        print("\(#function), \(self) \(Date().timeIntervalSince1970)")
    }
}

class HeaderView: UIView {
    var backButton = MyButton()
    var disposeBag = DisposeBag()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(backButton)
        
        backButton.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("\(#function), \(self) \(Date().timeIntervalSince1970)")
    }
}

class VC_Tab1_Child: UIViewController {
    private var headerView = HeaderView()
    private var disposeBag = DisposeBag()
    var callType: CallType?
    
    deinit {
        print("\(#function), \(self) \(Date().timeIntervalSince1970)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        headerView.backButton.setTitle("Wait...", for: .normal)
        headerView.backButton.setTitleColor(.black, for: .normal)
        
        self.view.addSubview(headerView)
        
        headerView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        headerView.backButton.rx.tap
            .debug("headerView.backButton.rx.tap")
            .subscribe(with: self, onNext: { owner, _ in
            })
            .disposed(by: headerView.disposeBag)
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
