//
//  ViewController3.swift
//  viqana
//
//  Created by Ahmad Younis on 9/30/17.
//  Copyright © 2017 Ahmad Younis. All rights reserved.
//

import UIKit





class ViewController3: UIViewController {

    var productCategory: ProductCategory! {
        didSet {
            title = productCategory.name
            button1.setBackgroundImage(productCategory.products[0].image, for: .normal)
            title = productCategory.name
            button2.setBackgroundImage(productCategory.products[0].image, for: .normal)
            title = productCategory.name
            button3.setBackgroundImage(productCategory.products[0].image, for: .normal)
            title = productCategory.name
            button4.setBackgroundImage(productCategory.products[0].image, for: .normal)
           cartItem.button.setImage(productCategory.products[0].image, for: .normal)
            
        }
    }
    
    var qty: Int = 1 {
        didSet {
            updateQtyLabel()
        }
    }
    func updateQtyLabel() {
         qtyLabel.text = "\(qty)"
    }
    
    
    // this is for the selected size button AY
    var selectedSize: Size? {
        didSet {
            [xsButton, sButton,mButton, lButton, xlButton ].forEach { (b) in
                b?.isCircleVisible = false
            }
            switch selectedSize {
            case .xs?: xsButton.isCircleVisible = true
            case .s?: sButton.isCircleVisible = true
            case .m?: mButton.isCircleVisible = true
            case .l?: lButton.isCircleVisible = true
            case .xl?: xlButton.isCircleVisible = true
            case .none:
                return
            }
           removeErrorMessage()
            doneButton.isEnabled = true
        }
    }
    
    //var sizeslected : String = ""

    @IBOutlet weak var minusButton: UIButton!
    // @IBOutlet var popupTopConstrain: NSLayoutConstraint!
    
    
    @IBOutlet weak var Sizeguide: UIButton!
    
    
    @IBOutlet weak var qtyLabel: UILabel!
    
    @IBOutlet var popupBottomConstrain: NSLayoutConstraint!
    @IBOutlet var popupTopConstrain: NSLayoutConstraint!
    
    // @IBOutlet var popupBottomConstrain: NSLayoutConstraint!
    @IBOutlet weak var xsButton: CircledButton!
    
    @IBOutlet weak var sButton: CircledButton!
    
    @IBOutlet weak var mButton: CircledButton!
    
    @IBOutlet weak var xlButton: CircledButton!
    
    @IBOutlet weak var lButton: CircledButton!
    
    // AY Added
    @IBOutlet weak var Cart: UINavigationItem!
    
    @IBOutlet weak var add: UIButton!
    @IBOutlet weak var text: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateQtyLabel()
        popupBottomConstrain.isActive = false

        let cartItem = CartBarButtonItem()
        cartItem.button.addTarget(self, action: #selector(cartTapped), for: .touchUpInside)
        
        navigationItem.rightBarButtonItem = cartItem
        self.cartItem = cartItem
        
        // Do any additional setup after loading the view.
    
    let spacing: CGFloat = 12
    
    xsButton.contentEdgeInsets = UIEdgeInsets(top: 30, left: spacing, bottom: 30, right: spacing)
    xsButton.widthAnchor.constraint(equalTo: xsButton.heightAnchor, multiplier: 1).isActive = true
        
        sButton.contentEdgeInsets = UIEdgeInsets(top: 30, left: spacing, bottom: 30, right: spacing)
        sButton.widthAnchor.constraint(equalTo: xsButton.heightAnchor, multiplier: 1).isActive = true
        
        mButton.contentEdgeInsets = UIEdgeInsets(top: 30, left: spacing, bottom: 30, right: spacing)
        mButton.widthAnchor.constraint(equalTo: xsButton.heightAnchor, multiplier: 1).isActive = true
        
        lButton.contentEdgeInsets = UIEdgeInsets(top: 30, left: spacing, bottom: 30, right: spacing)
        lButton.widthAnchor.constraint(equalTo: xsButton.heightAnchor, multiplier: 1).isActive = true
        
        xlButton.contentEdgeInsets = UIEdgeInsets(top: 30, left: spacing, bottom: 30, right: spacing)
        xlButton.widthAnchor.constraint(equalTo: xsButton.heightAnchor, multiplier: 1).isActive = true
        
    //sButton.contentEdgeInsets = UIEdgeInsets(top: 30, left: spacing, bottom: 30, right: spacing)
    //mButton.contentEdgeInsets = UIEdgeInsets(top: 30, left: spacing, bottom: 30, right: spacing)
    //lButton.contentEdgeInsets = UIEdgeInsets(top: 30, left: spacing, bottom: 30, right: spacing)
    //xlButton.contentEdgeInsets = UIEdgeInsets(top: 30, left: spacing, bottom: 30, right: spacing)
    
    }
    
    @objc func cartTapped() {
        performSegue(withIdentifier: "vc3ToCheckout", sender: self)
    }
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "vc3ToCheckout"?:
            guard let destination = segue.destination as? CheckoutPage else { assertionFailure(); return }
            destination.model = (productCategory.products[0], qty)
            _ = destination.view
        default:
            break
        }
    }*/
