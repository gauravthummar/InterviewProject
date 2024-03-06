import Foundation

protocol RequestProtocol {
    
    func getAddress(result: @escaping ([String]) -> ())
    
    func getPrice( result: @escaping ([Int]) -> ())
    
    func getBeds(result: @escaping ([Int]) -> ())
    
    func getBaths(result: @escaping ([Int]) -> ())
    
}
