import Foundation
import SnapKit

class ViewController: NSViewController {
    
    var backgroundColor: NSColor = .clear {
        didSet {
            view.layer?.backgroundColor = backgroundColor.cgColor
        }
    }
    
    var minSize: CGSize {
        fatalError() // must be overridden
    }
    
    override func loadView() {
        view = NSView()
        view.wantsLayer = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundColor = .white
        make()
        bind()
        localize()
    }
    
    override func viewWillAppear() {
        super.viewWillAppear()
        reloadData()
    }
    
    func make() {
        // empty
    }
    
    override func updateViewConstraints() {
        view.snp.updateConstraints { (make) in
            make.size.greaterThanOrEqualTo(minSize)
        }
        super.updateViewConstraints()
    }
    
    func localize() {
        // empty
    }
    
    func bind() {
        // empty
    }
    
    @objc func reloadData() {
        // empty
    }
    
}
