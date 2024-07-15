//
//  ViewController.swift
//  json
//  "The given data was not valid JSON." видимо в urlString не та сылка  вот и не выходит а так вроде работать должно (не забыть чекнуть видос там вроде еще пара заданийцй на эту тему)
//  Created by Иван Галиченко on 27.06.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        let urlString = "https://vk.com/away.php?to=https%3A%2F%2Ficodeschool.ru%2Fjson1.php&cc_key="
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data else {return }
//            let jsonString = String(data: data, encoding: .utf8)
//            print(jsonString)
            do {
             let lessons = try JSONDecoder().decode([Lesson].self, from: data)
                print(lessons.first?.ID)
            } catch {
                print(error)
            }
        } .resume()
    }


}

