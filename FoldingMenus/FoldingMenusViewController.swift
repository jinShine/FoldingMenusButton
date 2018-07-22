//
//  FoldingMenusViewController.swift
//  FoldingMenus
//
//  Created by 김승진 on 2018. 7. 23..
//  Copyright © 2018년 김승진. All rights reserved.
//

import UIKit

private let distance: CGFloat = 30.0;
private let menuBtnDistance: Int = 100;

private struct MenuBtnSetting  {
    static let witdh: CGFloat = 50.0
    static let Height: CGFloat = 50.0
    static let count: Int = 5
}


class FoldingMenusViewController: UIViewController {
    
    lazy private var firstButtonMenu: UIButton = UIButton(frame: CGRect(x: distance,
                                                                        y: self.view.bounds.height - (distance * 3),
                                                                        width:MenuBtnSetting.witdh,
                                                                        height: MenuBtnSetting.Height))
    lazy private var secondButtonMenu: UIButton = UIButton(frame: CGRect(x: self.view.frame.size.width - MenuBtnSetting.witdh - distance,
                                                                         y: self.view.bounds.height - (distance * 3),
                                                                         width:MenuBtnSetting.witdh,
                                                                         height: MenuBtnSetting.Height))
    
    private var firstMenuArr: [UIButton] = []
    private var secondMenuArr: [UIButton] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupFirstMenuButton()
        setupSecondMenuButton()
        
    }
    
    private func setRandomColor() -> UIColor {
        let red = CGFloat(arc4random_uniform(255)) / 255
        let green = CGFloat(arc4random_uniform(255)) / 255
        let blue = CGFloat(arc4random_uniform(255)) / 255
        
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    private func makePopMenuButton(frame: CGRect, menuName: String){
        for i in 1...MenuBtnSetting.count {
            let button: UIButton = UIButton(frame: frame)
            
            button.setTitleColor(.white, for: .normal)
            button.setTitle("버튼 \(i)", for: .normal)
            button.backgroundColor = setRandomColor()
            button.layer.cornerRadius = MenuBtnSetting.witdh / 2
            button.layer.masksToBounds = true
            self.view.addSubview(button)
            
            if menuName == "firstMenu" { firstMenuArr.append(button) }
            else if menuName == "secondMenu" { secondMenuArr.append(button) }
        }
    }
    
    private func setupFirstMenuButton() {
        makePopMenuButton(frame: CGRect(x: distance,
                                        y: self.view.bounds.height - (distance * 3),
                                        width:MenuBtnSetting.witdh,
                                        height: MenuBtnSetting.Height), menuName: "firstMenu")
        
        firstButtonMenu.layer.cornerRadius = self.firstButtonMenu.frame.width / 2
        firstButtonMenu.layer.masksToBounds = true
        firstButtonMenu.setTitle("버튼 0", for: .normal)
        firstButtonMenu.setTitleColor(.white, for: .normal)
        firstButtonMenu.backgroundColor = setRandomColor()
        self.view.addSubview(firstButtonMenu)
        firstButtonMenu.addTarget(self, action: #selector(firstButtonMenuAction(sender:)), for: .touchUpInside)
    }
    
    private func setupSecondMenuButton() {
        makePopMenuButton(frame: CGRect(x: self.view.frame.size.width - MenuBtnSetting.witdh - distance,
                                        y: self.view.bounds.height - (distance * 3),
                                        width:MenuBtnSetting.witdh,
                                        height: MenuBtnSetting.Height), menuName: "secondMenu")
        
        secondButtonMenu.layer.cornerRadius = self.secondButtonMenu.frame.width / 2
        secondButtonMenu.layer.masksToBounds = true
        secondButtonMenu.setTitle("버튼 0", for: .normal)
        secondButtonMenu.setTitleColor(.white, for: .normal)
        secondButtonMenu.backgroundColor = setRandomColor()
        self.view.addSubview(secondButtonMenu)
        secondButtonMenu.addTarget(self, action: #selector(secondButtonMenuAction(sender:)), for: .touchUpInside)
    }
    
    @objc private func firstButtonMenuAction(sender: UIButton) {
        
        sender.isSelected = !sender.isSelected
        
        UIView.animate(withDuration: 0.6, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.0, options: [], animations: {
            if sender.isSelected {
                for i in 0..<self.firstMenuArr.count {
                    self.firstMenuArr[i].transform = .identity
                    self.firstMenuArr[i].center.y -= CGFloat((i+1) * menuBtnDistance)
                }
            } else {
                for i in 0..<self.firstMenuArr.count {
                    self.firstMenuArr[i].transform = self.firstMenuArr[i].transform.scaledBy(x: 0.2 , y: 0.2)
                    self.firstMenuArr[i].center.y += CGFloat((i+1) * menuBtnDistance)
                }
            }
        }) { _ in
            
        }
    }
    
    @objc private func secondButtonMenuAction(sender: UIButton) {
        
        sender.isSelected = !sender.isSelected
        
        UIView.animateKeyframes(withDuration: 0.6, delay: 0, options: [], animations: {
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1.0 / Double(MenuBtnSetting.count), animations: {
                if sender.isSelected {
                    for i in 0..<self.secondMenuArr.count {
                        self.secondMenuArr[i].transform = .identity
                        self.secondMenuArr[i].center.x -= CGFloat((i+1) * 50)
                        self.secondMenuArr[i].center.y -= CGFloat((i+1) * 50)
                    }
                } else {
                    for i in 0..<self.secondMenuArr.count {
                        self.secondMenuArr[i].transform = self.secondMenuArr[i].transform.scaledBy(x: 0.2, y: 0.2)
                        self.secondMenuArr[i].center.x += CGFloat((i+1) * 50)
                        self.secondMenuArr[i].center.y += CGFloat((i+1) * 50)
                    }
                }
            })
        }) { _ in
            
        }
    }
}
