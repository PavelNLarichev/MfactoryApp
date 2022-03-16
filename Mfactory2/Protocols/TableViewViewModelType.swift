//
//  TableViewViewModelType.swift
//  Mfactory2
//
//  Created by Павел Ларичев on 23.11.2021.
//

import Foundation

protocol TableViewViewModelType {
    func numberOfRows() ->  Int
   
    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellViewModelType?

    //func selectRow(atIndexPath indexPath: IndexPath)
    
    func onReady(forMultiplier: Int, countTask: Int, isMixTask: Int)
 

    var bindToController: (()->()) { get set}
    
    var arrayTasks: [TaskData] { get }
    
   
}
