//
//  ViewModel.swift
//  Mfactory2
//
//  Created by Павел Ларичев on 23.11.2021.
//

import Foundation

class ViewModel: TableViewViewModelType {

    
    var arrayTasks: [TaskData] = []
    
    var networkTaskManager = NetworkTaskManager()
    private var selectedIndexPath: IndexPath?
    
    var bindToController: (()->()) = {}
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellViewModelType? {
        let arrayTasks2 = arrayTasks[indexPath.row]
        return TableViewCellViewModel(task: arrayTasks2)
    }
    
    
    func selectRow(atIndexPath indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
    }
    
    func onReady (forMultiplier: Int, countTask: Int, isMixTask: Int) {
        networkTaskManager.fetchSetTasks(forMultiplier: forMultiplier, countTask: countTask, isMixTask: isMixTask, completion: {data, message in
            if let data = data {
                self.arrayTasks = data
                DispatchQueue.main.async {
                    self.bindToController()
                }
            }
        })
    }
    
    func numberOfRows() -> Int {
        return arrayTasks.count
    }
}
