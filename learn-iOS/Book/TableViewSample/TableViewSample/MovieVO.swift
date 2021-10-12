//
//  MovieVO.swift
//  TableViewSample
//
//  Created by 이동규 on 2021/09/29.
//

import Foundation
import UIKit

class MovieVO {
    var thumbnail: String? //영화 썸네일 이미지 주소
    var title: String?
    var description: String?
    var detail: String?
    var opendate: String?
    var rating: Double?
    
    // 스크롤 매끄럽게 하기위해 성능 업
    var thumbnailImage: UIImage?
}
