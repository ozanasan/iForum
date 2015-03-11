//
//  CheckRecognizer.swift
//  Forum
//
//  Created by Ozan Asan on 10/03/15.
//  Copyright (c) 2015 OzanAsan. All rights reserved.
//

import Foundation
import UIKit

//a custom gesture recognizer to catch a v shaped checker.
class CheckRecognizer : UIGestureRecognizer {
    
    var startPoint : CGPoint!
    var rightdown = false
    var leftup = false
    
    override func reset() {
        super.reset()
        self.rightdown = false
        self.leftup = false
    }
    
    override func touchesBegan(touches: NSSet!, withEvent event: UIEvent!)  {
        if let theTouch: UITouch = touches.anyObject() as? UITouch {
            startPoint = theTouch.locationInView(self.view)
        }
    }
    
    override func touchesMoved(touches: NSSet!, withEvent event: UIEvent!) {
        
        let theTouch: UITouch = touches.anyObject() as UITouch
        let movedPoint = theTouch.locationInView(self.view)
        let previousPoint = theTouch.previousLocationInView(self.view)
        
        var movedRightDownThisTime : Bool  = checkDirection(previousPoint, end : movedPoint, checker : {return (($1.x - $0.x > 0) && ($1.y - $0.y > 0))} )
        var movedLeftUpThisTime : Bool = checkDirection(previousPoint, end : movedPoint, checker : {return (($1.x - $0.x > 0) && ($0.y - $1.y > 0))} )
        
        switch (movedRightDownThisTime, movedLeftUpThisTime, self.leftup, self.rightdown) {
        case (true, _, false, _):
            self.rightdown = true
        case(true, _, true, _):
            self.state = UIGestureRecognizerState.Failed
            self.reset()
        case(_, true, _, true):
            self.leftup = true;
            self.state = UIGestureRecognizerState.Ended
        case(_, true, _, false):
            self.state = UIGestureRecognizerState.Failed
            self.reset()
        default:
            break
        }
    }
    
    override func touchesEnded(touches: NSSet!, withEvent event: UIEvent!) {
        self.reset()
    }
    
    //I could do this with using two different functions, but I wanted to take the opportunity and use "functions as parameters" in Swift
    func checkDirection(start : CGPoint, end : CGPoint, checker : (CGPoint, CGPoint) -> Bool) -> Bool {
        return checker(start, end)
    }
}
