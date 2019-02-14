import Foundation
import SnapKit

final class ConcreteCollectionViewItem: CollectionViewItem<MenuCollectionViewItem.Model> {
    
    struct Model: ViewModel {
        
        let title: String
        
    }
    
    private var titleLabel: NSTextField!
    
    override func make() {
        super.make()
        // make label
        let titleLabel = NSTextField(frame: .zero)
        titleLabel.font = NSFont.systemFont(ofSize: 13)
        titleLabel.textColor = .black
        titleLabel.maximumNumberOfLines = 0
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.isBezeled = false
        titleLabel.isEditable = false
        titleLabel.drawsBackground = false
        view.addSubview(titleLabel)
    }
    
    override func updateViewConstraints() {
        titleLabel.snp.updateConstraints { (make) in
            make.left.equalTo(16)
            make.top.greaterThanOrEqualTo(7)
            make.right.equalTo(-16)
            make.bottom.lessThanOrEqualTo(-7)
        }
        super.updateViewConstraints()
    }
    
    override func reloadData() {
        guard let m = model else {
            titleLabel.stringValue.removeAll()
            return
        }
        titleLabel.stringValue = m.title
        super.reloadData()
    }
    
}
