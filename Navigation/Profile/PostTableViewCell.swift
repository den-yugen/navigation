//
// Created by Denis Yūgen
//

import UIKit

final class PostTableViewCell: UITableViewCell {

    var likesCounter = Int()
    var postViews = Int()

    private let postContentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .white
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
        postDescription.numberOfLines = 3
        postDescription.disableAutoresizingMask()
        return postDescription
    }()

    private lazy var likeButton: UIButton = {
        let likes = UIButton()
        likes.setBackgroundImage(UIImage(systemName: "heart"), for: .normal)
        likes.tintColor = .black
        likes.disableAutoresizingMask()
        likes.addTarget(self, action: #selector(pressLike), for: .touchUpInside)
        return likes
    }()

    private var likesCounterView: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: Metric.defaultTextSize, weight: .regular)
        label.textColor = .black
        label.disableAutoresizingMask()
        return label
    }()

    private let viewsImage: UIImageView = {
        let views = UIImageView()
        views.image = UIImage(systemName: "eye")
        views.tintColor = .black
        views.disableAutoresizingMask()
        return views
    }()

    private let viewsCounterView: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: Metric.defaultTextSize, weight: .regular)
        label.textColor = .black
        label.disableAutoresizingMask()
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        postTitle.text = ""
        postImage.image = nil
        postDescription.text = ""
        likeButton.setTitle("", for: .normal)
    }

    func configureCell(post: Post) {
        postTitle.text = post.title
        postImage.image = UIImage(named: post.image)
        postDescription.text = post.description
        likesCounterView.text = "\(post.likes)"
        likesCounter = post.likes
        viewsCounterView.text = "\(post.views)"
        postViews = post.views
    }

    @objc func pressLike() {
        likeButton.setBackgroundImage(UIImage(systemName: "heart.fill"), for: .normal)
        likeButton.tintColor = .red
        likesCounter += 1
        likesCounterView.textColor = .red
        likesCounterView.text = "\(likesCounter)"
    }

    private func configureLayout() {
        contentView.addSubview(postContentView)
        contentView.addSubview(postTitle)
        contentView.addSubview(postImage)
        contentView.addSubview(postDescription)
        contentView.addSubview(likeButton)
        contentView.addSubview(likesCounterView)
        contentView.addSubview(viewsImage)
        contentView.addSubview(viewsCounterView)

        NSLayoutConstraint.activate([
            postContentView.topAnchor.constraint(equalTo: contentView.topAnchor),
            postContentView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            postContentView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            postContentView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

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

            likeButton.topAnchor.constraint(equalTo: postDescription.bottomAnchor, constant: Metric.defaultInset),
            likeButton.leadingAnchor.constraint(equalTo: postContentView.leadingAnchor, constant: Metric.defaultInset),
            likeButton.bottomAnchor.constraint(equalTo: postContentView.bottomAnchor, constant: -Metric.defaultInset),

            likesCounterView.centerYAnchor.constraint(equalTo: likeButton.centerYAnchor),
            likesCounterView.leadingAnchor.constraint(equalTo: likeButton.trailingAnchor, constant: 5),

            viewsCounterView.topAnchor.constraint(equalTo: postDescription.bottomAnchor, constant: Metric.defaultInset),
            viewsCounterView.trailingAnchor.constraint(equalTo: postContentView.trailingAnchor, constant: -Metric.defaultInset),
            viewsCounterView.bottomAnchor.constraint(equalTo: postContentView.bottomAnchor, constant: -Metric.defaultInset),

            viewsImage.topAnchor.constraint(equalTo: postDescription.bottomAnchor, constant: Metric.defaultInset),
            viewsImage.trailingAnchor.constraint(equalTo: viewsCounterView.leadingAnchor, constant: -5),
            viewsImage.bottomAnchor.constraint(equalTo: postContentView.bottomAnchor, constant: -Metric.defaultInset)
        ])
    }
}
