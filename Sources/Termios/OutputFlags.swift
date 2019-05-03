//
//  OutputFlags.swift
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

/// Output flag values in a `termios` structure.
public struct OutputFlags: OptionSet {
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

    public static let zero: OutputFlags = {
        return .init(rawValue: 0)
    }()

    /// Enable implementation-defined output processing.
    public static let post = OutputFlags(OPOST)

    /// (not in POSIX) Map lowercase characters to uppercase on output.
    public static let uppercased = OutputFlags(OLCUC)

    /// (XSI) Map NL to CR-NL on output.
    public static let nlToCR = OutputFlags(ONLCR)

    /// Map CR to NL on output.
    public static let crToNL = OutputFlags(OCRNL)

    /// Don't output CR at colun=mn 0.
    public static let noCR = OutputFlags(ONOCR)

    /// Don't output CR.
    public static let nlOnly = OutputFlags(ONLRET)

    /// Send fill characters for a delay, rather than using a timed delay.
    public static let fill = OutputFlags(OFILL)

    /// Fill character is ASCII DEL (0177). If unset, fill character is ASCII NUL ('\0'). (Not implemented on Linux.)
    public static let fillDelete = OutputFlags(OFDEL)

    /// Newline delay mask. Values are nl0 and nl1. [requires _BSD_SOURCE, _SVID_SOURCE, _SVID_SOURCE, or _XOPEN_SOURCE]
    public static let nlDelay = OutputFlags(NLDLY)
    /// Newline delay mask. [requires _BSD_SOURCE, _SVID_SOURCE, _SVID_SOURCE, or _XOPEN_SOURCE]
    public static let nl0 = OutputFlags(NL0)
    /// Newline delay mask. [requires _BSD_SOURCE, _SVID_SOURCE, _SVID_SOURCE, or _XOPEN_SOURCE]
    public static let nl1 = OutputFlags(NL1)

    /**
    Carriage return delay mask. Values are tab0, tab1, tab2, tab3 (or xTabs). A value of tab3, that is, xTabs, expands
    tabs to spaces (with tab stops every eight columns). [requires _BSD_SOURCE, _SVID_SOURCE, or _XOPEN_SOURCE]
    */
    public static let tabDelay = OutputFlags(TABDLY)
    /// Carriage return delay mask. [requires _BSD_SOURCE, _SVID_SOURCE, or _XOPEN_SOURCE]
    public static let tab1 = OutputFlags(TAB1)
    /// Carriage return delay mask. [requires _BSD_SOURCE, _SVID_SOURCE, or _XOPEN_SOURCE]
    public static let tab2 = OutputFlags(TAB2)
    /**
    carriage return delay mask. expandstabs to spaces (with tab stops every eight columns). [requires _bsd_source,
    _svid_source, or _xopen_source]
    */
    public static let tab3 = OutputFlags(TAB3)
    /**
    carriage return delay mask. expandstabs to spaces (with tab stops every eight columns). [requires _bsd_source,
    _svid_source, or _xopen_source]
    */
    public static let xTabs = OutputFlags(XTABS)

    /**
    Backspace delay mask. Values are bs0 or bs1. (Has never been implemented.) [requires _BSD_SOURCE, _SVID_SOURCE, or
    _XOPEN_SOURCE]
    */
    public static let bsDelay = OutputFlags(BSDLY)
    /// Backspace delay mask. (Has never been implemented.) [requires _BSD_SOURCE, _SVID_SOURCE, or _XOPEN_SOURCE]
    public static let bs0 = OutputFlags(BS0)
    /// Backspace delay mask. (Has never been implemented.) [requires _BSD_SOURCE, _SVID_SOURCE, or _XOPEN_SOURCE]
    public static let bs1 = OutputFlags(BS1)

    /// Vertical tab delay mask. Values are vt0 or vt1.
    public static let vtDelay = OutputFlags(VTDLY)
    /// Vertical tab delay mask.
    public static let vt0 = OutputFlags(VT0)
    /// Vertical tab delay mask.
    public static let vt1 = OutputFlags(VT1)

    /// Form feed delay mask. Values are FF0 or FF1. [requires _BSD_SOURCE, _SVID_SOURCE, or _XOPEN_SOURCE]
    public static let ffDelay = OutputFlags(FFDLY)
    /// Form feed delay mask. [requires _BSD_SOURCE, _SVID_SOURCE, or _XOPEN_SOURCE]
    public static let ff0 = OutputFlags(FF0)
    /// Form feed delay mask. [requires _BSD_SOURCE, _SVID_SOURCE, or _XOPEN_SOURCE]
    public static let ff1 = OutputFlags(FF1)
}
