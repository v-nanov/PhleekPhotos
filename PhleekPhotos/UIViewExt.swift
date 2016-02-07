import UIKit

extension UIView {
    func bezierPathWithCornerRadius(cornerRadius: CGFloat, rect: CGRect, corners: UIRectCorner) -> UIBezierPath {
        let radii = CGSizeMake(cornerRadius, cornerRadius)
        return UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: radii)
    }
    
    func applyCornerRadiusMaskWithCornerRadius(cornerRadius: CGFloat, rect: CGRect, corners: UIRectCorner) {
        let cornerPath = self.bezierPathWithCornerRadius(cornerRadius, rect: self.bounds, corners: corners)
        
        let cornerMaskLayer = CAShapeLayer()
        cornerMaskLayer.shouldRasterize = true
        cornerMaskLayer.rasterizationScale = UIScreen.mainScreen().scale
        cornerMaskLayer.path = cornerPath.CGPath
        cornerMaskLayer.masksToBounds = false
        self.layer.mask = cornerMaskLayer
        
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.mainScreen().scale
        self.layer.masksToBounds = true
    }
    
    func applyCornerRadiusMaskWithCornerRadius(cornerRadius: CGFloat, corners: UIRectCorner) {
        self.applyCornerRadiusMaskWithCornerRadius(cornerRadius, rect: self.bounds, corners: corners)
    }
}
