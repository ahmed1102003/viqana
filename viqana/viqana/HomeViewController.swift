//
//  ViewController.swift
//  viqana
//
//  Created by Ahmad Younis on 8/24/17.
//  Copyright © 2017 Ahmad Younis. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController{

    var categories: [ProductCategory] = [
        ProductCategory(name: "Jackets", products: [
            Product(image: #imageLiteral(resourceName: "Jacket7"), name: "jakect1", price: 10)
            ]),
        ProductCategory(name: "Skirts", products: [
            Product(image: #imageLiteral(resourceName: "s1"), name: "jakect1", price: 10)
            ]),
        ProductCategory(name: "Night Dresses", products: [
            Product(image: #imageLiteral(resourceName: "dress34"), name: "jakect1", price: 10)
            ]),
        ProductCategory(name: "Dresses", products: [
            Product(image: #imageLiteral(resourceName: "dress3"), name: "jakect1", price: 10)
            ]),
    ]
    // We are define the buttons here which we have 5 (AY)
    @IBOutlet weak var collectionView: UICollectionView!
//    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button2: UIButton!
    
    // this to load the UI (AY)
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //This is to give button 2 layer and others (AY)
        button2.layer.borderColor = UIColor.gray.cgColor
        button2.layer.borderWidth = 2
        button2.layer.masksToBounds = true
        button2.layer.cornerRadius = 8
      //  button2.titleEdgeInsets = UIEdgeInsets(top: 0, left: 100, bottom: 0, right: 0)
        
        
        //This is to give button 3 layer and others (AY)
        button3.layer.borderColor = UIColor.gray.cgColor
        button3.layer.borderWidth = 2
        button3.layer.masksToBounds = true
        button3.layer.cornerRadius = 8
        
        //This is to give button 4 layer and others (AY)
        button4.contentMode = .scaleAspectFill
        button4.layer.borderColor = UIColor.gray.cgColor
        button4.layer.borderWidth = 2
        button4.layer.masksToBounds = true
        button4.layer.cornerRadius = 8
        
        
         //This is to give button 5 layer and others (AY)
        button5.layer.borderColor = UIColor.gray.cgColor
        button5.layer.borderWidth = 2
        button5.layer.masksToBounds = true
        button5.layer.cornerRadius = 8
        
        
        
       // button1.addTarget(self, action: #selector(button1Tapped(_:)), for: .touchUpInside)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isScrollEnabled = false
        collectionView.showsHorizontalScrollIndicator = false
        
        
        // this is to set up the time by second to display the next image (AY )
        timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { [weak self] _ in
            self?.goToNextImage()
        }
        
        updateUI(with: categories)

    }
    
    func updateUI(with categories: [ProductCategory]) {
        let categoryForButton2 = categories[0]
        button2.setImage(categoryForButton2.image, for: .normal)
        
        let categoryForButton3 = categories[1]
        button3.setImage(categoryForButton3.image, for: .normal)
        
        let categoryForButton4 = categories[2]
        button4.setImage(categoryForButton4.image, for: .normal)
        
        let categoryForButton5 = categories[3]
        button5.setImage(categoryForButton5.image, for: .normal)
    }
    
    var currentImageIndex: Int = 0
    func goToNextImage() {
        currentImageIndex = (currentImageIndex + 1) % numberOfItems
        collectionView.scrollToItem(at: IndexPath(item: currentImageIndex, section: 0), at: .centeredHorizontally, animated: true)
    }
    
    weak var timer: Timer?
    deinit {
        timer?.invalidate()
    }
    
    @objc func button1Tapped(_ sender: AnyObject) {
        let vc = ViewController5Jacket()
        //vc.view.backgroundColor = .red
        vc.title = "Back"
        navigationController?.pushViewController(vc, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let productCategoryVC = segue.destination as? ViewController3 else {
            assertionFailure()
            return
        }
        _ = productCategoryVC.view
        switch segue.identifier {
        case "homeToCategory2"?:
            productCategoryVC.productCategory = categories[0]
        case "homeToCategory3"?:
            productCategoryVC.productCategory =
            categories[1]
            //AY added this
        case "homeToCategory4"?:
            productCategoryVC.productCategory =
                categories[2]
        case "homeToCategory5"?:
            productCategoryVC.productCategory =
                categories[3]
            
        default:
            assertionFailure()
        }
    }

}

// this is for the collection view (AY)
private let numberOfItems = 10000

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfItems
    }
    // we careted an image Array to store the images that we want them to display in the slideshow (AY)
    static let images = [#imageLiteral(resourceName: "topimage1"), #imageLiteral(resourceName: "topimage2"),#imageLiteral(resourceName: "topimage3")]
    static let cellID = "imageCell"
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeViewController.cellID, for: indexPath) as! ImageCell
        cell.imageView.image = HomeViewController.images[indexPath.item % HomeViewController.images.count]
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //switch indexPath.item % 3 {
        //case 0: button1Tapped(self)
        //case 1
       // }
        button1Tapped(self)
    }
}


// note sure if this is for the collection view (AY) I think this is when the user click on image on the slideshow
class ImageCell: UICollectionViewCell {
    @IBOutlet weak var imageView : UIImageView!
}
