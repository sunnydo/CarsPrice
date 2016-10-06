//
//  CarsPriceTests.swift
//  CarsPriceTests
//
//  Created by Sunny on 10/6/16.
//  Copyright © 2016 Sunny Do. All rights reserved.
//

import XCTest
@testable import CarsPrice

class CarsPriceTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testValidCar1() {
        // GIVEN
        let car:Car = Car(name: "Benz G65", capacity: 6.0, country: "Europe", originalPrice: 217900);
        //WHEN
        car.calculateSalePrice()
        //THEN
        XCTAssertEqual(round(car.salePrice), 34410768 )
        
    }
    func testValidCar2() {
        // GIVEN
        let car:Car = Car(name: "Honda Jazz", capacity: 1.5, country: "Japan", originalPrice: 19490);
        //WHEN
        car.calculateSalePrice()
        //THEN
        XCTAssertEqual(round(car.salePrice), 1744121 )
    }
    func testValidCar3() {
        // GIVEN
        let car:Car = Car(name: "Jeep wrangler", capacity: 3.6, country: "USA", originalPrice: 36995);
        //WHEN
        car.calculateSalePrice()
        //THEN
        XCTAssertEqual(car.salePrice, 3700091.92 )
        
    }
    func testInValidCar1() {
        // GIVEN
        let car:Car = Car(name: "Chery QQ ", capacity: 1.0, country: "Eurrope", originalPrice: 6000);
        //WHEN
        car.calculateSalePrice()
        //THEN
        XCTAssertEqual(car.salePrice, 0 )
        XCTAssertEqual(car.error?.domain, "Invalid car")
    }
    func testValidCar() {
        // GIVEN
        let car:Car = Car(name: "", capacity: 0.0, country: "Eurrope", originalPrice: 13000);
        //WHEN
        car.calculateSalePrice()
        //THEN
        XCTAssertEqual(car.salePrice, 0 )
        XCTAssertEqual(car.error?.domain, "Invalid car")
    }
    
    
}
