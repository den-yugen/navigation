//
// Created by Denis Yūgen
//

import UIKit

final class PostTableViewCell: UITableViewCell {
    private let postContentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .white
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()

    private let postTitle: UILabel = {
        let postTitle = UILabel()
        postTitle.font = UIFont.systemFont(ofSize: Metric.titleTextSize, weight: .bold)
        postTitle.textColor = .black
        postTitle.numberOfLines = 0
        postTitle.translatesAutoresizingMaskIntoConstraints = false
        return postTitle
    }()

    private let postImage: UIImageView = {
        let postImage = UIImageView()
        postImage.contentMode = .scaleAspectFit
        postImage.backgroundColor = .black
        postImage.translatesAutoresizingMaskIntoConstraints = false
        return postImage
    }()

    private let postDescription: UILabel = {
        let postDescription = UILabel()
        postDescription.font = UIFont.systemFont(ofSize: Metric.defaultTextSize, weight: .regular)
        postDescription.textColor = .systemGray
        postDescription.numberOfLines = 0
        postDescription.translatesAutoresizingMaskIntoConstraints = false
        return postDescription
    }()

    private let likes: UILabel = {
        let likes = UILabel()
        likes.font = UIFont.systemFont(ofSize: Metric.defaultTextSize, weight: .regular)
        likes.textColor = .black
        likes.translatesAutoresizingMaskIntoConstraints = false
        return likes
    }()

    private let views: UILabel = {
        let views = UILabel()
        views.font = UIFont.systemFont(ofSize: Metric.defaultTextSize, weight: .regular)
        views.textColor = .black
        views.translatesAutoresizingMaskIntoConstraints = false
        return views
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
        likes.text = ""
        views.text = ""
    }

    func configureCell(post: Post) {
        postTitle.text = post.title
        postImage.image = UIImage(named: post.image)
        postDescription.text = post.description
        likes.text = "Нравится: \(post.likes)"
        views.text = "Просмотры: \(post.views)"
    }

    private func configureLayout() {
        contentView.addSubview(postContentView)
        contentView.addSubview(postTitle)
        contentView.addSubview(postImage)
        contentView.addSubview(postDescription)
        contentView.addSubview(likes)
        contentView.addSubview(views)

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
            postImage.heightAnchor.constraint(equalTo: contentView.widthAnchor),

            postDescription.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: Metric.defaultInset),
            postDescription.leadingAnchor.constraint(equalTo: postContentView.leadingAnchor, constant: Metric.defaultInset),
            postDescription.trailingAnchor.constraint(equalTo: postContentView.trailingAnchor, constant: -Metric.defaultInset),

            likes.topAnchor.constraint(equalTo: postDescription.bottomAnchor, constant: Metric.defaultInset),
            likes.leadingAnchor.constraint(equalTo: postContentView.leadingAnchor, constant: Metric.defaultInset),
            likes.bottomAnchor.constraint(equalTo: postContentView.bottomAnchor, constant: -Metric.defaultInset),

            views.topAnchor.constraint(equalTo: postDescription.bottomAnchor, constant: Metric.defaultInset),
            views.trailingAnchor.constraint(equalTo: postContentView.trailingAnchor, constant: -Metric.defaultInset),
            views.bottomAnchor.constraint(equalTo: postContentView.bottomAnchor, constant: -Metric.defaultInset)
        ])
    }
}

