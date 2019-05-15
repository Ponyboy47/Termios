# Termios
Improving the auto-generated bindings for `termios` with additional type-safety and Swift-_isms_.

## Inspiration

Lots of ideas were borrowed from [japaric/termios.rs](https://github.com/japaric/termios.rs).

## Installation
SPM:
```swift
.package(url: "https://github.com/Ponyboy47/Termios.git", from: "0.1.0")
```

## Usage

```swift
import Termios

let password: String
print("Please enter the account password: ", terminator: "")
do {
    // Save the current terminal state
    var old = try Termios.fetch(fd: STDIN_FILENO)

    // Update the current terminal state to turn off echo
    var new = old
    new.localFlags.formSymmetricDifference([.echo, .canonical])
    try new.update(fd: STDIN_FILENO)

    // Ensure that the original terminal state is restored upon scope completion
    defer {
        do {
            try old.update(fd: STDIN_FILENO)
        } catch {
            fatalError("Failed to reenable stdin echo with error: \(error)")
        }
    }

    // Read input securely (without echoing characters to stdout)
    guard let _pass = readLine() else {
        fatalError("Swift process does not have a controlling terminal and cannot prompt for input")
    }
    password = _pass
} catch {
    fatalError("Failed to disable stdin echo with error: \(error)")
}

// Print a newline because the return key pressed by the user is not echoed
print()

print("The user entered \(password) as their secure input")
```

## License

Termios is released under the MIT license.
