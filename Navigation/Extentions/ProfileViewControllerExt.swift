//
// Created by Denis Yūgen
//

import UIKit

extension ProfileViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : Post.posts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: PhotosTableViewCell.identifier, for: indexPath) as! PhotosTableViewCell
            cell.delegate = self
            cell.configureCell(photo: PhotosViewController.photos[indexPath.row])
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
            cell.configureCell(post: Post.posts[indexPath.row])
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

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section != 0 {
            let detailedPost = DetailedPostViewController(post: Post.posts[indexPath.row], indexPath: indexPath)
            present(detailedPost, animated: true)
        }
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            Post.posts.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
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
