//
//  PropertyTest.swift
//  Report Guard Fail
//
//  Created by Andrej Krizmancic on 17/05/2017.
//  Copyright © 2017 Andrej Krizmancic. All rights reserved.
//



precedencegroup LowestPrecedenceGroup {
    associativity: left
    lowerThan: AssignmentPrecedence
}


infix operator ??? : LowestPrecedenceGroup


/// Use this operator in conjunction with reportFail() function to print in console
/// if parameter fails
///
/// - Parameters:
///   - lhs: The parameter on the left side of the ??? operator that's evaluated for nil.
///          If nil the function on the right side of the ??? operator is executed and
///          warning gets printed to the console.
///   - rhs: The parameter on the right side of the ??? operator that's evaluated for nil.
///          If nil the function on the right side of the ??? operator is executed and
///          warning gets printed to the console.
///
func ??? <T> (lhs: T?, rhs: @autoclosure () -> Void) -> T? {
    if lhs == nil {
        rhs()
    }
    return lhs
}


/// Use this operator in conjunction with reportFail() function to print in console
/// if parameter fails
///
/// - Parameters:
///   - lhs: The parameter on the left side of the ??? operator that's evaluated for true.
///          If false the function on the right side of the ??? operator is executed and
///          warning gets printed to the console.
///   - rhs: The parameter on the right side of the ??? operator that's evaluated for true.
///          If false the function on the right side of the ??? operator is executed and
///          warning gets printed to the console.
///
func ???(lhs: Bool, rhs: @autoclosure () -> Void) -> Bool {
    if lhs == false {
        rhs()
    }
    return lhs
}


/// This function shoud be used in conjunction with ??? operator to
/// print to console the file name and line where the fail condition occoured.
///
/// - Parameters:
///   - file: This parameter has the default value set to the file name.
///   - line: This parameter has the default value set to the line number.
///
func reportFail(file: String = #file, line: Int = #line) -> Void {
    let fileName = file.characters.split(separator: "/").map{String($0)}.last ?? ""
    print("WARNING, property failed: \(fileName), line \(line)")
    return
}

