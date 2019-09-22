import XCTest
import Leakify
import SpecLeaks
import Quick
import Nimble

class ObjectWithUnownedMethods: BaseMock {
    
    func unownedWithoutArgTest() {
        service.methodWithoutArg(then: unown(self, lf.objectMethodWithoutArg))
    }
    
    func unownedWithArgsTest() {
        service.methodWithArg(then: unown(self, lf.objectMethodWithArg))
    }
    
    func unownedWithArgsAndReturnTest() {
        service.methodWithArgAndReturn(then: unown(self, lf.objectMethodWithArgAndReturn))
    }
    
}
extension ObjectWithUnownedMethods: LeakifyConvertible {}

class UnownedMethodsTests: QuickSpec {
    
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
