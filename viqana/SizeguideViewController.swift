//
//  SizeguideViewController.swift
//  viqana
//
//  Created by Ahmad Younis on 11/17/17.
//  Copyright © 2017 Ahmad Younis. All rights reserved.
//

import UIKit

struct Section {
    let name: String
    let items: [Item]
    struct Item {
        let name: String
        let cm: Double
        var inches: Double {
            return  cm * 2.54
        }
    }
    
}

class SizeguideViewController: UITableViewController {

    var sections: [Section] = [
    
        Section(name: "S" , items:
            [.init(name: "Shoulder(cm)" ,  cm: 60),
                .init(name: "Buct(cm)" , cm: 60),
                   .init(name: "Sleeve Length(cm)" , cm: 60),
                   .init(name: "Length(cm)" , cm: 60),
    
        ]),
                               
    Section(name: "M" , items:
        [.init(name: "Shoulder(cm)" , cm: 60),
         .init(name: "Buct(cm)" , cm: 60),
         .init(name: "Sleeve Length(cm)" , cm: 60),
         .init(name: "Length(cm)" , cm: 60),
         ]),
    
    
    Section(name: "L" , items:
        [.init(name: "Shoulder(cm)" , cm: 60),
         .init(name: "Buct(cm)" , cm: 60),
         .init(name: "Sleeve Length(cm)" , cm: 60),
         .init(name: "Length(cm)" , cm: 60),
         ]),
    
    ]
 
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StyleGuideCell", for: indexPath) as! StyleGuideCell
        let item = sections[indexPath.section].items[indexPath.row]
        cell.leftLabel.text = item.name
        cell.middleLabel.text = "\(item.inches)"
        cell.rightLabel.text = "\(item.cm)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].name
    }
    /*
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let v: StyleGuideHeader =  Bundle.main.loadNibNamed("StyleGuideHeader", owner: self, options: nil)?.first as! StyleGuideHeader
        v.heightAnchor = NSLayoutDimension(
        //v.leftLabel.text = sections[section].name
        
        return v
    }*/
}


class StyleGuideHeader: UIView {
    //add outlets for 3 labels
}