/*
   // AY Added
    @IBAction func Cart(_ sender: Any) {
    
        print("cr7")
        numberOfItemsInCart = numberOfItemsInCart + qty
        cartItem.count = numberOfItemsInCart
    }
    */
    
    @IBAction func addToBagTapped2(_ sender: Any) {
        UIView.animate(withDuration: 0.3) {
            self.popupBottomConstrain.isActive = true
            self.popupTopConstrain.isActive = false
            self.view.layoutIfNeeded()
        }
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func minusButtonTapped(_ sender: Any) {
        qty = max(1, qty - 1)
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        qty = qty + 1
        
    }
    
    // when use click on xs size btton AY
    @IBAction func addsizeXS(_ sender: Any)
    {
        selectedSize = .xs
       
    }
    
    @IBAction func addsizeS(_ sender: Any)
    {
        selectedSize = .s
       

    }
    
    @IBAction func addsizeM(_ sender: Any)
    {
       selectedSize = .m
        

    }
    
    @IBAction func addsizeL(_ sender: Any)
    {
       selectedSize = .l
       

    }
    
    @IBAction func addsizeXL(_ sender:Any)
    {
        selectedSize = .xl
        

    }
    
    
    // end the method when user click on size button AY
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    func displayError() {
        if let _ = errorMessageView { return }
        let v = ErrorMessageView()
        v.label.text  = "Please select a size"
        view.addSubview(v)
        (v.centerXAnchor.constraint(equalTo: view.centerXAnchor)).isActive = true
        (v.centerYAnchor.constraint(equalTo: view.centerYAnchor)).isActive = true
        self.errorMessageView = v
    }
    weak var errorMessageView: ErrorMessageView?
    
    func removeErrorMessage() {
        errorMessageView?.removeFromSuperview()
    }
    
    @IBOutlet weak var doneButton: UIButton!
    
    
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        guard let selectedSize = selectedSize else {
            displayError()
            return
        }
        animateItemToCart()
        let newItems = Array(0..<qty).map { _ in
            Item(product: productCategory.products[0], size: selectedSize)
        }
        cart = cart + newItems
        cartItem.count = numberOfItemsInCart

    }
    
    
    
    var numberOfItemsInCart: Int {
        return cart.count
    }
 
    weak var cartItem: CartBarButtonItem!
    func animateItemToCart() {
//let itemView = UIImageView(image: #imageLiteral(resourceName: "Jacket"))
       let itemView = UIImageView(image: productCategory.products[0].image)
        let size: CGFloat = 50
        itemView.clipsToBounds = true
        itemView.layer.cornerRadius = size/CGFloat(2)
        itemView.translatesAutoresizingMaskIntoConstraints = false
        self.navigationController!.view.addSubview(itemView)
        let centerX = itemView.centerXAnchor.constraint(equalTo: doneButton.centerXAnchor)
        centerX.isActive = true
       let centerY = itemView.centerYAnchor.constraint(equalTo: doneButton.centerYAnchor)
        centerY.isActive = true
        itemView.heightAnchor.constraint(equalToConstant: size).isActive = true
        itemView.widthAnchor.constraint(equalToConstant: size).isActive = true
        self.navigationController!.view.layoutIfNeeded()
        let animationDuration = 0.5
        UIView.animate(withDuration: animationDuration, animations: {
            centerX.isActive = false
            centerY.isActive = false
            itemView.centerXAnchor.constraint(equalTo: self.view.rightAnchor, constant: -(size/CGFloat(2) + 10) ).isActive = true
            itemView.centerYAnchor.constraint(equalTo: self.view.topAnchor, constant: (size/CGFloat(2) + 10) ).isActive = true
           self.navigationController!.view.layoutIfNeeded()
        }, completion: { _ in itemView.removeFromSuperview() })
        
        UIView.animate(withDuration: animationDuration / 2, animations: {
            itemView.layer.transform = CATransform3DMakeRotation(CGFloat.pi, 0, 0, 1)
            
        }, completion: { _ in
            UIView.animate(withDuration: animationDuration / 2, animations: {
                itemView.layer.transform = CATransform3DIdentity
            })
        })
    }
}

class CircledButton: UIButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.size.width / 2
    }
    var isCircleVisible: Bool = false {
        didSet {
            if isCircleVisible {
                clipsToBounds = true
                //layer.borderColor = UIColor(red: 1 , green: 0.5, blue: 0.5, alpha: 1).cgColor
                
               layer.borderColor = UIColor.salmonColor.cgColor
                
                layer.borderWidth = 2
            }else {
                layer.borderWidth = 0
            }
            
        }
    }
}

//let salmonColor = UIColor(red: 255, green: 102, blue:102, alpha: 1)
//255/255.0

extension UIColor {
    static let salmonColor: UIColor = UIColor(red: 1, green:
        102/255.0, blue:102/255.0, alpha: 1)
   
}
