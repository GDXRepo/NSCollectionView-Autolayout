final class ConcreteViewController: ViewController {
    
    private var scrollView: NSScrollView!
    private var collectionView: NSCollectionView!
    
    override var minSize: CGSize {
        return CGSize(width: Const.Size.maxLeftSideWidth, height: Const.Size.minWindowSize.height)
    }
    
    override func make() {
        super.make()
        backgroundColor = .darkGray
        // configure collection
        let table = Factory.table(maxItemSize: NSSize(width: minSize.width, height: 1000), superview: view)
        collectionView = table.collectionView
        scrollView = table.scrollViewContainer
        collectionView.register(ConcreteCollectionViewItem.self, forItemWithIdentifier: ConcreteCollectionViewItem.reuseId)
    }
    
    override func updateViewConstraints() {
        scrollView.snp.updateConstraints { (make) in
            make.edges.equalTo(0)
        }
        super.updateViewConstraints()
    }
    
    override func bind() {
        collectionView.dataSource = self
        collectionView.delegate = self
        super.bind()
    }
    
    override func reloadData() {
        systemButtons.reloadData()
        collectionView.reloadData()
        super.reloadData()
    }
    
}

extension ConcreteViewController: NSCollectionViewDataSource, NSCollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20 // use your data source instead
    }

    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let item = collectionView.makeItem(withIdentifier: ConcreteCollectionViewItem.reuseId, for: indexPath)
        guard let concreteItem = item as? ConcreteCollectionViewItem else {
            return item
        }
        // populate the model for the actual item
        menuconcreteItemItem.model = ConcreteCollectionViewItem.Model(
            title: "My item title"
        )
        return concreteItem
    }
    
    func collectionView(_ collectionView: NSCollectionView, didSelectItemsAt indexPaths: Set<IndexPath>) {
        // react on selection
        // ...
    }
    
    func collectionView(_ collectionView: NSCollectionView,
                        layout collectionViewLayout: NSCollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> NSSize {
        // do the same thing as when you create an actual item
        let item = collectionView.makeItem(withIdentifier: ConcreteCollectionViewItem.reuseId, for: indexPath)
        guard let concreteItem = item as? ConcreteCollectionViewItem else {
            return .zero
        }
        // populate the model for the actual item
        concreteItem.model = ConcreteCollectionViewItem.Model(
            title: "My item title"
        )
        // then return .fittingSize in this method.
        // If your constraints for ConcreteCollectionViewItem are correct, you will get items with dynamic height, as expected
        return concreteItem.view.fittingSize
    }

}
