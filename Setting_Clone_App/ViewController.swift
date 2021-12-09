//
//  ViewController.swift
//  Setting_Clone_App
//
//  Created by Desire L on 2021/12/08.
//
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet
    var settingTableView: UITableView!

    override
    func viewDidLoad() {
        super.viewDidLoad()

        settingTableView.delegate = self
        settingTableView.dataSource = self
        settingTableView.backgroundColor = .systemGray6

        settingTableView.register(UINib(nibName: "ProfileCell", bundle: nil), forCellReuseIdentifier: "ProfileCell")

        settingTableView.register(UINib(nibName: "MenuCell", bundle: nil), forCellReuseIdentifier: "MenuCell")
    }
}


extension ViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.row == 0 {
            return tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath)
        }

        return tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath)
    }

    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return UITableView.automaticDimension
        }
        return 60
    }
}

