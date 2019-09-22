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

class LeakedObjectTests: QuickSpec {
    
    override func spec() {
        describe("LeakedObject") {
            describe("leakingTest") {
                it("must leak"){
                    let leakedObject = LeakTest(constructor: LeakedObject.init)
                    
                    let leakingMethodIsCalled: (LeakedObject) -> ()  = {obj in
                        obj.leakingTest()
                    }
                    
                    expect(leakedObject).to(leakWhen(leakingMethodIsCalled))
                }
            }
        }
    }
}

