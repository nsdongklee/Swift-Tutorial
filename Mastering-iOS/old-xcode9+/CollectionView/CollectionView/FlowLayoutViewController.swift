//
//  Copyright (c) 2018 KxCoding <kky0317@gmail.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import UIKit

class FlowLayoutViewController: UIViewController {
   
   @IBOutlet weak var listCollectionView: UICollectionView!
   
   let list = MaterialColorDataSource.generateMultiSectionData()
   
   @objc func toggleScrollDirection() {
    // 토글 방향 구현
    guard let layout = listCollectionView.collectionViewLayout as? UICollectionViewFlowLayout else {
        return
    }
    
    listCollectionView.performBatchUpdates({layout.scrollDirection = layout.scrollDirection == .vertical ? .horizontal: .vertical}, completion: nil)
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Toggle", style: .plain, target: self, action: #selector(toggleScrollDirection))
      
    // 인스펙터로 구현한 방식을 코드로 구현하기
//    listCollectionView.collectionViewLayout as? UICollectionViewLayout
    
    // 레이아웃 객체를 바인딩
    if let layout = listCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
        layout.itemSize = CGSize(width: 100, height: 100)
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
   }
}

// 다른 형태 화면 만들어 보기
extension FlowLayoutViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // 호출 시점 확인을 위한 로그 출력
        print(indexPath.section, "#1", #function)
        
        // 레이아웃 객체 타입 캐스팅
        guard let layout = collectionViewLayout as? UICollectionViewFlowLayout else {
            return CGSize.zero
        }
        //
        var bounds = collectionView.bounds
        bounds.size.height += bounds.origin.y
        
        // 최대 너비와 높이 계산
        var width = bounds.width - (layout.sectionInset.left + layout.sectionInset.right)
        var height = bounds.width - (layout.sectionInset.top + layout.sectionInset.bottom)
        
        switch layout.scrollDirection {
        case .vertical:
            height = (height -  (layout.minimumLineSpacing * 4)) / 5
            if indexPath.item > 0 {
                width = (width - (layout.minimumInteritemSpacing * 2)) / 3
            }
        case .horizontal:
            width = (width -  (layout.minimumLineSpacing * 2)) / 3
            if indexPath.item > 0 {
                width = (width - (layout.minimumInteritemSpacing * 4)) / 5
            }
        default:
            break
        }
        
        // 셀 크기 계산시 소수점 오차를 정확히 계산 하도록 내림
        return CGSize(width: width.rounded(.down), height: height.rounded(.down))
    }
    
    // 셀 여백 값이 필요할 떄마다 해당 메소드 호출
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        print(section, "#2", #function)
//        return 5
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        print(section, "#3", #function)
//        return 5
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        print(section, "#4", #function)
//        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
//    }
}


extension FlowLayoutViewController: UICollectionViewDataSource {
   func numberOfSections(in collectionView: UICollectionView) -> Int {
      return list.count
   }
   
   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return list[section].colors.count
   }
   
   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
      cell.contentView.backgroundColor = list[indexPath.section].colors[indexPath.row]
      
      return cell
   }
}
















