import Foundation
import SnapKit

protocol ViewModel {
    
}

class CollectionViewItem<T: ViewModel>: NSCollectionViewItem {
    
    var model: T? {
        didSet {
            reloadData()
        }
    }
    
    static var reuseId: NSUserInterfaceItemIdentifier {
        return NSUserInterfaceItemIdentifier(self.className())
    }
    
    var backgroundColor: NSColor = .clear {
        didSet {
            view.layer?.backgroundColor = backgroundColor.cgColor
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundColor = .clear
        make()
        bind()
        localize()
    }
    
    override func loadView() {
        view = NSView()
        view.wantsLayer = true
    }
    
    func make() {
        // empty
    }
    
    override func updateViewConstraints() {
        view.snp.updateConstraints { (make) in
            make.width.equalTo(collectionView!.maxItemSize.width) // important!
        }
        super.updateViewConstraints()
    }
    
    func bind() {
        // empty
    }
    
    func localize() {
        // empty
    }
    
    func reloadData() {
        // empty
    }
    
}
