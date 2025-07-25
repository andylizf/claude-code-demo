// Bad code with linter errors

const x = "hello"   // missing semicolon
var y = 'world'     // should use const, inconsistent quotes

function badFunction(a, b) {    // extra space, missing spaces after comma
    return a + b    // missing semicolon, no spaces around operator
}

// undefined variable
console.log(z)

// == instead of ===
if (x == "hello") {
    console.log("bad comparison")
} 