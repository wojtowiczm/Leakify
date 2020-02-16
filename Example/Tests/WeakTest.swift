//
//  WeakTest.swift
//  Leakify_Example
//
//  Created by Michał Wójtowicz on 16/02/2020.
//

import XCTest
import Leakify
import SpecLeaks
import Quick
import Nimble

class ObjectWithWeakMethods: BaseMock {
    
    func unownedWithoutArgTest() {
        service.methodWithoutArg(then: self[weak: lkf.objectMethodWithoutArg])
    }
    
    func unownedWithArgsTest() {
        service.methodWithArg(then: unown(self, lkf.objectMethodWithArg))
    }
    
    func unownedWithArgsAndReturnTest() {
        service.methodWithArgAndReturn(then: unown(self, lkf.objectMethodWithArgAndReturn))
    }
    
}
extension ObjectWithWeakMethods: LeakifyConvertible {}

class WeakMethodsTests: QuickSpec {
    
    override func spec() {
        describe("ObjectWithUnownedUsage") {
            describe("unwonedWithArgsTest") {
                it("must not leak") {
                    let unownedMethodsProvider = LeakTest(constructor: ObjectWithUnownedMethods.init)
                    
                    let leakingMethodIsCalled: (ObjectWithUnownedMethods) -> ()  = {
                        $0.unownedWithArgsTest()
                    }
                    
                    expect(unownedMethodsProvider).toNot(leakWhen(leakingMethodIsCalled))
                }
            }
            
            describe("unwonedWithoutArgsTest") {
                it("must not leak") {
                    let unownedMethodsProvider = LeakTest(constructor: ObjectWithUnownedMethods.init)
                    
                    let leakingMethodIsCalled: (ObjectWithUnownedMethods) -> ()  = {
                        $0.unownedWithoutArgTest()
                    }
                    
                    expect(unownedMethodsProvider).toNot(leakWhen(leakingMethodIsCalled))
                }
            }
            describe("unwonedWithArgsAndReturnTest") {
                it("must not leak") {
                    let unownedMethodsProvider = LeakTest(constructor: ObjectWithUnownedMethods.init)
                    
                    let leakingMethodIsCalled: (ObjectWithUnownedMethods) -> ()  = {
                        $0.unownedWithArgsAndReturnTest()
                    }
                    
                    expect(unownedMethodsProvider).toNot(leakWhen(leakingMethodIsCalled))
                }
            }
        }
    }
}
