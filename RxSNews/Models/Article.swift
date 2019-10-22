//
//  Article.swift
//  RxSNews
//
//  Created by eren kulan on 22/10/2019.
//  Copyright © 2019 eren kulan. All rights reserved.
//

import Foundation

struct ArticlesList: Decodable {
    var articles: [Article]
}

extension ArticlesList {
    static var all: Resource<ArticlesList> = {
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=674ba098a8054b8fb25c4ba85d62ee04")!
        return Resource(url: url)
    }()
}

struct Article: Decodable {
    var title: String
    var description: String?
}
