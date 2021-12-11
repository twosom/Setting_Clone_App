//
//  ViewController.swift
//  Setting_Clone_App
//
//  Created by Desire L on 2021/12/08.
//
//

import UIKit

class ViewController: UIViewController {

    var settingModel: [[SettingModel]] = [[SettingModel]]()


    func makeData() {
        settingModel.append(
                [SettingModel(leftImageName: "person.crop.circle", menuTitle: "iPhone에 로그인", subTitle: "iCloud, App Store 등 설정")]
        )

        settingModel.append(
                [
                    SettingModel(leftImageName: "gear", menuTitle: "일반", rightImageName: "chevron.right"),
                    SettingModel(leftImageName: "figure.wave.circle", menuTitle: "손쉬운 사용", rightImageName: "chevron.right"),
                    SettingModel(leftImageName: "hand.raised.fill", menuTitle: "개인 정보 보호", rightImageName: "chevron.right")
                ]
        )

        settingModel.append(
                [SettingModel(leftImageName: "key.fill", menuTitle: "암호", rightImageName: "chevron.right")]
        )

        print(settingModel)

    }


    @IBOutlet
    var settingTableView: UITableView!

    /**
     메모리에 올릴 때
     */
    override
    func viewDidLoad() {
        super.viewDidLoad()

        makeData()

        settingTableView.delegate = self
        settingTableView.dataSource = self
        settingTableView.backgroundColor = .systemGray6

        settingTableView.register(UINib(nibName: "ProfileCell", bundle: nil), forCellReuseIdentifier: "ProfileCell")
        settingTableView.register(UINib(nibName: "MenuCell", bundle: nil), forCellReuseIdentifier: "MenuCell")

        title = "설정"
        view.backgroundColor = .systemGray6
    }


    /**
     화면이 나오면
     - Parameter animated:
     */
    override
    func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let navigationController: UINavigationController = navigationController {
            navigationController.navigationBar.prefersLargeTitles = true
        }
    }
}


extension ViewController: UITableViewDataSource, UITableViewDelegate {

    public func numberOfSections(in tableView: UITableView) -> Int {
        return settingModel.count
    }

    /**
     눌렀을 경우
     - Parameters:
       - tableView:
       - indexPath:
     */
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 && indexPath.row == 0 {
            if let generalVC: GeneralViewController = UIStoryboard(name: "GeneralViewController", bundle: nil)
                    .instantiateViewController(identifier: "GeneralViewController") as? GeneralViewController {

                navigationController?.pushViewController(generalVC, animated: true)

            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingModel[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = settingModel[indexPath.section][indexPath.row]

        if indexPath.section == 0 {
            let profileCell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath) as! ProfileCell
            profileCell.profileImageView.image = UIImage(systemName: model.leftImageName)
            profileCell.topTitle.text = model.menuTitle
            profileCell.bottomDescription.text = model.subTitle
            return profileCell
        }

        let menuCell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuCell
        menuCell.leftImageView.image = UIImage(systemName: model.leftImageName)
        menuCell.leftImageView.tintColor = .red
        menuCell.middleTitle.text = model.menuTitle
        menuCell.rightImageView.image = UIImage(systemName: model.rightImageName ?? "")
        menuCell.rightImageView.tintColor = .systemGray4
        return menuCell
    }

    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return UITableView.automaticDimension
        }
        return 60
    }
}

