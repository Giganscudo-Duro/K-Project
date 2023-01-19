// ---------------------------------------------------------------
//
//  main.go
//
//                      May/19/2021
// ---------------------------------------------------------------
package main

import (
    "fmt"
    "os"
    "log"
    "net/http"
    "time"

	"os/exec"
	"bufio"
)

// ---------------------------------------------------------------
func sse(w http.ResponseWriter, r *http.Request) {
    flusher, _ := w.(http.Flusher)

    w.Header().Set("Content-Type", "text/event-stream")
    w.Header().Set("Cache-Control", "no-cache")
    w.Header().Set("Connection", "keep-alive")

    // 1秒おきにデータを流す
	/* KANA {{{
    t := time.NewTicker(1 * time.Second)
    defer t.Stop()
    go func() {
        cnt := 1
        for {
            select {
            case <-t.C:
                fmt.Fprintf(w, "data: %d\n\n", cnt)
                cnt++
                flusher.Flush()
            }
        }
    }()
    <-r.Context().Done()
    log.Println("コネクションが閉じました")
	}}} KANA */



    // ping の実行結果を返す
//	/* KANA {{{
	pingflag := false
	t := time.NewTicker(1 * time.Second)
	defer t.Stop()
	go func () {
	cmd := exec.Command("ping", "192.168.180.132")
	stdout, err := cmd.StdoutPipe()
	if err != nil {
		fmt.Println(err)
		os.Exit(1)
	}
	cmd.Start()
	pingflag = true
	scanner := bufio.NewScanner(stdout)

	for scanner.Scan(){
		if pingflag == false {
			// 接続が終了した場合
			break
		} else {
			fmt.Printf("==========\n")
			// fmt.Printf("pingflag = %v\n", pingflag)
			fmt.Printf("date: %s\n", scanner.Text())
			// イベント名：
			// データ内容：string(out)
			fmt.Fprintf(w, "event: %s\ndata: %s\n\n", "pingmonitor", scanner.Text())
			flusher.Flush()
		}
	}
	cmd.Wait()
	}()

	<-r.Context().Done()
	pingflag = false
	log.Println("コネクションが閉じました")

//	}}} KANA */


}

// ---------------------------------------------------------------
func main() {
    fmt.Fprintf (os.Stderr,"*** 開始 ***\n")
    fmt.Fprintf (os.Stderr,"http://localhost:8080/\n")

    dir := http.Dir("./static")
    http.HandleFunc("/event", sse)
    http.Handle("/", http.FileServer(dir))
    http.ListenAndServe(":8080", nil)

    fmt.Fprintf (os.Stderr,"*** 終了 ***\n")
}

// ---------------------------------------------------------------
