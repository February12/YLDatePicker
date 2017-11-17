//
//  ViewController.swift
//  YLDatePicker
//
//  Created by yl on 2017/11/15.
//  Copyright © 2017年 February12. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {

    var tableView: UITableView = {
        
        let tableView = UITableView.init(frame: CGRect.zero, style: UITableViewStyle.plain)
        
        return tableView
        
    }()
    
    var dataArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        navigationItem.title = Date().getString(format: "yyyy-MM-dd")
        
        dataArray += ["年月","月日","年月日","年月日时分","月日时分","时分"]
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
        view.addSubview(tableView)
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        cell?.textLabel?.text = dataArray[indexPath.row]
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.row {
        case 0:
            let datePicker = YLDatePicker(currentDate: nil, minLimitDate: Date(), maxLimitDate: nil, datePickerType: .YM) { [weak self] (date) in
                self?.navigationItem.title = date.getString(format: "yyyy-MM")
            }
            datePicker.show()
        case 1:
            let datePicker = YLDatePicker(currentDate: nil, minLimitDate: Date(), maxLimitDate: nil, datePickerType: .MD) { [weak self] (date) in
                self?.navigationItem.title = date.getString(format: "MM-dd")
            }
            datePicker.show()
        case 2:
            let datePicker = YLDatePicker(currentDate: nil, minLimitDate: Date(), maxLimitDate: nil, datePickerType: .YMD) { [weak self] (date) in
                self?.navigationItem.title = date.getString(format: "yyyy-MM-dd")
            }
            datePicker.show()
        case 3:
            let datePicker = YLDatePicker(currentDate: nil, minLimitDate: Date(), maxLimitDate: nil, datePickerType: .YMDHm) { [weak self] (date) in
                self?.navigationItem.title = date.getString(format: "yyyy-MM-dd HH:mm")
            }
            datePicker.show()
        case 4:
            let datePicker = YLDatePicker(currentDate: nil, minLimitDate: Date(), maxLimitDate: nil, datePickerType: .MDHm) { [weak self] (date) in
                self?.navigationItem.title = date.getString(format: "MM-dd HH:mm")
            }
            datePicker.show()
        case 5:
            let datePicker = YLDatePicker(currentDate: nil, minLimitDate: Date(), maxLimitDate: nil, datePickerType: .Hm) { [weak self] (date) in
                self?.navigationItem.title = date.getString(format: "HH:mm")
            }
            datePicker.show()
        default:
            break
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

