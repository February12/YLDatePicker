//
//  UIView+Extension.swift
//  YLDatePicker
//
//  Created by yl on 2017/11/15.
//  Copyright © 2017年 February12. All rights reserved.
//

import UIKit

//UIView+Extension

// MARK: - 约束拓展
extension UIView {
    
    /*----------------------------添加约束----------------------------*/
    
    /// 添加约束 -> edgeInsets
    func addLayoutConstraints(toItem: Any,edgeInsets: UIEdgeInsets) {
        addLayoutConstraints(attributes: [.top,.bottom,.left,.right], toItem: toItem, attributes: nil, constants:[edgeInsets.top,edgeInsets.bottom,edgeInsets.left,edgeInsets.right])
        
    }
    /// 添加约束 -> [attr1]丶toItem丶[attr2]丶constant
    func addLayoutConstraints(attributes attr1s: [NSLayoutAttribute],
                              toItem: Any?,
                              attributes attr2s: [NSLayoutAttribute]?,
                              constant: CGFloat) {
        for (i,attr1) in attr1s.enumerated() {
            let attr2 = attr2s == nil ? nil:attr2s![i]
            addLayoutConstraint(attribute: attr1, relatedBy: .equal, toItem: toItem, attribute: attr2, multiplier: 1, constant: constant)
        }
    }
    /// 添加约束 -> [attr1]丶toItem丶[attr2]丶[constant]
    func addLayoutConstraints(attributes attr1s: [NSLayoutAttribute],
                              toItem: Any?,
                              attributes attr2s: [NSLayoutAttribute]?,
                              constants: [CGFloat]) {
        for (i,attr1) in attr1s.enumerated() {
            let attr2 = attr2s == nil ? nil:attr2s![i]
            let constant = constants[i]
            addLayoutConstraint(attribute: attr1, toItem: toItem, attribute: attr2, constant: constant)
        }
    }
    /// 添加约束 -> attr1丶toItem丶attr2丶constant
    func addLayoutConstraint(attribute attr1: NSLayoutAttribute,
                             toItem: Any?,
                             attribute attr2: NSLayoutAttribute?,
                             constant: CGFloat) {
        addLayoutConstraint(attribute: attr1, relatedBy: .equal, toItem: toItem, attribute: attr2, multiplier: 1, constant: constant)
    }
    /// 添加约束 -> attr1丶relatedBy丶toItem丶attr2丶multiplier丶constant
    func addLayoutConstraint(attribute attr1: NSLayoutAttribute,
                             relatedBy relation: NSLayoutRelation,
                             toItem: Any?,
                             attribute attr2: NSLayoutAttribute?,
                             multiplier: CGFloat,
                             constant: CGFloat) {
        
        var toItem = toItem
        var attr2 = attr2 ?? attr1
        
        if translatesAutoresizingMaskIntoConstraints == true {
            translatesAutoresizingMaskIntoConstraints = false
        }
        
        if attr1 == .width || attr1 == .height {
            toItem = nil
            attr2 = .notAnAttribute
        }
        
        let constraint = NSLayoutConstraint.init(item: self, attribute: attr1, relatedBy: relation, toItem: toItem, attribute: attr2, multiplier: multiplier, constant: constant)
        
        NSLayoutConstraint.activate([constraint])
    }
    
    /*----------------------------修改约束----------------------------*/
    
    /// 修改约束 -> edgeInsets
    func updateLayoutConstraints(toItem: Any,edgeInsets: UIEdgeInsets) {
        updateLayoutConstraints(attributes: [.top,.bottom,.left,.right], toItem: toItem, attributes: nil, constants:[edgeInsets.top,edgeInsets.bottom,edgeInsets.left,edgeInsets.right])
        
    }
    /// 修改约束 -> [attr1]丶toItem丶[attr2]丶constant
    func updateLayoutConstraints(attributes attr1s: [NSLayoutAttribute],
                                 toItem: Any?,
                                 attributes attr2s: [NSLayoutAttribute]?,
                                 constant: CGFloat) {
        for (i,attr1) in attr1s.enumerated() {
            let attr2 = attr2s == nil ? attr1:attr2s![i]
            updateLayoutConstraint(attribute: attr1, relatedBy: .equal, toItem: toItem, attribute: attr2, multiplier: 1, constant: constant)
        }
    }
    /// 修改约束 -> [attr1]丶toItem丶[attr2]丶[constant]
    func updateLayoutConstraints(attributes attr1s: [NSLayoutAttribute],
                                 toItem: Any?,
                                 attributes attr2s: [NSLayoutAttribute]?,
                                 constants: [CGFloat]) {
        for (i,attr1) in attr1s.enumerated() {
            let attr2 = attr2s == nil ? attr1:attr2s![i]
            let constant = constants[i]
            updateLayoutConstraint(attribute: attr1, toItem: toItem, attribute: attr2, constant: constant)
        }
    }
    /// 修改约束 -> attr1丶toItem丶attr2丶constant
    func updateLayoutConstraint(attribute attr1: NSLayoutAttribute,
                                toItem: Any?,
                                attribute attr2: NSLayoutAttribute?,
                                constant: CGFloat) {
        updateLayoutConstraint(attribute: attr1, relatedBy: .equal, toItem: toItem, attribute: attr2, multiplier: 1, constant: constant)
    }
    /// 修改约束 -> attr1丶relatedBy丶toItem丶attr2丶multiplier丶constant
    func updateLayoutConstraint(attribute attr1: NSLayoutAttribute,
                                relatedBy relation: NSLayoutRelation,
                                toItem: Any?,
                                attribute attr2: NSLayoutAttribute?,
                                multiplier: CGFloat,
                                constant: CGFloat) {
        
        removeLayoutConstraint(attribute: attr1, toItem: toItem, attribute: attr2)
        
        addLayoutConstraint(attribute: attr1, relatedBy: relation, toItem: toItem, attribute: attr2, multiplier: multiplier, constant: constant)
    }
    
    /*----------------------------删除约束----------------------------*/
    
    /// 删除约束 -> [attr1]丶toItem丶[attr2]
    func removeLayoutConstraints(attributes attr1s: [NSLayoutAttribute],
                                 toItem: Any?,
                                 attributes attr2s: [NSLayoutAttribute]?) {
        for (i,attr1) in attr1s.enumerated() {
            let attr2 = attr2s == nil ? nil:attr2s![i]
            removeLayoutConstraint(attribute: attr1, toItem: toItem, attribute: attr2)
        }
    }
    /// 删除约束 -> attr1丶toItem丶attr2
    func removeLayoutConstraint(attribute attr1: NSLayoutAttribute,
                                toItem: Any?,
                                attribute attr2: NSLayoutAttribute?) {
        
        let attr2 = attr2 ?? attr1
        
        if attr1 == .width  || attr1 == .height {
            for constraint in constraints {
                if constraint.firstItem?.isEqual(self) == true &&
                    constraint.firstAttribute == attr1 {
                    NSLayoutConstraint.deactivate([constraint])
                }
            }
            
        }else if let superview = self.superview {
            for constraint in superview.constraints {
                if constraint.firstItem?.isEqual(self) == true &&
                    constraint.firstAttribute == attr1 &&
                    constraint.secondItem?.isEqual(toItem) == true &&
                    constraint.secondAttribute == attr2 {
                    NSLayoutConstraint.deactivate([constraint])
                }
            }
        }
    }
}
