//
//  LoginGuideViewController.swift
//  Restlivery
//
//  Created by Zain Budhwani on 9/6/19.
//  Copyright © 2019 Zain Budhwani. All rights reserved.
//

import UIKit

class LoginGuideViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let lgGuideId = "lgGuideId"
    let lgViewId = "lgViewId"
    var loginPages = [LoginPage]()
    
    lazy var pageCtrl: UIPageControl = {
        let pgCtrl = UIPageControl()
        pgCtrl.translatesAutoresizingMaskIntoConstraints = false
        pgCtrl.pageIndicatorTintColor = .lightGray
        pgCtrl.currentPageIndicatorTintColor = UIColor(red: 232/255, green: 63/255, blue: 111/255, alpha: 1.0)
        pgCtrl.numberOfPages = loginPages.count + 1
        return pgCtrl
    }()
    
    let skipBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(skipToLogin), for: .touchUpInside)
        let attributedText = NSAttributedString(string: "Skip", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 22), NSAttributedString.Key.foregroundColor: UIColor(red: 232/255, green: 63/255, blue: 111/255, alpha: 1.0)])
        btn.setAttributedTitle(attributedText, for: .normal)
        return btn
    }()
    
    let nextBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(goToNextPage), for: .touchUpInside)
        let attributedText = NSAttributedString(string: "Next", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 22), NSAttributedString.Key.foregroundColor: UIColor(red: 232/255, green: 63/255, blue: 111/255, alpha: 1.0)])
        btn.setAttributedTitle(attributedText, for: .normal)
        return btn
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let cV = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cV.backgroundColor = .white
        cV.translatesAutoresizingMaskIntoConstraints = false
        cV.dataSource = self
        cV.delegate = self
        cV.isPagingEnabled = true
        cV.register(LoginGuideCell.self, forCellWithReuseIdentifier: lgGuideId)
        cV.register(LoginViewCell.self, forCellWithReuseIdentifier: lgViewId)
        return cV
    }()
    
    var pageCtrlBtmAcr: NSLayoutConstraint?
    var skipBtnTpAcr: NSLayoutConstraint?
    var nextBtnTpAcr: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchPages()
        setupViews()
    }
    
    func fetchPages() {
        loginPages.append(LoginPage(image: #imageLiteral(resourceName: "four"), title: "Order straight from your phone.", text: "No hassle while ordering food. Every recipient's first delivery is on us."))
        loginPages.append(LoginPage(image: #imageLiteral(resourceName: "two"), title: "Order from your favorite restaurants.", text: "Search for nearby restaurants and tap to start an order."))
        loginPages.append(LoginPage(image: #imageLiteral(resourceName: "one"), title: "Get food delivered quickly.", text: "Fill out your information to complete your order and view your driver's progress during the entire process."))
        collectionView.reloadData()
    }
    
    func setupViews() {
        let guide = view.safeAreaLayoutGuide
        
        view.addSubview(collectionView)
        view.addSubview(pageCtrl)
        view.addSubview(skipBtn)
        view.addSubview(nextBtn)
        
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        pageCtrl.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        pageCtrl.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        pageCtrlBtmAcr = pageCtrl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8)
        pageCtrlBtmAcr?.isActive = true
        pageCtrl.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        skipBtn.leftAnchor.constraint(equalTo: guide.leftAnchor).isActive = true
        skipBtnTpAcr = skipBtn.topAnchor.constraint(equalTo: guide.topAnchor)
        skipBtnTpAcr?.isActive = true
        skipBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        skipBtn.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        nextBtn.rightAnchor.constraint(equalTo: guide.rightAnchor).isActive = true
        nextBtnTpAcr = nextBtn.topAnchor.constraint(equalTo: guide.topAnchor)
        nextBtnTpAcr?.isActive = true
        nextBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        nextBtn.widthAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return loginPages.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == loginPages.count {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: lgViewId, for: indexPath) as! LoginViewCell
            cell.lgnBtn.addTarget(self, action: #selector(self.presentSearchVC), for: .touchUpInside)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: lgGuideId, for: indexPath) as! LoginGuideCell
            
            cell.loginImageView.image = loginPages[indexPath.item].pageImage
            
            let attributedTitle = NSMutableAttributedString(string: loginPages[indexPath.item].pageTitle!, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 22, weight: .medium), NSAttributedString.Key.foregroundColor: UIColor(white: 0.2, alpha: 1)])
            let attributedText = NSAttributedString(string: "\n\n" + loginPages[indexPath.item].pageText!, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor(white: 0.2, alpha: 1)])
            attributedTitle.append(attributedText)
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center
            attributedTitle.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributedTitle.string.count))
            cell.loginTextView.attributedText = attributedTitle

            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
    
    @objc func presentSearchVC() {
        let sWRevealController = SWRevealViewController(rearViewController: SideMenuViewController(), frontViewController: UINavigationController(rootViewController: SearchViewController()))!
        showDetailViewController(sWRevealController, sender: self)
    }
    
    func pushConstraintsOffScreen() {
        pageCtrlBtmAcr?.constant = 40
        skipBtnTpAcr?.constant = -100
        nextBtnTpAcr?.constant = -100
            
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    func pullConstraintsOnScreen() {
        pageCtrlBtmAcr?.constant = -8
        skipBtnTpAcr?.constant = 0
        nextBtnTpAcr?.constant = 0
    
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let pageNumber = Int(targetContentOffset.pointee.x / view.frame.width)
        pageCtrl.currentPage = pageNumber
        
        if pageNumber == loginPages.count {
            pushConstraintsOffScreen()
        } else {
            pullConstraintsOnScreen()
        }
    }
    
    @objc func skipToLogin() {
        pageCtrl.currentPage = loginPages.count - 1
        goToNextPage()
    }
    
    @objc func goToNextPage() {
        if pageCtrl.currentPage < loginPages.count {
            if pageCtrl.currentPage == loginPages.count - 1 {
                pushConstraintsOffScreen()
            }
            let indexPath = IndexPath(item: pageCtrl.currentPage + 1, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            pageCtrl.currentPage += 1
        }
    }
}
