//
//  OrderMealViewController.swift
//  Restlivery
//
//  Created by Zain Budhwani on 9/10/19.
//  Copyright © 2019 Zain Budhwani. All rights reserved.
//

import UIKit

class OrderMealViewController: UIViewController {
    
    let orderImg: UIImageView = {
        let iV = UIImageView(image: #imageLiteral(resourceName: "splash_screen"))
        iV.translatesAutoresizingMaskIntoConstraints = false
        iV.contentMode = .scaleAspectFill
        iV.layer.cornerRadius = 125
        iV.clipsToBounds = true
        return iV
    }()
    
    let orderMealLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "This is the name of the meal"
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 23, weight: .semibold)
        return lbl
    }()
    
    let orderDvLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "__________"
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        return lbl
    }()
    
    let orderSDLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Here contains the short description that will be shown in full to the user, so we could probably keep it shorter on the previous cell"
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 17)
        lbl.numberOfLines = 4
        lbl.textColor = .darkGray
        return lbl
    }()
    
    let orderPriceLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "$99.99"
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        lbl.textColor = .darkGray
        return lbl
    }()
    
    let orderView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let orderBtn = UIButton(type: .custom)
        orderBtn.translatesAutoresizingMaskIntoConstraints = false
        let titleAttribute = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: .medium), NSAttributedString.Key.foregroundColor: UIColor.white]
        orderBtn.setAttributedTitle(NSAttributedString(string: "ADD TO TRAY", attributes: titleAttribute), for: .normal)
        orderBtn.backgroundColor = UIColor(red: 78/255, green: 176/255, blue: 76/255, alpha: 1)
        
        view.addSubview(orderBtn)
        orderBtn.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        orderBtn.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        orderBtn.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        orderBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
    }
    
    func setupViews() {
        view.addSubview(orderImg)
        view.addSubview(orderMealLbl)
        view.addSubview(orderDvLbl)
        view.addSubview(orderSDLbl)
        view.addSubview(orderPriceLbl)
        view.addSubview(orderView)
        
        orderImg.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        orderImg.bottomAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        orderImg.widthAnchor.constraint(equalToConstant: 250).isActive = true
        orderImg.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
        orderMealLbl.topAnchor.constraint(equalTo: orderImg.bottomAnchor, constant: 32).isActive = true
        orderMealLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        orderDvLbl.topAnchor.constraint(equalTo: orderMealLbl.bottomAnchor, constant: 6).isActive = true
        orderDvLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        orderSDLbl.topAnchor.constraint(equalTo: orderDvLbl.bottomAnchor, constant: 16).isActive = true
        orderSDLbl.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 48).isActive = true
        orderSDLbl.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -48).isActive = true
        orderSDLbl.heightAnchor.constraint(equalToConstant: 82).isActive = true
        
        orderPriceLbl.topAnchor.constraint(equalTo: orderSDLbl.bottomAnchor, constant: 16).isActive = true
        orderPriceLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        orderView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        orderView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        orderView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        orderView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
}