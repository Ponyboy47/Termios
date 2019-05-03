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
import Darwin.C.stdio

println("Hello, World!")

let old = Termios.fetch(STDIN_FILENO).value!
var new = old
new.localFlags &= ~(.ECHO | .ICANON)
new.update(STDIN_FILENO)

let c = getchar()
println("\(c)\r")
print("at start?")

getchar()
```

## License

Termios is released under the MIT license.
