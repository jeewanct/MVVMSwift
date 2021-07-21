//
//  NewsFeedController.swift
//  Project
//
//  Created by jeevan tiwari on 7/15/21.
//

import UIKit

class NewsFeedController: BaseGenericController<NewsFeedViewModel> {
    
    @IBOutlet weak var tableViewNewsFeeds: BaseTableView!
    @IBOutlet weak var lblNewNews: UILabel!
    
    private lazy var dataSource: TableDataSource<DailyNews, NewsFeedsCell> = TableDataSource()
    private lazy var delegate = TableViewDelegate()
    private lazy var timer = ShowTimer(Constants.newsRefreshInterval)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchNews(refreshType: .cache)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        timer.startTimer()
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        timer.stopTimer()
    }
    override func initialize() {
        super.initialize()
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        tableViewNewsFeeds.addSubview(refreshControl)
        tableViewNewsFeeds.registerCells(NewsFeedsCell.self)
        tableViewNewsFeeds.dataSource = dataSource
        tableViewNewsFeeds.delegate = delegate
    }
    override func addListener() {
        super.addListener()
        delegate.onClick = { [unowned self] selectednews in
            push(controller: NewsDetailsController.instance(viewModel: NewsDetailsViewModel(news: viewModel.news.value?[selectednews])))
        }
        timer.currentTime = { [unowned self] _ in
            viewModel.fetchNews(refreshType: .timer)
        }
        viewModel.news.bind { [unowned self] news in
            dataSource.items = news
            tableViewNewsFeeds.reloadSections(IndexSet(arrayLiteral: 0), with: .automatic)
        }
        viewModel.showNewNews.bind { [unowned self] showNewsLabel in
            if showNewsLabel{
                timer.stopTimer()
                lblNewNews.isHidden = false
            }
        }
    }
    @IBAction func getNewData(){
        lblNewNews.isHidden = true
        viewModel.fetchNews(refreshType: .cache)
        timer.startTimer()
        tableViewNewsFeeds.scrollToRow(at: IndexPath(item: 0, section: 0), at: .bottom, animated: true)
    }
    @objc func refreshData(){
        viewModel.fetchNews(refreshType: .server)
    }
}
extension NewsFeedController{
    static func instance(viewModel: NewsFeedViewModel, title: String) -> NewsFeedController{
        let controller: NewsFeedController = UIViewController.load()
        controller.viewModel = viewModel
        controller.title = title
        return controller
    }
}
