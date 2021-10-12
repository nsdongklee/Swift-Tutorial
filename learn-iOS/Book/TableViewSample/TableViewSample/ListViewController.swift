//
//  ListViewController.swift
//  TableViewSample
//
//  Created by 이동규 on 2021/09/29.
//

import UIKit

class ListViewController: UITableViewController {
    // 데이터 세트화
//    var dataset = [
//        ("다크 나이트", "철학에 음악까지 더해져 예술이 되다.", "2008-09-04", 8.95, "darknight.jpg"),
//        ("호우시절", "때를 알고 내리는 비", "2009-10-08", 7.31, "rain.jpg"),
//        ("말할 수 없는 비밀", "여기서 너까지 다섯 걸음", "2015-05-07", 9.19, "secret.jpg"),
//    ]
    
    var page = 1
    @IBOutlet var moreBtn: UIButton!
    @IBAction func more(_ sender: Any) {
        self.page += 1
        self.callMovieAPI()
        self.tableView.reloadData()
    }

    // 테이블 뷰를 구성할 리스트 데이터. 클로저를 이용해서 생략과 함께 데이터를 추가할 수 있다.
    lazy var list: [MovieVO] = {
        var dataList = [MovieVO]()
        /*
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
        */
        return dataList
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.callMovieAPI()
    }
    // 이미지 데이터 처리를 메모이제이션으로 활용
    func getThumbnailImage(_ index: Int) -> UIImage {
        let mvo = self.list[index]
        // 메모이제이션: 저장된 이미지 있으면 그것 반환, 아니면 내려받기
        if let savedImage = mvo.thumbnailImage {
            return savedImage
        } else {
            let url: URL! = URL(string: mvo.thumbnail!)
            let imageData = try! Data(contentsOf: url)
            mvo.thumbnailImage = UIImage(data: imageData)
            return mvo.thumbnailImage!
        }
    }
    
    func callMovieAPI() {
        // 1. uri 생성
        let url = "http://swiftapi.rubypaper.co.kr:2029/hoppin/movies?version=1&page=\(self.page)&count=10&genreId=&order=releasedateasc"
        let apiURI: URL! = URL(string: url)
        // 2. REST API 호출. Data 객체활용
        let apiData = try! Data(contentsOf: apiURI)
        // 3. 데이터 전송결과 로그 출력
        let log = NSString(data: apiData, encoding: String.Encoding.utf8.rawValue) ?? ""
        NSLog("API Result == \(log)")
        // 4. JSON 객체 파싱gotj NSDictionary 에 담기
        do {
            let apiDict = try JSONSerialization.jsonObject(with: apiData, options: []) as! NSDictionary
            // 5. 데이터 구조에 맞춰서 차례대로 진입하면서 분리
            let hoppin = apiDict["hoppin"] as! NSDictionary
            let movies = hoppin["movies"] as! NSDictionary
            let movie = movies["movie"] as! NSArray
            // 6. 반복문 처리로 파싱한 데이터를 VO 객체에 넣는다.
            for row in movie {
                let r = row as! NSDictionary
                let mvo = MovieVO()
                mvo.title = r["title"] as? String
                mvo.description = r["genreNames"] as? String
                mvo.thumbnail = r["thumbnailImage"] as? String
                mvo.detail = r["linkUrl"] as? String
                mvo.rating = ((r["ratingAverage"] as! NSString).doubleValue)
                //->스크롤 성능향상위한 코드 추가
                let url: URL! = URL(string: mvo.thumbnail!)
                let imageData = try! Data(contentsOf: url)
                mvo.thumbnailImage = UIImage(data: imageData)
                //->추가 끝
                // 프로퍼티에 추가
                self.list.append(mvo)
            }
            // 7. 버튼 속성 제어.
            let totalCount = (hoppin["totalCount"] as? NSString)!.integerValue
            if (self.list.count >= totalCount) {
                self.moreBtn.isHidden = true
            }
        } catch {
            NSLog("Parse Error.")
        }
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
        
        // 수정
//        cell.thumbnail.image = UIImage(named: row.thumbnail!)
        
//        let url: URL! = URL(string: row.thumbnail!)
//        let imageData = try! Data(contentsOf: url)
//        cell.thumbnail.image = UIImage(data: imageData)
        //이미지 객체를 대입하는 방법(스크롤 성능)
//        cell.thumbnail.image = row.thumbnailImage
        
        // 스크롤 성능 높이면서 메모이제이션+비동기 처리로 성능 높임
        DispatchQueue.main.async {
            cell.thumbnail.image = self.getThumbnailImage(indexPath.row)
        }
        
        // ---> 추가 끝
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("선택된 행은 \(indexPath.row) 번째 행입니다.")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.estimatedRowHeight = 80
        self.tableView.rowHeight = UITableView.automaticDimension   // 사진 사이즈에 맞춰서 변경해야함
    }
}

// MARK: - 화면 전환 시 값을 넘겨주기 위한 세그웨이 관련 처리
extension ListViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 세그웨이 맞는지 id로 체크
        if segue.identifier == "segue_detail" {
            // 사용자가 클릭한 셀을 알아낸다.
            let path = self.tableView.indexPath(for: sender as! MovieCell)
            // 해당 셀의 행의 정보를 통해 영화 데이터를 찾고, 목적지인 뷰컨트롤러의 mvo 변수에 대입
            let detailVC = segue.destination as? DetailViewController
            detailVC?.mvo = self.list[path!.row]
        }
    }
}
