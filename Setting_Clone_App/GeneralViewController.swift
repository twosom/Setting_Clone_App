//
// Created by Desire L on 2021/12/11.
//

import UIKit

class GeneralCell: UITableViewCell {

    @IBOutlet
    var leftLabel: UILabel!


    @IBOutlet
    var rightImageView: UIImageView! {
        /**
         메모리에 잡히거나 값이 변경되거나 할 때 didSet 이 호출
         */
        didSet {
            rightImageView.backgroundColor = .clear
            rightImageView.image = UIImage(systemName: "chevron.right")
            rightImageView.tintColor = .orange
        }
    }

}


class GeneralViewController: UIViewController {

    var modelList: [[GeneralModel]] = [[GeneralModel]]()


    @IBOutlet
    var generalTableView: UITableView!

    func makeData() {
        /**
         Section 1
         */
        modelList.append(
                [GeneralModel(leftTitle: "정보")]
        )
        /**
         Section 2
         */
        modelList.append(
                [
                    GeneralModel(leftTitle: "키보드"),
                    GeneralModel(leftTitle: "게임 컨트롤러"),
                    GeneralModel(leftTitle: "서체"),
                    GeneralModel(leftTitle: "언어 및 지역"),
                    GeneralModel(leftTitle: "사전"),
                ]
        )
        /**
         Section 3
         */
        modelList.append(
                [GeneralModel(leftTitle: "전송 또는 iPhone 재설정")]
        )
    }


    override
    func viewDidLoad() {
        super.viewDidLoad()

        self.title = "일반"
        if let navigationBar = navigationController?.navigationBar {
            navigationBar.prefersLargeTitles = false
        }


        makeData()
        generalTableView.dataSource = self
        generalTableView.delegate = self
        generalTableView.backgroundColor = .systemGray6
        view.backgroundColor = .systemGray6
    }

}


extension GeneralViewController: UITableViewDelegate, UITableViewDataSource {

    /**
     한 섹션 안에 몇 개의 Row 가 존재하는지
     - Parameters:
       - tableView: 테이블 뷰
       - section: 섹션
     - Returns: 섹션 안의 Row 수
     */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        modelList[section].count
    }

    /**
     테이블 뷰 안에 몇 개의 Section 이 존재하는지
     - Parameter tableView: 테이블 뷰
     - Returns: 테이블 뷰 안의 Section 수
     */
    public func numberOfSections(in tableView: UITableView) -> Int {
        return modelList.count
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /**
         해당 Section 안의 Row 에 해당하는 Model
         */
        let model: GeneralModel = modelList[indexPath.section][indexPath.row]

        guard let generalCell: GeneralCell = tableView.dequeueReusableCell(withIdentifier: "GeneralCell", for: indexPath) as? GeneralCell else {
            return GeneralCell()
        }

        generalCell.leftLabel.text = model.leftTitle
        return generalCell
    }


}