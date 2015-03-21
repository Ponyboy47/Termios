//
//  LocalFlags.swift
//  Termios
//
//  Created by Neil Pankey on 3/20/15.
//  Copyright (c) 2015 Neil Pankey. All rights reserved.
//

import Darwin.POSIX.termios

/// Local flag values in a `termios` structure.
public struct LocalFlags : RawOptionSetType {
    private var value: UInt = 0

    public init(_ value: UInt) {
        self.value = value
    }

    // MARK: RawRepresentable

    public init(rawValue value: UInt) {
        self.value = value
    }

    public var rawValue: UInt {
        return value
    }

    // MARK: BitwiseOperationsType

    public static var allZeros: LocalFlags {
        return self(0)
    }

    // MARK: NilLiteralConvertible

    public init(nilLiteral: ()) {
        self.value = 0
    }
}