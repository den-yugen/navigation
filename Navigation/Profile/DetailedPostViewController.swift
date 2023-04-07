//
// Created by Denis Yūgen
//

import UIKit

final class DetailedPostViewController: UIViewController {

    private let postView = DetailedPostView()
    private let post: Post
    private let indexPath: IndexPath

    init(post: Post, indexPath: IndexPath) {
        self.post = post
        self.indexPath = indexPath
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = postView
        postView.configureCell(post: post)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
