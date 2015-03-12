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
    
    var rightdown = false
    var rightup = false
    
    override func reset() {
        super.reset()
        self.rightdown = false
        self.rightup = false
    }
    
    override func touchesMoved(touches: NSSet!, withEvent event: UIEvent!) {
        let theTouch: UITouch = touches.anyObject() as UITouch
        let movedPoint = theTouch.locationInView(self.view)
        let previousPoint = theTouch.previousLocationInView(self.view)
        
        var movedRightDownThisTime : Bool  = checkDirection(previousPoint, end : movedPoint, checker : {(($1.x - $0.x > 0) && ($1.y - $0.y > 0))} )
        var movedRigthUpThisTime : Bool = checkDirection(previousPoint, end : movedPoint, checker : {(($1.x - $0.x > 0) && ($0.y - $1.y > 0))} )
        
        //I am adding this to be able to flag a .Failed case better. 
        //I used to check movedRightDownThisTime and movedLeftUpThisTime and if they both are false, I made it a .Failed
        //But apperantly, sometimes when you make small moves on screen, one of the coordinates stays same which leads both movedRightDownThisTime and movedLeftUpThisTime to become false at this small moment, so I am checking this condition here to exclude it.
        var anyCoordinateEqual : Bool = checkDirection(previousPoint, end: movedPoint, checker: {($1.x == $0.x) || ($1.y == $0.y)})
        
        switch (movedRightDownThisTime, movedRigthUpThisTime, self.rightup, self.rightdown, anyCoordinateEqual) {
            //if touch moved rigth down this time, and has never gone right up, everthing is fine.
            case (true, _, false, _, _):
                self.rightdown = true
            //moved right down this time, but moved right up before that. This is a fail.
            case(true, _, true, _, _):
                self.state = UIGestureRecognizerState.Failed
            //moved rigth up this time, and moved right down in the past. This is a checker!
            case(_, true, _, true, _):
                self.rightup = true
                self.state = UIGestureRecognizerState.Ended
            //moved rigth up this time bu never did move rigth down in the past. This is a fail.
            case(_, true, _, false, _):
                self.state = UIGestureRecognizerState.Failed
            //if touch did not move in either rigthup nor rightdown direction, and anyCoordinateEqual is false, this is s fail. 
            case(false, false, _, _, false):
                self.state = UIGestureRecognizerState.Failed
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
