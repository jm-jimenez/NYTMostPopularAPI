//
//  SearchNewsViewController.swift
//  NYTMostPopularAPI
//
//  Created by José María Jiménez on 31/05/2018.
//  Copyright © 2018 José María Jiménez. All rights reserved.
//

import UIKit

protocol SearchNewsViewControllerProtocol: BaseViewControllerProtocol {
    func updateModelsWith(elements: [RowModel])
    func shouldEnableNextButton(_ enable: Bool)
}

class SearchNewsViewController: BaseViewController, SearchNewsViewControllerProtocol {

    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nextBtn: NextButton!
    
    // MARK: - Properties
    var presenter: SearchNewsPresenterProtocol?
    private var elements: [RowModel] = [RowModel]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    // MARK: - Object Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    // MARK: - Private methods
    func configureTableView() {
        presenter?.loadModels()
        tableView.dataSource = self
        tableView.register(UINib(nibName: "OptionCell", bundle: nil), forCellReuseIdentifier: "OptionCellReuseIdentifier")
        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    // MARK: - SearchNewsViewControllerProtocol
    func updateModelsWith(elements: [RowModel]) {
        self.elements = elements
    }
    
    func shouldEnableNextButton(_ enable: Bool) {
        nextBtn.isEnabled = enable
    }
    
    // MARK: - IBActions
    @IBAction func didTapNext(_ sender: NextButton) {
        presenter?.didTapNext()
    }
}

// MARK: - UITableViewDataSource
extension SearchNewsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return elements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "OptionCellReuseIdentifier") as? OptionCell else { return OptionCell() }
        cell.configCellWith(configItems: elements[indexPath.item].configItems, at: indexPath)
        cell.delegate = self
        return cell
    }
}

// MARK: - OptionCellDelegate
extension SearchNewsViewController: OptionCellDelegate {
    func didTapOnBtn1(at: IndexPath) {
        presenter?.updateConfigItemStatus(at: 0, rowModelIndex: at.row)
    }
    
    func didTapOnBtn2(at: IndexPath) {
        presenter?.updateConfigItemStatus(at: 1, rowModelIndex: at.row)
    }
    
    func didTapOnBtn3(at: IndexPath) {
        presenter?.updateConfigItemStatus(at: 2, rowModelIndex: at.row)
    }
}
