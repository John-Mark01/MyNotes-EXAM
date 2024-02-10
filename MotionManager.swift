//
//  MotionManager.swift
//  MyNotes
//
//  Created by John-Mark Iliev on 4.02.24.
//

import Foundation
import CoreMotion


protocol MotionManagerDelegate {
    
    func didDetectMovement()
}


class MotionManager {

    var delegate: MotionManagerDelegate?
    
    let motionManager = CMMotionManager()
    
    
    func startUpdates() {
        if motionManager.isAccelerometerAvailable == true {
            motionManager.accelerometerUpdateInterval = 0.1
            motionManager.startAccelerometerUpdates(to: OperationQueue.main) { data, error in
                if let error = error {
                    print("Error in motion manager \(error)")
                    return
                }
                if let acceleration = data?.acceleration {
                    let tiltDegree = 0.5
                    
                    if acceleration.z > tiltDegree {
                        self.delegate?.didDetectMovement()
                    }
                }
            }
        }
    }
    
    func stopUpdates() {
        if motionManager.isAccelerometerActive {
            motionManager.stopAccelerometerUpdates()
        }
    }
}
