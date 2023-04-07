//
// Created by Denis Yūgen
//

import UIKit

class DetailedPostView: UIView {
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.disableAutoresizingMask()
        return scrollView
    }()
    
    private let postContentView: UIView = {
        let contentView = UIView()
        contentView.disableAutoresizingMask()
        return contentView
    }()

    private let postTitle: UILabel = {
        let postTitle = UILabel()
        postTitle.font = UIFont.systemFont(ofSize: Metric.titleTextSize, weight: .bold)
        postTitle.textColor = .black
        postTitle.numberOfLines = 0
        postTitle.disableAutoresizingMask()
        return postTitle
    }()

    private let postImage: UIImageView = {
        let postImage = UIImageView()
        postImage.contentMode = .scaleAspectFill
        postImage.clipsToBounds = true
        postImage.backgroundColor = .black
        postImage.disableAutoresizingMask()
        return postImage
    }()

    private let postDescription: UILabel = {
        let postDescription = UILabel()
        postDescription.font = UIFont.systemFont(ofSize: Metric.defaultTextSize, weight: .regular)
        postDescription.textColor = .systemGray
        postDescription.numberOfLines = 0
        postDescription.disableAutoresizingMask()
        return postDescription
    }()

    private let commentsTitle: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: Metric.defaultTextSize, weight: .bold)
        title.textColor = .systemGray
        title.numberOfLines = 1
        title.disableAutoresizingMask()
        return title
    }()

    private let postComments: UILabel = {
        let comment = UILabel()
        comment.font = UIFont.systemFont(ofSize: Metric.defaultTextSize, weight: .regular)
        comment.textColor = .systemGray
        comment.numberOfLines = 0
        comment.disableAutoresizingMask()
        return comment
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        configureLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureCell(post: Post) {
        postTitle.text = post.title
        postImage.image = UIImage(named: post.image)
        postDescription.text = post.description
        if post.comments != nil {
            commentsTitle.text = "Комментарии:"
        }
        postComments.text = post.comments
    }

    private func configureLayout() {
        addSubview(scrollView)
        scrollView.addSubview(postContentView)
        postContentView.addSubview(postTitle)
        postContentView.addSubview(postImage)
        postContentView.addSubview(postDescription)
        postContentView.addSubview(commentsTitle)
        postContentView.addSubview(postComments)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),

            postContentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            postContentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            postContentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            postContentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            postContentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            postTitle.topAnchor.constraint(equalTo: postContentView.topAnchor, constant: Metric.defaultInset),
            postTitle.leadingAnchor.constraint(equalTo: postContentView.leadingAnchor, constant: Metric.defaultInset),
            postTitle.trailingAnchor.constraint(equalTo: postContentView.trailingAnchor, constant: -Metric.defaultInset),

            postImage.topAnchor.constraint(equalTo: postTitle.bottomAnchor, constant: 12),
            postImage.leadingAnchor.constraint(equalTo: postContentView.leadingAnchor),
            postImage.trailingAnchor.constraint(equalTo: postContentView.trailingAnchor),
            postImage.heightAnchor.constraint(equalToConstant: 250),

            postDescription.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: Metric.defaultInset),
            postDescription.leadingAnchor.constraint(equalTo: postContentView.leadingAnchor, constant: Metric.defaultInset),
            postDescription.trailingAnchor.constraint(equalTo: postContentView.trailingAnchor, constant: -Metric.defaultInset),

            commentsTitle.topAnchor.constraint(equalTo: postDescription.bottomAnchor, constant: Metric.defaultInset),
            commentsTitle.leadingAnchor.constraint(equalTo: postContentView.leadingAnchor, constant: Metric.defaultInset),

            postComments.topAnchor.constraint(equalTo: commentsTitle.bottomAnchor, constant: Metric.defaultInset),
            postComments.leadingAnchor.constraint(equalTo: postContentView.leadingAnchor, constant: Metric.defaultInset),
            postComments.trailingAnchor.constraint(equalTo: postContentView.trailingAnchor, constant: -Metric.defaultInset),
            postComments.bottomAnchor.constraint(equalTo: postContentView.bottomAnchor, constant: -Metric.defaultInset)
        ])
    }
}

extension DetailedPostView {
    enum Metric {
        static let defaultTextSize: CGFloat = 14
        static let titleTextSize: CGFloat = 20
        static let defaultInset: CGFloat = 16
    }
}
