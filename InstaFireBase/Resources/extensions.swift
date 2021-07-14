//
//  extensions.swift
//  InstaFireBase
//
//  Created by A.M on 6/27/21.
//

import Foundation
import UIKit

extension UIView {
    
    public var width:CGFloat {
        return frame.size.width
    }
    
    public var hight:CGFloat {
        return frame.size.height
    }
    public var top:CGFloat {
        return frame.origin.y
    }
    public var bottom:CGFloat {
        return frame.origin.y + frame.size.height
    }
    
    public var left:CGFloat {
        return frame.origin.x
    }
    
    public var right:CGFloat {
        return frame.origin.x + frame.width
    }
    
    
}
extension String {
    
        func safeDatabaseKey() -> String{
            
        return self.replacingOccurrences(of: "@", with: "-")
        return self.replacingOccurrences(of: ".", with: "-")
        
    }
}
