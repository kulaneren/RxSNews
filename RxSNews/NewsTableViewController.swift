//
//  NewsTableViewController.swift
//  RxSNews
//
//  Created by eren kulan on 21/10/2019.
//  Copyright © 2019 eren kulan. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class NewsTableViewController: UITableViewController {
    
    private var disposeBag = DisposeBag()
    
    private var arryArticles = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        populateNews()
    }
    
    private func populateNews() {
//        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=674ba098a8054b8fb25c4ba85d62ee04")!
//        
//        let resource = Resource<ArticlesList>(url: url)
        
        URLRequest.load(resource: ArticlesList.all)
            .subscribe(onNext: { [weak self] result in
                if let result = result {
                    self?.arryArticles = result.articles
                    DispatchQueue.main.async {
                        self?.tableView.reloadData()
                    }
                }
            }).disposed(by: disposeBag)
        
        //        Observable.just(url)
        //            .flatMap { url -> Observable<Data> in
        //                let request = URLRequest(url: url)
        //                return URLSession.shared.rx.data(request: request)
        //        }.map { data -> [Article]? in
        //            return try? JSONDecoder().decode(ArticlesList.self, from: data).articles
        //        }.subscribe(onNext: { [weak self] articles in
        //
        //            if let articles = articles {
        //                self?.arryArticles = articles
        //                DispatchQueue.main.async {
        //                    self?.tableView.reloadData()
        //                }
        //
        //            }
        //        }).disposed(by: disposeBag)
    }
    
    //MARK: UITableView Data Source methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arryArticles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else {
            fatalError("Article TAbleView cell does not exist")
        }
        
        cell.configure(self.arryArticles[indexPath.row])
        
        return cell
    }
}
