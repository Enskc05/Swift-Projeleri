//
//  NewViewModel.swift
//  NewsProject-2
//
//  Created by Enes Koç on 29.11.2024.
//

import Foundation

struct NewsTableViewModel{
    let newsList : [News]
    
    func numberOfRowsInSection() -> Int {
        return self.newsList.count
    }
    func newsAtIndexPath(_index : Int) -> NewsViewModel{
        let news = self.newsList[_index]
        return NewsViewModel(news: news)
    }
}

struct NewsViewModel {
    let news : News
    
    var title : String {
        return self.news.title
    }
    
    var story : String {
        return self.news.story
    }
}
