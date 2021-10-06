//
//  NetworkTaskManager.swift
//  Mfactory2
//
//  Created by Павел Ларичев on 30.09.2021.
//

import Foundation

struct NetworkTaskManager{

    
    func fetchSetTasks(forMultiplier multiplier: Int, countTask: Int, isMixTask: Int, completion: @escaping ([TaskData]?, String?) -> Void){
        let urlString = "https://dev.behemot.club/mathapp/questions/multiplication/\(multiplier)/\(countTask)/\(isMixTask)"
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let data = data {
//                let dataString = String(data: data, encoding: .utf8)
//                print(dataString!)
                //создать замыкание 000

                self.parseJSON(withData: data, completion: completion)
                
            }
        }
        task.resume()
    }
    func parseJSON(withData data: Data, completion: @escaping ([TaskData]?, String?) -> Void){
        let decoder = JSONDecoder()
        do {
        let taskDataJSON = try decoder.decode(TaskDataJSON.self, from: data)
            let multiplyBy = taskDataJSON.result.map{ TaskData(question: $0.question, answer: "\($0.answer)") }
            completion(multiplyBy, nil)
            
            //print(taskDataJSON.result[1].answer)
        } catch let error as NSError {
            completion(nil, error.localizedDescription)
            print(error.localizedDescription)
        }
        
    }
}
