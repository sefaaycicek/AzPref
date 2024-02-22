//
//  ViewControllerViewModel.swift
//  AzPref
//
//  Created by Sefa Aycicek on 22.02.2024.
//

import Foundation

class ViewControllerViewModel : BaseViewModel {
    private let userDefaultService = UserDefaultService()

    
    var deviceList = [Device]()
    var selectedItem : Device? = nil
    
    var selectedRootItemIndex = 0
    var selectedSubItemIndex = 0
    
    override init() {
        let iPhone = Device(name: "iPhone", subItems: ["iPohne5", "iPhone6"])
        let iPad = Device(name: "iPad", subItems: ["iPad-1", "iPad-2", "iPad-3"])
        let samsung = Device(name: "Samsung", subItems: ["Galaxy", "Note5", "Note6"])
        
        deviceList.append(iPhone)
        deviceList.append(iPad)
        deviceList.append(samsung)
        
        selectedItem = deviceList.first
        
        let storedRootIndex = userDefaultService.getRootValue()
        let storedSubIndex = userDefaultService.getSubValue()
        print("")
    }
    
    var itemCount : Int {
        return deviceList.count
    }
    
    func getItemCountForComponent(component : Int) -> Int {
        if component == 0 {
            return itemCount
        }
        
        return itemCountSubList
    }
    
    func getItemTitleForComponent(component : Int, row : Int) -> String {
        if component == 0 {
            return getItem(index: row)
        }
        
        return getSubItem(index: row)
    }
    
    func getItem(index : Int) -> String {
        return deviceList[index].name
    }
    
    var itemCountSubList : Int {
        return selectedItem?.subItems.count ?? 0
    }
    
    func getSubItem(index : Int) -> String {
        return selectedItem?.subItems[index] ?? ""
    }
    
    func selectComponent(component : Int, row : Int) {
        if component == 0 {
            selectedItem = deviceList[row]
            selectedRootItemIndex = row
        } else if component == 1 {
            selectedSubItemIndex = row
        }
    }
    
    func save() {
        userDefaultService.setRootValue(value: selectedRootItemIndex)
        userDefaultService.setSubValue(value: selectedSubItemIndex)
    }
}


class Device {
    let name : String
    let subItems : [String]
    
    init(name: String, subItems: [String]) {
        self.name = name
        self.subItems = subItems
    }
}
