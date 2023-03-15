//
// Created by Denis Yūgen
//

import UIKit

extension ProfileViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return ProfileViewController.posts.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: PhotosTableViewCell.identifier, for: indexPath) as! PhotosTableViewCell
            cell.delegate = self
            cell.configureCell(photo: PhotosViewController.photos[indexPath.row])
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
            cell.configureCell(post: ProfileViewController.posts[indexPath.row])
            return cell
        }
    }
}

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 220 : 0
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            header.delegate = self
            return header
        } else {
            return nil
        }
    }
}

extension ProfileViewController: PhotosTableViewCellDelegate {
    func tapAction() {
        navigationController?.pushViewController(PhotosViewController(), animated: true)
    }
}

extension ProfileViewController: ProfileHeaderViewDelegate {
    func avatarTap(_ image: UIImage?, imageFrame: CGRect) {
        let frame = header.frame
        let currentHeaderFrame = tableView.convert(frame, to: view)
        
        initialImageFrame = CGRect(x: imageFrame.origin.x,
                                   y: imageFrame.origin.y + currentHeaderFrame.origin.y,
                                   width: imageFrame.width,
                                   height: imageFrame.height)

        animateAvatar(image, imageFrame: initialImageFrame)
    }
}

extension ProfileViewController {
    static let posts: [Post] = [Post(title: "Новость",
                                     author: "Доктор Ливси",
                                     description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ac neque maximus, dignissim metus non, porttitor arcu. Praesent id ex molestie, scelerisque justo sit amet, ultrices ex. Praesent metus augue, facilisis ac magna ac, eleifend facilisis justo. Sed et nisl.",
                                     image: "1",
                                     likes: 29,
                                     views: 45),
                                Post(title: "Ещё новость",
                                     author: "Доктор Ливси",
                                     description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ac neque maximus, dignissim metus non, porttitor arcu. Praesent id ex molestie, scelerisque justo sit amet, ultrices ex. Praesent metus augue, facilisis ac magna ac, eleifend facilisis justo. Sed et nisl.",
                                     image: "2",
                                     likes: 10,
                                     views: 33),
                                Post(title: "Та ещё новость",
                                     author: "Доктор Ливси",
                                     description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ac neque maximus, dignissim metus non, porttitor arcu. Praesent id ex molestie, scelerisque justo sit amet, ultrices ex. Praesent metus augue, facilisis ac magna ac, eleifend facilisis justo. Sed et nisl.",
                                     image: "3",
                                     likes: 47,
                                     views: 96),
                                Post(title: "И снова новость",
                                     author: "Доктор Ливси",
                                     description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ac neque maximus, dignissim metus non, porttitor arcu. Praesent id ex molestie, scelerisque justo sit amet, ultrices ex. Praesent metus augue, facilisis ac magna ac, eleifend facilisis justo. Sed et nisl.",
                                     image: "4",
                                     likes: 3,
                                     views: 45)]
}
