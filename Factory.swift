import Foundation

struct Factory {
    
    static func table(sectionInsets: NSEdgeInsets? = nil,
                      maxItemSize: NSSize,
                      lineSpacing: CGFloat = 0,
                      interitemSpacing: CGFloat = 5,
                      columns: UInt = 1,
                      backgroundColor: NSColor = .clear,
                      selectable: Bool = true,
                      allowsMultipleSelection: Bool = false,
                      superview: NSView? = nil) -> (collectionView: NSCollectionView, scrollViewContainer: NSScrollView) {
        let flowLayout = NSCollectionViewFlowLayout()
        if let inset = sectionInsets {
            flowLayout.sectionInset = inset
        }
        flowLayout.minimumInteritemSpacing = interitemSpacing
        flowLayout.minimumLineSpacing = lineSpacing
        flowLayout.estimatedItemSize = NSSize(width: 1, height: 1) // important!
        // configure the collection itself
        let collectionView = NSCollectionView(frame: .zero)
        collectionView.wantsLayer = true
        collectionView.layer!.backgroundColor = backgroundColor.cgColor
        collectionView.collectionViewLayout = flowLayout
        collectionView.maxItemSize = NSSize(width: maxItemSize.width, height: maxItemSize.height) // important!
        collectionView.maxNumberOfColumns = Int(columns)
        collectionView.isSelectable = selectable
        collectionView.allowsMultipleSelection = allowsMultipleSelection
        // configure wrapping scroll (necessary for support collection view's scrolling)
        let scrollView = NSScrollView(frame: .zero)
        scrollView.documentView = collectionView
        superview?.addSubview(scrollView)
        return (collectionView, scrollView)
    }
    
}
