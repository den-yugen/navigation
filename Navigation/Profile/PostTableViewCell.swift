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
        postTitle.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        postTitle.textColor = .black
        postTitle.numberOfLines = 2
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
        postDescription.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        postDescription.textColor = .systemGray
        postDescription.numberOfLines = 0
        postDescription.translatesAutoresizingMaskIntoConstraints = false
        return postDescription
    }()

    private let likes: UILabel = {
        let likes = UILabel()
        likes.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        likes.textColor = .black
        likes.numberOfLines = 1
        likes.translatesAutoresizingMaskIntoConstraints = false
        return likes
    }()

    private let views: UILabel = {
        let views = UILabel()
        views.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        views.textColor = .black
        views.numberOfLines = 1
        views.translatesAutoresizingMaskIntoConstraints = false
        return views
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureLayout()
        configureConstraints()
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
    }

    private func configureConstraints() {
        let defaultInset: CGFloat = 16

        NSLayoutConstraint.activate([
            postContentView.topAnchor.constraint(equalTo: contentView.topAnchor),
            postContentView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            postContentView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            postContentView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            postTitle.topAnchor.constraint(equalTo: postContentView.topAnchor, constant: defaultInset),
            postTitle.leadingAnchor.constraint(equalTo: postContentView.leadingAnchor, constant: defaultInset),
            postTitle.trailingAnchor.constraint(equalTo: postContentView.trailingAnchor, constant: -defaultInset),

            postImage.topAnchor.constraint(equalTo: postTitle.bottomAnchor, constant: 12),
            postImage.leadingAnchor.constraint(equalTo: postContentView.leadingAnchor),
            postImage.trailingAnchor.constraint(equalTo: postContentView.trailingAnchor),
            postImage.heightAnchor.constraint(equalTo: contentView.widthAnchor),

            postDescription.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: defaultInset),
            postDescription.leadingAnchor.constraint(equalTo: postContentView.leadingAnchor, constant: defaultInset),
            postDescription.trailingAnchor.constraint(equalTo: postContentView.trailingAnchor, constant: -defaultInset),

            likes.topAnchor.constraint(equalTo: postDescription.bottomAnchor, constant: defaultInset),
            likes.leadingAnchor.constraint(equalTo: postContentView.leadingAnchor, constant: defaultInset),
            likes.bottomAnchor.constraint(equalTo: postContentView.bottomAnchor, constant: -defaultInset),

            views.topAnchor.constraint(equalTo: postDescription.bottomAnchor, constant: defaultInset),
            views.trailingAnchor.constraint(equalTo: postContentView.trailingAnchor, constant: -defaultInset),
            views.bottomAnchor.constraint(equalTo: postContentView.bottomAnchor, constant: -defaultInset)
        ])
    }
}
