//
//  InputFlags.swift
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

/// Input flag values in a `termios` structure.
public struct InputFlags: OptionSet {
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

    public static let zero: InputFlags = {
        return .init(rawValue: 0)
    }()

    /// Ignore break condition on input.
    public static let ignoreBreak = InputFlags(IGNBRK)

    /**
    If ignoreBreak is set, a break is ignored. If it is not set but breakInterupt is set, then a break causes the input
    and output queues to be flushed, and if the terminal is the controlling terminal of a foreground process group, it
    will cause a SIGINT to be sent to this foreground process group. When neither ignoreBreak nor breakInterupt are set,
    a break reads as a null byte ('\0'), except when parityMark is set, in which case it reads as the sequence  \377 \0
    \0.
    */
    public static let breakInterupt = InputFlags(BRKINT)

    /// Ignore framing errors and parity errors.
    public static let ignoreParity = InputFlags(IGNPAR)

    /**
    If this bit is set, input bytes with parity or framing errors are marked when passed to the program. This bit is
    meaningful only when inputParityCheck is set and ignoreParity is not set. The way erroneous bytes are marked is with
    two preceding bytes, \377 and \0. Thus, the profram actually reads three bytes for one erroneous byte received from
    the terminal. If a valid byte has the value \377, and strip (see below) is not set, the program might confuse it
    with the prefix that marks a parity error. Therefore, a valid byte \377 is passed to the program as two bytes, \377
    \377, in this case.

    If neither ignoreParity nor parityMark is set, read a character with a parity error or framing error as \0.
    */
    public static let parityMark = InputFlags(PARMRK)

    /// Enable input parity checking.
    public static let inputParityCheck = InputFlags(INPCK)

    /// Strip off eighth bit.
    public static let strip = InputFlags(ISTRIP)

    /// Translate NL to CR on input.
    public static let nlToCR = InputFlags(INLCR)

    /// Ignore carriage return on input.
    public static let ignoreCR = InputFlags(IGNCR)

    /// Translate carriage return to newline on input (unless ignoreCR is set).
    public static let crToNL = InputFlags(ICRNL)

    /// (not in POSIX) Map uppercase characters to lowercase on input.
    public static let lowercased = InputFlags(IUCLC)

    /// Enable XON/XOFF flow control on output.
    public static let xOn = InputFlags(IXON)

    /**
    (XSI) Typing any character will restart stopped output. (The default is to allow just the START character to restart
    output.)
    */
    public static let xAny = InputFlags(IXANY)

    /// Enable XON/XOFF flow control on output.
    public static let xOff = InputFlags(IXOFF)

    /**
    (not in POSIX) Ring bell when input queue is full. Linux does not implement this bit, and acts as if it is always
    set.
    */
    public static let maxBell = InputFlags(IMAXBEL)

    /// (not in POSIX) Input is UTF8; this allows character-erase to be correctly performed in cooked mode.
    public static let utf8 = InputFlags(IUTF8)
}
