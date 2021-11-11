
import UIKit

extension UILabel {
    convenience init(text: String, font: UIFont, numberOfLines: Int = 1) {
        self.init(frame: .zero)
        self.text = text
        self.font = font
        self.numberOfLines = numberOfLines
    }
}

extension UIImageView {
    convenience init(cornerRadius: CGFloat /* width: CGFloat = 0, height: CGFloat = 0*/ ) {
        self.init(image: nil)
        self.layer.cornerRadius = cornerRadius
        self.contentMode = .scaleAspectFill
        self.clipsToBounds = true
//        self.constrainWidth(constant: width)
//        self.constrainHeight(constant: height)
    }
}

extension UIButton {
    convenience init(title: String, cornerRadius: CGFloat?, color: UIColor?, width: CGFloat?, height: CGFloat?, font: UIFont?, titleColor: UIColor? = .white) {
        self.init(type: .system)
        self.setTitle(title, for: .normal)
        self.layer.cornerRadius = cornerRadius ?? 0
        self.layer.backgroundColor = (color ?? nil)?.cgColor
        self.titleLabel?.font = font 
        self.constrainWidth(constant: width ?? 0)
        self.constrainHeight(constant: height ?? 0)
        self.setTitleColor(titleColor, for: .normal)
    }
}
