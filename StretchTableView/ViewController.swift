//
//  ViewController.swift
//  StretchTableView
//
//  Created by Anantha Krishnan K G on 12/04/19.
//  Copyright © 2019 Ananth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var kTableHeaderHeight:CGFloat = 300.0
    
//    var imageView:UIImageView = {
//
//        let imv = UIImageView(image: #imageLiteral(resourceName: "img1"))
//        imv.frame = CGRect(x: 0, y: -20, width: UIScreen.main.bounds.width, height: 300)
//        imv.contentMode = UIView.ContentMode.scaleToFill
//        imv.clipsToBounds = true
//        return imv
//    }()
    @IBOutlet weak var strechyTableView: UITableView!
//    @IBOutlet weak var imageView: UIImageView!
var headerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        strechyTableView.rowHeight = UITableView.automaticDimension
        
        headerView = strechyTableView.tableHeaderView
        strechyTableView.tableHeaderView = nil
        strechyTableView.addSubview(headerView)
        
        strechyTableView.contentInset = UIEdgeInsets(top: kTableHeaderHeight, left: 0, bottom: 0, right: 0)
        strechyTableView.contentOffset = CGPoint(x: 0, y: -kTableHeaderHeight)
        updateHeaderView()
        // Do any additional setup after loading the view.
        
//        strechyTableView.delegate = self
//        strechyTableView.dataSource = self
//        strechyTableView.backgroundColor = .white
//
//
//        strechyTableView.tableHeaderView = nil
//        strechyTableView.tableHeaderView = imageView
//
//
//        strechyTableView.contentInset = UIEdgeInsets(top: -20, left: 0, bottom: 0, right: 0)
//          //strechyTableView.contentInset = UIEdgeInsets(top: kTableHeaderHeight, left: 0, bottom: 0, right: 0)
//        strechyTableView.contentOffset = CGPoint(x: 0, y: -kTableHeaderHeight)
       // updateHeaderView()
    }


    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateHeaderView()
        
//        print(scrollView.contentOffset.y, imageView.frame.origin.y)
//        if scrollView.contentOffset.y < 0 {
//            //strechyTableView.contentInset = UIEdgeInsets(top: -20 - scrollView.contentOffset.y, left: 0, bottom: 0, right: 0)
//
//            strechyTableView.tableHeaderView!.frame.origin.y = scrollView.contentOffset.y
//
//        } else {
//            imageView.frame.origin.y = 0
//        }
    }
    
   
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
         return UITableView.automaticDimension
    }
   
    
    func updateHeaderView() {
        
        var headerRect = CGRect(x: 0, y: -kTableHeaderHeight, width: strechyTableView.bounds.width, height: kTableHeaderHeight)
        if strechyTableView.contentOffset.y < -kTableHeaderHeight {
            headerRect.origin.y = strechyTableView.contentOffset.y
            headerRect.size.height = -strechyTableView.contentOffset.y
        }
        
        headerView.frame = headerRect
//        var headerRect = CGRect(x: 0, y: -kTableHeaderHeight, width: strechyTableView.bounds.width, height: kTableHeaderHeight)
//        if strechyTableView.contentOffset.y < -20 {
//            headerRect.origin.y -= strechyTableView.contentOffset.y
//            headerRect.size.height += -strechyTableView.contentOffset.y
//        }
//
//        imageView.frame = headerRect
    }
}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "StretchyTableViewCell", for: indexPath) as! StretchyTableViewCell
        cell.indentationLevel = 2;
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100
    }

}

extension ViewController: UITableViewDelegate {
    
}
