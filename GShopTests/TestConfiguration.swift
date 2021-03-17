//
//  Configuration.swift
//  GShop
//
//  Created by Matthew on 24.02.2021.
//  Copyright © 2021 Ostagram Inc. All rights reserved.
//

import Foundation


final class TestConfiguration {
    
    //let mockServerUrl = "https://gshopserver.herokuapp.com/"
     let mockServerUrl = "http://127.0.0.1:8080/"
    
    static let shared: TestConfiguration = TestConfiguration()
    
    private init(){
    }
}
