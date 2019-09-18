# Leakify

## Functional way to prevent memory leaks
[![Version](https://img.shields.io/cocoapods/v/Leakify.svg?style=flat)](https://cocoapods.org/pods/Leakify)
[![License](https://img.shields.io/cocoapods/l/Leakify.svg?style=flat)](https://cocoapods.org/pods/Leakify)
[![Platform](https://img.shields.io/cocoapods/p/Leakify.svg?style=flat)](https://cocoapods.org/pods/Leakify)

Tired of writing `[unowned/weak self] closures on every callback function?
You might conside using passing method as a parameter with little help from Leakify.

Usually we encourage sytuation like this

```Swift

    class Foo {
    
        let service: BazService

        func foo() {
            service.bar(then: { [unowned self] p1, p2 in self.handleResponse(param1: p1, param2: p2) })
        }
        
        func handleResponse(param1: A, param2: B) {
        
        }
    }
```
    
Woudn't be great if we just pass function as a parameter?
```Swift
    
    func foo() {
        service.bar(then: handleResponse)
    }
```
Yeah, but there is one big con of that aproach. We ended up with nice Stron reference cycle between service and Foo instance.
What can we do now?

We can import Leakify to our project and use on of it's higher order helper fuctions for avoiding strong reference cycles

```Swift

    func foo() {
        service.bar(then: unown(self, self.lk.handleResponse)
    }
```
}


## Installation

Leakify is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Leakify'
```

## Author

[Michał Wójtowicz](wojtowiczmichal97@gmail.com)

## License

Leakify is available under the MIT license. See the LICENSE file for more info.

## References
[Inspired by this article](https://sveinhal.github.io/2016/03/16/retain-cycles-function-references/)
