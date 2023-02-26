//
// Created by Denis Yūgen
//

import Foundation

struct Post {
    let title: String
    let author: String
    let description: String
    let image: String
    let likes: Int
    let views: Int
}

let posts: [Post] = [Post(title: "Новость",
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
