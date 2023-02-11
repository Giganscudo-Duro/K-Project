" 参考URL
" https://howpon.com/22135
" https://qiita.com/kimurap/items/7058c9fe29f51932b196
" https://vim-jp.org/vimdoc-ja/syntax.html

" 引用文 ---------------------------------------------------------------
"   条件１： 行頭が「> 」で始まっている
"   条件２： 「< 」だけで構成された行である
"   条件３：「 `」で始まり、「` 」で終わる
"   条件４：「```」で始まり、「``` 」で終わる
syntax region   K_Quote     start=+^> +     end=*$*
syntax region   K_Quote     start=+^    > + end=*$*
syntax region   K_Quote     start=+^<+      end=*$*
syntax region   K_Quote     start=+^    <+  end=*$*
syntax region   K_Quote     start=+\ `+     end=*`\ *
syntax region   K_Quote     start=+```+     end=*`\ *

" 見出し ---------------------------------------------------------------
"   条件１：「# 」で始まる行
syntax region   K_Headline  start=+^# +     end=+$+
syntax region   K_Headline  start=+^## +    end=+$+
syntax region   K_Headline  start=+^### +   end=+$+
syntax region   K_Headline  start=+^#### +  end=+$+

" 箇条書き -------------------------------------------------------------
"   条件１：行頭が「- 」で始まる行
"   条件２：行頭が「N. 」で始まる行
syntax region   K_BulletPoint   start=+^- +         end=+$+
syntax region   K_BulletPoint   start=+^[0-9]\+\. + end=+$+

" 強調構文 -------------------------------------------------------------
"   条件１：「 **」で始まり、「** 」で終わる
syntax region   K_Strong    start=+ \*\*+   end=+\*\* +

" 要注意項目 -----------------------------------------------------------
"   条件１：「【」で始まり、「】」で終わる
"   条件２：「 ~~」で始まり、「~~ 」で終わる
syntax region   K_Warning   start=+ \*\*+  end=+\*\* +
syntax region   K_Warning   start=+ \~\~+  end=+\~\~ +

" どこぞのサイト or ファイルパス ---------------------------------------
"   条件１：「 http」で始まり、「 」で終わる
syntax region   K_URL       start=+^http://+    end=+$+
syntax region   K_URL       start=+^https://+   end=+$+
syntax region   K_URL       start=+ http://+    end=+ +
syntax region   K_URL       start=+ https://+   end=+ +
syntax region   K_URL       start=+^D:\\+       end=+$+
syntax region   K_URL       start=+ D:\\+       end=+ +

" ハイライトの種別指定 -------------------------------------------------
highlight link  K_Quote         Function
highlight link  K_Warning       Error
highlight link  K_Headline      Structure
highlight link  K_BulletPoint   Label
highlight link  K_Strong        Label
highlight link  K_URL           Underlined
highlight link  K_Comment       Comment
