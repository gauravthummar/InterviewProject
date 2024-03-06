//
//  class PortraitPlayerPlayListCell- UITableViewCell {.swift
//  InterviewProject
//
//  Created by Gauravkumar Thummar on 2022-03-29.
//

import Foundation
import UIKit

class houseCell: UITableViewCell {

    @IBOutlet private weak var price:  UILabel?
    @IBOutlet private weak var street:  UILabel?
    @IBOutlet private weak var postalCode:  UILabel?
    @IBOutlet private weak var state:  UILabel?
    
    public var house: house? = nil {
        didSet {
            self.updateUI()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    
    private func updateUI() {
        price?.text = String(house?.price ?? 0)
        let address = house?.address.components(separatedBy: ",")
        street?.text = address?[0]
        postalCode?.text = address?[1]
        state?.text = address?[2]
    
    }
}
