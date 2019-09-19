import XCTest
import Leakify
import SpecLeaks
import Quick
import Nimble

class ObjectWithUnownedUsage: BaseMock {
    
    func unownedWithoutArgTest() {
        service.methodWithoutArg(then: unown(self, self.lk.objectMethodWithoutArg))
    }
    
    func unownedWithArgsTest() {
        service.methodWithArg(then: unown(self, self.lk.objectMethodWithArg))
    }
    
}
extension ObjectWithUnownedUsage: LeakifyConvertible {}

class UnownedMethodsTests: QuickSpec {
    
    override func spec() {
        describe("ObjectWithUnownedUsage") {
            describe("unwonedWithArgsTest") {
                it("must not leak") {
                    let someObject = LeakTest {
                        return ObjectWithUnownedUsage()
                    }
                    
                    let leakingMethodIsCalled: (ObjectWithUnownedUsage) -> ()  = {obj in
                        obj.unownedWithArgsTest()
                    }
                    
                    expect(someObject).toNot(leakWhen(leakingMethodIsCalled))
                }
            }
        }
    }
}
