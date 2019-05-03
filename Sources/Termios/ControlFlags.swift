//
//  ControlFlags.swift
//  Termios
//
//  Created by Neil Pankey on 3/20/15.
//  Copyright (c) 2019 Jacob Williams & Neil Pankey. All rights reserved.
//

#if os(macOS)
import Darwin
#else
import Glibc
#endif

/// Control flag values in a `termios` structure.
public struct ControlFlags: OptionSet {
    public var rawValue: UInt32

    private init(_ value: Int32) {
        self.init(rawValue: UInt32(value))
    }

    init(_ value: UInt32) {
        rawValue = value
    }

    public init(rawValue value: UInt32) {
        rawValue = value
    }

    public static let zero: ControlFlags = {
        return .init(rawValue: 0)
    }()

    /// (not in POSIX) Baud speed mask (4+1 bits). [requires _BSD_SOURCE or _SVID_SOURCE]
    public static let baud = ControlFlags(CBAUD)

    /// (not in POSIX) Extra baud speed mask (1 bit), included in baud. [requires _BSD_SOURCE or _SVID_SOURCE]
    public static let baudExtra = ControlFlags(CBAUDEX)

    /// Character size mask. Values are s5, s6, s7, or s8.
    public static let size = ControlFlags(CSIZE)
    /// Character size mask.
    public static let s5 = ControlFlags(CS5)
    /// Character size mask.
    public static let s6 = ControlFlags(CS6)
    /// Character size mask.
    public static let s7 = ControlFlags(CS7)
    /// Character size mask.
    public static let s8 = ControlFlags(CS8)

    /// Set two stop bitsm rather than one.
    public static let stopBits = ControlFlags(CSTOPB)

    /// Enable receiver.
    public static let read = ControlFlags(CREAD)

    /// Enable parity generation on output and parity checking for input.
    public static let parity = ControlFlags(PARENB)

    /// If set, then parity for input and output is odd; otherwise even parity is used.
    public static let oddParity = ControlFlags(PARODD)

    /// Lower modem control lines after last process closes the device (hang up).
    public static let hangUp = ControlFlags(HUPCL)

    /// Ignore modem control lines.
    public static let local = ControlFlags(CLOCAL)

    #if os(macOS)
    /// (not in POSIX) Block output from a noncurrent shell layer. For use by shl (shell layers).
    public static let block = ControlFlags(LOBLK)
    #endif

    /**
    (not in POSIX) Mask for input speeds. The values for the inputBaud bits are the same as the values for the baud
    bits, shifted left IBSHIFT bits. [requires _BSD_SOURCE or _SVID_SOURCE] (Not implemented on Linux.)
    */
    public static let inputBaud = ControlFlags(CIBAUD)

    /**
    (not in POSIX) Use "stick" (mark/space) parity (supported on certain serial devices): if oddParity is set, the
    parity bit is always 1; if oddParity is not set, then the parity bit is always 0. [requires _BSD_SOURCE or
    _SVID_SOURCE]
    */
    public static let cmsParity = ControlFlags(CMSPAR)

    /// (not in POSIX) Enable RTS/CTS (hardware) flow control. [requires _BSD_SOURCE or _SVID_SOURCE]
    public static let hwFlowControl = ControlFlags(CRTSCTS)
}
