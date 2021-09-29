//
//  ListViewController.swift
//  TableViewSample
//
//  Created by 이동규 on 2021/09/29.
//

import UIKit

class ListViewController: UITableViewController {
    // 데이터 세트화
    var dataset = [
        ("다크 나이트", "철학에 음악까지 더해져 예술이 되다.", "2008-09-04", 8.95, "darknight.jpg"),
        ("호우시절", "때를 알고 내리는 비", "2009-10-08", 7.31, "rain.jpg"),
        ("말할 수 없는 비밀", "여기서 너까지 다섯 걸음", "2015-05-07", 9.19, "secret.jpg"),
    ]
    
    // 테이블 뷰를 구성할 리스트 데이터. 클로저를 이용해서 생략과 함께 데이터를 추가할 수 있다.
    lazy var list: [MovieVO] = {
        var dataList = [MovieVO]()
        for (title, description,opendate, rating, thumbnail) in self.dataset {
            // 행 데이터 바인딩
            let mvo = MovieVO()
            mvo.title = title
            mvo.description = description
            mvo.opendate = opendate
            mvo.rating = rating
            mvo.thumbnail = thumbnail
            dataList.append(mvo)
        }
        return dataList
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*  전부 삭제처리

        // 첫 번째 행
        var mvo = MovieVO()
        mvo.title = "다크나이트"
        mvo.description = "철학에 음악까지 더해져 예술이 되다."
        mvo.opendate = "2008-09-04"
        mvo.rating = 8.95
        // 배열에 추가
        self.list.append(mvo)
        
        // 두 번째 행
        mvo = MovieVO()
        mvo.title = "호우시절"
        mvo.description = "때를 알고 내리는 비."
        mvo.opendate = "2009-10-08"
        mvo.rating = 7.31
        // 배열에 추가
        self.list.append(mvo)
        
        // 세 번째 행
        mvo = MovieVO()
        mvo.title = "말할 수 없는 비밀"
        mvo.description = "여기서 너 까지 다섯 걸음."
        mvo.opendate = "2015-05-07"
        mvo.rating = 9.19
        // 배열에 추가
        self.list.append(mvo)
        */
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 주어진 행에 맞는 데이터 소스를 읽어온다.
        let row = self.list[indexPath.row]
        // 프로토타입셀에 붙인 이름을 활용해서 셀 객체를 큐로부터 가져옴
//        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell")!
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell")! as! MovieCell
        
//        // ---> 1. 커스텀셀로 만들면서 추가되는 부분
////        cell.textLabel?.text = row.title
//        let title = cell.viewWithTag(101) as? UILabel
//        let desc = cell.viewWithTag(102) as? UILabel
//        let opendate = cell.viewWithTag(103) as? UILabel
//        let rating = cell.viewWithTag(104) as? UILabel
//
//        title?.text = row.title
//        desc?.text = row.description
//        opendate?.text = row.opendate
//        rating?.text = "\(row.rating)"
//        // ---> 추가 끝

        // ---> 2. 커스텀 클래스를 생성해서 제어하기(MovieCell)
        cell.title?.text = row.title
        cell.desc?.text = row.description
        cell.opendate?.text = row.opendate
        cell.rating?.text = "\(row.rating)"
        cell.thumbnail.image = UIImage(named: row.thumbnail!)
        // ---> 추가 끝
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("선택된 행은 \(indexPath.row) 번째 행입니다.")
    }
    
    
}
