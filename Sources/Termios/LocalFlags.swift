//
//  LocalFlags.swift
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

/// Local flag values in a `termios` structure.
public struct LocalFlags: OptionSet {
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

    public static let zero: LocalFlags = {
        return .init(rawValue: 0)
    }()

    /// When any of the characters INTR, QUIT, SUSP, or DSUSP are received, generate the corresponding signal.
    public static let signal = LocalFlags(ISIG)

    /// Enable canonical mode (described below).
    public static let canonical = LocalFlags(ICANON)

    /**
    (not in POSIX; not supported under Linux) If canonical is also set, terminal is uppercase only. Input is converted
    to lowercase, except of characters preceded by \. On output, uppercase characters are preceded by \ and lowercase
    characters are converted to uppercase. [requires _BSD_SOURCE, _SVID_SOURCE, or _XOPEN_SOURCE]
    */
    public static let xCase = LocalFlags(XCASE)

    /// Echo input characters
    public static let echo = LocalFlags(ECHO)

    /**
    If canonical is also set, the ERASE character erases the preceding input character, and WERASE erases the preceding
    word.
    */
    public static let echoErase = LocalFlags(ECHOE)

    /// If canonical is also set, the KILL character erases the current line.
    public static let echoKill = LocalFlags(ECHOK)

    /// If canonical is also set, echo the NL character even if EHCO is not set.
    public static let echoNL = LocalFlags(ECHONL)

    /**
    (not in POSIX) If echo is also set, terminal special characters other than TAB, NL, START, and STOP are echoed as
    ^X, where X is the character with ASCII code 0x40 greater than the special character.
    For example, character 0x08 (BS) is echoed as ^H. [requires _BSD_SOURCEor _SVID_SOURCE]
    */
    public static let echoControl = LocalFlags(ECHOCTL)

    /**
    (not in POSIX) If canonical and echo are also set, characters are printed as they are being erased. [requires
    _BSD_SOURCE or _SVID_SOURCE]
    */
    public static let echoPrint = LocalFlags(ECHOPRT)

    /**
    (not in POSIX) If canonical is also set, KILL is echoed by erasing each character on the line, as specified by
    echoErase and echoPrint. [requires _BSD_SOURCE or _SVID_SOURCE]
    */
    public static let echoKillErase = LocalFlags(ECHOKE)

    #if os(macOS)
    /// (not in POSIX) Echo only when a process is reading. (Not implemented on Linux.)
    public static let deafEcho = LocalFlags(DEFECHO)
    #endif

    /**
    (not in POSIX; not supported under Linux) Output is being flushed. This flag is toggled by typing the DISCARD
    character. [requires _BSD_SOURCE or _SVID_SOURCE]
    */
    public static let flush = LocalFlags(FLUSHO)

    /// Disable flushing the input and output queues when generating signals for the INT, QUIT, and SUSP characters
    public static let  noFlush = LocalFlags(NOFLSH)

    /**
    Send the SIGTTOU signal to the process group of a background process which tries to write to its controlling
    terminal.
    */
    public static let toStop = LocalFlags(TOSTOP)

    /**
    (not in POSIX; not supported under Linux) All characters in the input queue are reprinted when the next character is
    read. (bas(1) handles typeahead this way.) [requires _BSD_SOURCE or _SVID_SOURCE]
    */
    public static let pending = LocalFlags(PENDIN)

    /**
    Enable implementation-defined input processing. This flag, as well as canonical must be enabled for the special
    characters EOL2, LNEXT, REPRINT, WERASE to be interpreted, and for the lowercased flag to be effective.
    */
    public static let `extension` = LocalFlags(IEXTEN)
}
