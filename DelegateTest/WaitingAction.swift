//
//  WaitingAction.swift
//  DelegateTest
//
//  Created by Roman Muzikantov on 16/08/2022.
//

import Foundation

class WaitingAction {
    var delegate: WaitingActionDelegate?
    
    func doAction() {
        Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: false)
    }
    
    @objc func fireTimer() {
        delegate?.actionDone()
    }
}

protocol WaitingActionDelegate {
    func actionDone()
}
