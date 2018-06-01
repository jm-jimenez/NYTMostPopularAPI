//
//  NewsResultsViewController.swift
//  NYTMostPopularAPI
//
//  Created by José María Jiménez on 01/06/2018.
//  Copyright © 2018 José María Jiménez. All rights reserved.
//

import UIKit

protocol NewsResultsViewControllerProtocol: BaseViewControllerProtocol {
    func updateViewModels(with elements: [NewsResultCellViewModel])
}

class NewsResultsViewController: BaseViewController, NewsResultsViewControllerProtocol {
    
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: NewsResultsPresenterProtocol?
    private var elements: [NewsResultCellViewModel] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        presenter?.getResults()
    }
    
    private func configureTableView() {
        tableView.register(UINib(nibName: "NewsResultCell", bundle: nil), forCellReuseIdentifier: "NewsResultsReuseIdentifier")
        tableView.dataSource = self
    }
    
    func updateViewModels(with elements: [NewsResultCellViewModel]) {
        self.elements = elements
    }
}

extension NewsResultsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return elements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsResultsReuseIdentifier") as? NewsResultCell else { return NewsResultCell() }
        cell.setUp(with: elements[indexPath.item])
        return cell
    }
}
