//
//  ModelData.swift
//  Landmarks
//
//  Created by 이동규 on 2021/05/29.
//

import Foundation
import Combine  //오브젝트 저장을 위한 Oberverable 프로토콜 사용하기 위해

//3.
final class ModelData: ObservableObject {
//    var landmarks: [Landmark] = load("landmarkData.json")
    @Published var landmarks: [Landmark] = load("landmarkData.json")
    
}


//2.
var landmarks: [Landmark] = load("landmarkData.json")

//1. json 파일 읽어들일 메소드 만들기
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    //번들 메인에서 파일 불러오기
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("Couldn't find \(filename) in main bundle")
    }
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

