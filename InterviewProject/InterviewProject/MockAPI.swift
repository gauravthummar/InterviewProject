import Foundation
import UIKit

class MockAPI: RequestProtocol {
    
    let queue = DispatchQueue(label: "com.interview.test")
    
    func getAddress(result: @escaping ([String]) -> ()) {
        queue.asyncAfter(deadline: .now() + 1.5) {
            result(["1901 Goosetown Drive,CA,12345", "4675 Johnson Street,NC,28328", "4493 Birch Street,In,46203", "2068 Florence Street,TX,75601","4949 Pinewood Avenue,GA,31704"])
        }
    }
    
    func getPrice( result: @escaping ([Int]) -> ()) {
        queue.asyncAfter(deadline: .now() + 2) {
            result([1000000,500000,200000,280000,14000])
        }
    }
    
    func getBeds(result: @escaping ([Int]) -> ()) {
        queue.asyncAfter(deadline: .now() + 0.3) {
            result([1,2,3,4,5])
        }
    }
    
    func getBaths(result: @escaping ([Int]) -> ()) {
        queue.asyncAfter(deadline: .now() + 3) {
            result([2,2,2,1,2])
        }
    }
    
}


extension MockAPI {
    
    public func getHouseInfo(completion: @escaping ([house])->()) {
        var houseArraay: [house] = []
        var addressArray:[String] = []
        var priceArray: [Int] = []
        
        getAddress { result in
            addressArray =  result
            self.getPrice { result in
                priceArray = result
                if (addressArray.count > 0 && priceArray.count > 0) {
                    for i in 0...addressArray.count - 1 {
                        let house = house(address: addressArray[i], price: priceArray[i])
                        houseArraay.append(house)
                    }
                    completion(houseArraay)
                }
            }
        }
    }
}


struct house {
    public var address: String
    public var price: Int
    
    init(address: String, price: Int) {
        self.address = address
        self.price = price
    }
}
