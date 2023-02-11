
package main

import (
    "fmt"
    "os"

    "github.com/hashicorp/go-version"
    "github.com/google/uuid"
)

func main() {
    fmt.Println("test")
    

    // UUID の生成
    u, err := uuid.NewRandom()
    if err != nil {
        fmt.Println(err)
        return
    }
    uu := u.String()
    fmt.Println(uu)



    version_1 := "90.30.10"
    version_2 := "1.12.10"

    v1, err := version.NewVersion(version_1)
    if err != nil {
        fmt.Fprintln(os.Stderr, err)
        return
    }
    v2, err := version.NewVersion(version_2)
    if err != nil {
        fmt.Fprintln(os.Stderr, err)
        return
    }

    // V1.Compare(V2) の戻り値
    // 戻り値：-1    V1 > V2
    // 戻り値： 0    V1 = V2
    // 戻り値： 1    V1 < V2
    if v1.Compare(v2) < 0 {
        fmt.Printf("v1(%v) は v2(%v) より小さい\n", v1, v2)
    } else {
        fmt.Printf("v1(%v) は v2(%v) より小さくない\n", v1, v2)
    }
    if v1.Compare(v2) == 0 {
        fmt.Printf("v1(%v) は v2(%v) と等しい\n", v1, v2)
    } else {
        fmt.Printf("v1(%v) は v2(%v) とは等しくない\n", v1, v2)
    }
    if v1.Compare(v2) > 0 {
        fmt.Printf("v1(%v) は v2(%v) より大きい\n", v1, v2)
    } else {
        fmt.Printf("v1(%v) は v2(%v) より大きくない\n", v1, v2)
    }




}
