//
//  WebImageExtension.swift
//  Project
//
//  Created by jeevan tiwari on 7/17/21.
//

import SDWebImage
extension UIImageView{
    func addImage(_ url: String?, _ placeholder: UIImage){
        if let unwrappedURL = url{
            self.sd_setImage(with: URL(string: unwrappedURL), placeholderImage: placeholder)
        }else{
            self.image = placeholder
        }
    }
}
