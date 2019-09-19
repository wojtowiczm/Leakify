import XCTest
import Leakify
import SpecLeaks
import Quick
import Nimble

class LeakedObject: BaseMock {
    
    func leakingTest() {
        service.methodWithArg {
            self.objectMethodWithArg($0)
        }
    }
}

class LeakingObjectTests: QuickSpec {
    override func spec() {
        describe("LeakedObject") {
            describe("leakingTest") {
                it("must leak"){
                    let someObject = LeakTest {
                        return LeakedObject()
                    }
                    
                    let leakingMethodIsCalled: (LeakedObject) -> ()  = {obj in
                        obj.leakingTest()
                    }
                    
                    expect(someObject).to(leakWhen(leakingMethodIsCalled))
                }
            }
        }
    }
}

