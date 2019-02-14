
import UIKit

class CircularForceView: UIView {
    
    let circlePathLayer = CAShapeLayer()
    let circleRadius: CGFloat = 150.0
    
    var progress: CGFloat {
        get {
            
            return circlePathLayer.strokeEnd
            
        }
        
        set {
            
            if (newValue > 1) {
                
                circlePathLayer.strokeEnd = 1
                
            } else if (newValue < 0) {
                
                circlePathLayer.strokeEnd = 0
                
            } else {
                
                circlePathLayer.strokeEnd = newValue
                
            }
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        configure()
    }
    
    func configure() {
        
        circlePathLayer.frame = bounds
        circlePathLayer.lineWidth = 4
        circlePathLayer.fillColor = UIColor.clear.cgColor
        circlePathLayer.strokeColor = UIColor.white.cgColor
        
        layer.addSublayer(circlePathLayer)
        backgroundColor = UIColor.clear
        
        progress = 0
    }
    
    func circleFrame() -> CGRect {
        var circleFrame = CGRect(x: 0, y: 0, width: 2*circleRadius, height: 2*circleRadius)
        
        circleFrame.origin.x = circlePathLayer.bounds.midX - circleFrame.midX
        circleFrame.origin.y = circlePathLayer.bounds.midY - circleFrame.midY
        
        return circleFrame
    }
    
    func circlePath() -> UIBezierPath {
        return UIBezierPath(ovalIn: circleFrame())
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        circlePathLayer.frame = bounds
        circlePathLayer.path = circlePath().cgPath
    }
    

    
     func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        superview?.layer.mask = nil
    }

}
