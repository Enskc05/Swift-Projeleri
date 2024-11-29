//
//  ViewController.swift
//  NewsProject-2
//
//  Created by Enes Koç on 29.11.2024.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource{

    @IBOutlet weak var TableView: UITableView!
    
    private var newsTableViewModel : NewsTableViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TableView.delegate = self
        TableView.dataSource = self
        TableView.rowHeight = UITableView.automaticDimension
        TableView.estimatedRowHeight = UITableView.automaticDimension
        
        getData()
    }
    
    func getData(){
        let url = URL(string:    "https://raw.githubusercontent.com/atilsamancioglu/BTK-iOSDataSet/master/dataset.json" )
        
        WebService().getNews(url: url!) { (news)in
            
            if let news = news{
                self.newsTableViewModel = NewsTableViewModel(newsList: news)
                
                DispatchQueue.main.async {
                    self.TableView.reloadData()
                }
            }
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsTableViewModel == nil ? 0 : self.newsTableViewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TableView.dequeueReusableCell(withIdentifier: "Cell" , for: indexPath) as! NewsCell
        let newsViewModel = self.newsTableViewModel.newsAtIndexPath(_index: indexPath.row)
        cell.TitleLabel.text = newsViewModel.title
        cell.StoryLabel.text = newsViewModel.story
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

}

