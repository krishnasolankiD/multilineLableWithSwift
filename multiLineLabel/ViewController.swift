//
//  ViewController.swift
//  multiLineLabel
//
//  Created by Mshc on 31/05/17.
//  Copyright © 2017 mshc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tblView: UITableView!
    var data = ["Row 1", "Row 2", "Row 3", "Row 4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tblView.delegate = self
        tblView.dataSource = self
        tblView.estimatedRowHeight = 30
        tblView.rowHeight = UITableViewAutomaticDimension
        tblView.estimatedSectionHeaderHeight = 30.0
        tblView.sectionHeaderHeight = UITableViewAutomaticDimension
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
      //   let randomNum = Int(arc4random_uniform(4)) + 1
  
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as! CustomCell
        cell.contentView.backgroundColor = UIColor.lightGray
        let text = "fvvs vs nvknmwbkfmnkb mmb bkmkf bkmb mkrt mbhm gb mdfkbm ms mmgkymbkdsmbjkmjgbjmkm nb,fvvs vs nvknmwbkfmnkb mmb bkmkf bkmb mkrt mbhm gb mdfkbm ms mmgkymbkdsmbjkmjgbjmkm nbfvvs vs nvknmwbkfmnkb mmb bkmkf bkmb mkrt mbhm gb mdfkbm ms mmgkymbkdsmbjkmjgbjmkm nbfvvs b"// String(repeating: "This is some text for the cell itself to see what happens.", count: randomNum)
        cell.mainLabel.text = text
        return cell.contentView
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
        
    //    let randomNum = Int(arc4random_uniform(4)) + 1
        let text = "fvvs vs nvknmwbkfmnkb mmb bkmkf bkmb mkrt mbhm gb mdfkbm ms mmgkymbkdsmbjkmjgbjmkm nb,fvvs vs nvknmwbkfmnkb mmb bkmkf bkmb mkrt mbhm gb mdfkbm ms mmgkymbkdsmbjkmjgbjmkm nbfvvs vs nvknmwbkfmnkb mmb bkmkf bkmb mkrt mbhm gb mdfkbm ms mmgkymbkdsmbjkmjgbjmkm nbfvvs b"//String(repeating: "This is some text for the cell itself to see what happens.", count: randomNum)
        cell.mainLabel.text = text
        return cell
    }

}
class CustomHeaderView: UITableViewHeaderFooterView {

    @IBOutlet var label: UILabel!
}

class CustomCell: UITableViewCell {
    
    @IBOutlet weak var mainLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mainLabel.numberOfLines = 0
        mainLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        mainLabel.preferredMaxLayoutWidth = mainLabel.frame.size.width
        mainLabel.text = nil
        layoutIfNeeded()
        setNeedsLayout()
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        mainLabel.text = nil
        
        
    }
    
    func setup() {
        let randomNum = Int(arc4random_uniform(4)) + 1
        
        let text = String(repeating: "This is where the really long text goes so that it will wrap lines appropriately", count: randomNum)
        
        
        mainLabel.preferredMaxLayoutWidth = mainLabel.frame.size.width
        mainLabel.text = text
        
     
    }
}

