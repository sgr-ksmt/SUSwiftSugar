//
//  ArrayExtensions.swift

import Foundation

// MARK: - Push/Pop and Enqueue/Dequeue
public extension Array {

    public mutating func push(newElement: Element) {
        append(newElement)
    }
    
    /**
    - returns: return element or nil if self is empty.
    */
    public mutating func pop() -> Element? {
        if count == 0 { return nil }
        return removeLast()
    }
    
    public mutating func enqueue(newElement: Element) {
        append(newElement)
    }
    
    /**
    - returns: return element or nil if self is empty.
    */
    public mutating func dequeue() -> Element? {
        if count == 0 { return nil }
        return removeFirst()
    }
    
}

// MARK: - any/none/all/one
public extension SequenceType {

    public func any(@noescape block: (Self.Generator.Element -> Bool)) -> Bool {
        for item in self {
            if block(item) {
                return true
            }
        }
        return false
    }

    public func none(@noescape block: (Self.Generator.Element -> Bool)) -> Bool {
        return !any(block)
    }

    public func all(@noescape block: (Self.Generator.Element -> Bool)) -> Bool {
        for item in self {
            if !block(item) {
                return false
            }
        }
        return true
    }

    public func one(@noescape block: (Self.Generator.Element -> Bool)) -> Bool {
        return filter(block).count == 1
    }

}

// MARK: - Random/Shuffle
public extension Array {
    
    @warn_unused_result
    public func random() -> Element {
        return self[Int(arc4random_uniform(UInt32(count)))]
    }
    
    @warn_unused_result
    public func shuffled() -> [Element] {
        var result = self
        for var j = result.count - 1; j > 0; j-- {
            let k = Int(arc4random_uniform(UInt32(j + 1)))
            if j == k { continue }
            swap(&result[k], &result[j])
        }
        return result
    }
    
    public mutating func shuffle() {
        self = shuffled()
    }
    
}

// MARK: - Unique(remove duplicates)
public extension Array where Element: Equatable {
    
    @warn_unused_result
    public static func unique(source: [Element]) -> [Element] {
        return source.unique()
    }
    
    public func unique() -> [Element] {
        var r = [Element]()
        for i in self {
            r += !r.contains(i) ? [i]:[]
        }
        return r
    }
    
    public mutating func uniqueInPlace() {
        self = unique()
    }
    
    public mutating func removeElement(element: Element) -> Element? {
        guard let index = indexOf(element) else {
            return nil
        }
        return removeAtIndex(index)
    }
    
}

public extension SequenceType where Generator.Element: IntegerType {
    public func sum() -> Generator.Element {
        return reduce(0, combine: +)
    }
}