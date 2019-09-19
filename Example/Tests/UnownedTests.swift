import XCTest
import Leakify
import SpecLeaks
import Quick
import Nimble

class ObjectWithUnownedMethods: BaseMock {
    
    func unownedWithoutArgTest() {
        service.methodWithoutArg(then: unown(self, self.lk.objectMethodWithoutArg))
    }
    
    func unownedWithArgsTest() {
        service.methodWithArg(then: unown(self, self.lk.objectMethodWithArg))
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
        }
    }
}
