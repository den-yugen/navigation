//
// Created by Denis Yūgen
//

import UIKit

struct Post {
    let title: String
    let author: String
    let description: String
    let image: String
    let likes: Int
    let views: Int
    let comments: String?

    static var posts: [Post] = [Post(title: "Новость",
                                     author: "Доктор Ливси",
                                     description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ac neque maximus, dignissim metus non, porttitor arcu. Praesent id ex molestie, scelerisque justo sit amet, ultrices ex. Praesent metus augue, facilisis ac magna ac, eleifend facilisis justo. Sed et nisl.",
                                     image: "1",
                                     likes: 29,
                                     views: 45,
                                     comments: "Далеко-далеко за словесными горами в стране гласных и согласных живут рыбные тексты. Вдали от всех живут они в буквенных домах на берегу Семантика большого языкового океана. Маленький ручеек Даль журчит по всей стране и обеспечивает ее всеми необходимыми правилами."),
                                Post(title: "Ещё новость",
                                     author: "Доктор Ливси",
                                     description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ac neque maximus, dignissim metus non, porttitor arcu. Praesent id ex molestie, scelerisque justo sit amet, ultrices ex. Praesent metus augue, facilisis ac magna ac, eleifend facilisis justo. Sed et nisl.",
                                     image: "2",
                                     likes: 10,
                                     views: 33,
                                     comments: "Эта парадигматическая страна, в которой жаренные члены предложения залетают прямо в рот. Даже всемогущая пунктуация не имеет власти над рыбными текстами, ведущими безорфографичный образ жизни. Однажды одна маленькая строчка рыбного текста по имени Lorem ipsum решила выйти в большой мир грамматики."),
                                Post(title: "Та ещё новость",
                                     author: "Доктор Ливси",
                                     description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ac neque maximus, dignissim metus non, porttitor arcu. Praesent id ex molestie, scelerisque justo sit amet, ultrices ex. Praesent metus augue, facilisis ac magna ac, eleifend facilisis justo. Sed et nisl.",
                                     image: "3",
                                     likes: 47,
                                     views: 96,
                                     comments: nil),
                                Post(title: "И снова новость",
                                     author: "Доктор Ливси",
                                     description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ac neque maximus, dignissim metus non, porttitor arcu. Praesent id ex molestie, scelerisque justo sit amet, ultrices ex. Praesent metus augue, facilisis ac magna ac, eleifend facilisis justo. Sed et nisl.",
                                     image: "4",
                                     likes: 3,
                                     views: 45,
                                     comments: nil)]
}
