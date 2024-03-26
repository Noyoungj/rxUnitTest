//
//  ViewController.swift
//  Test
//
//  Created by 노영재(Youngjae No)_인턴 on 3/22/24.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa
import ReactorKit

class ViewController: UIViewController, ReactorKit.View {
    let viewReactor = ViewReactor()
    
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("Plus", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = .systemFont(ofSize: 30, weight: .bold)
        return label
    }()
    
    var disposeBag = DisposeBag()
    private func addSubViews() {
        self.view.addSubview(button)
        self.view.addSubview(label)
    }
    
    private func setLayouts() {
        button.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(20)
        }
        
        label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-20)
        }
    }
    
    func bind(reactor: ViewReactor) {
        button.rx.tap
            .map{ _ in ViewReactor.Action.tapPlusButton }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        reactor.state.map(\.cnt)
            .observe(on: MainScheduler.asyncInstance)
            .map(String.init)
            .bind(to: label.rx.text)
            .disposed(by: disposeBag)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        addSubViews()
        setLayouts()
        bind(reactor: viewReactor)
    }


}

