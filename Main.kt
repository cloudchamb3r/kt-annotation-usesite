package main 

import jakarta.validation.constraints.NotBlank


data class DataClassImplicitUseSite(
    @NotBlank
    val name: String
)

data class DataClassExplicitUseSite(
    @field:NotBlank
    val name: String
)

class NormalClassImplicitUseSite(
    @NotBlank
    val name: String 
)

class NormalClassExplicitUseSite(
    @field:NotBlank
    val name: String 
)

fun main() {
    val a = DataClassImplicitUseSite("hello")
    val b = DataClassExplicitUseSite("hello")
    val c = NormalClassImplicitUseSite("hello")
    val d = NormalClassExplicitUseSite("hello")

    // it maybe useless but it could prevent unwanted optimizations
    println("$a $b $c $d")
}