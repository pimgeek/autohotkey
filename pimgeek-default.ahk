
;; 通用快捷键
; 把 Alt + a 键映射为 Home 键
!a::SendInput {Home}
  ; 如果同时按下 Shift 键，等同于 Shift + Home
  +!a::SendInput, {LShift down}{Home}
  ; 如果同时按下 Ctrl 键，等同蝓 Ctrl + Home
  ^!a::SendInput, {LCtrl down}{Home}

; 把 Alt + e 键映射为 End 键
!e::SendInput {End}
  ; 如果同时按下 Shift 键，等同于 Shift + End
  +!e::SendInput, {LShift down}{End}
  ; 如果同时按下 Ctrl 键，等同于 Ctrl + End
  ^!e::SendInput, {LCtrl down}{End}

; 把 Alt + colon 映射为 Ctrl + Enter
!SC027::SendInput, {Ctrl down}{Enter}{Ctrl up}

; 把 Alt + h 键映射为左方向键
!h::SendInput, {Left}
  ; 如果同时按下 Shift 键，等同于 Alt + 左
  +!h::SendInput, {LShift down}{Left}
  ; 如果同时按下 Ctrl 键，等同于 Ctrl + 左
  ^!h::SendInput, {LCtrl down}{Left}
  ; 如果按下 Ctrl + Shift + h，则模仿 Ctrl + Shift + 左
  ^+h::SendInput, {LCtrl down}{LShift down}{Left}

; 把 Alt + j 键映射为下方向键
!j::SendInput, {Down}
  ; 如果同时按下 Shift 键，则向下扩大选区
  +!j::SendInput, {LShift down}{Down}
  ; 如果同时按下 Ctrl 键，等同于 Ctrl + 下
  ^!j::SendInput, {LCtrl down}{Down}
  ; 如果同时按下 Ctrl + j，等同于 Ctrl + 下
  ;^j::Send {LCtrl down}{Down}
  ; 如果同时按下 Ctrl + Shift + j，则模仿 Ctrl + Shift + 下
  ^+j::SendInput, {LCtrl down}{LShift down}{Down}

; 把 Alt + k 键映射为上方向键
!k::SendInput, {Up}
  ; 如果同时按下 Shift 键，则向上扩大选区
  +!k::SendInput, {LShift down}{Up}
  ; 如果同时按下 Ctrl 键，等同于 Ctrl + 上
  ^!k::SendInput, {LCtrl down}{Up}
  ; 如果同时按下 Ctrl + k，等同于 Ctrl + 上
  ;^k::Send {LCtrl down}{Up}
  ; 如果同时按下 Ctrl + Shift + k，则模仿 Ctrl + Shift + 上
  ^+k::SendInput, {LCtrl down}{LShift down}{Up}

; 把 Alt + l 键映射为右方向键
!l::SendInput, {Right}
  ; 如果同时按下 Shift 键，等同于 Alt + 右
  +!l::SendInput, {LShift down}{Right}
  ; 如果同时按下 Ctrl 键，等同于 Ctrl + 右
  ^!l::SendInput, {LCtrl down}{Right}
  ; 如果同时按下 Ctrl + Shift + l，则模仿 Ctrl + Shift + 右
  ^+l::SendInput, {LCtrl down}{LShift down}{Right}

; Alt + o 映射为 Alt + 左（代表 Zoom Out）
!o::SendInput, {LAlt down}{Left}
!b::SendInput, {LAlt down}{Left}
; Alt + i 映射为 Alt + 右（代表 Zoom ）
!i::SendInput, {LAlt down}{Right}
!f::SendInput, {LAlt down}{Right}
; 把 Alt + d 映射为删除键
!d::SendInput, {Delete}

; 把 Alt + m 映射为编辑模式开启键
!m::SendInput, {F2}

;;; TheBrain 快捷键
; 在 TheBrain 8 中，输入 Alt + ; 可以快速添加新的孤立节点
#IfWinActive ahk_class SunAwtFrame
!SC027::SendInput, {Tab}{Enter}
!h::Left
!j::Down
!k::Up
!l::Right
#IfWinActive
; 在 TheBrain8 中，输入 Alt + z 可以获取
; 节点标题中的 Zettel 编号（如果有的话）
#IfWinActive ahk_class SunAwtFrame

CopyTheBrainOutlineTitle() {
  Sleep, 100
  SendInput, {F2}
  Sleep, 200
  SendInput, {Ctrl down}{a}{Ctrl up}
  Sleep, 200
  SendInput, {Ctrl down}{c}{Ctrl up}
  Sleep, 120
  SendInput, {Esc}
}

!z::
  CopyTheBrainOutlineTitle()
  Sleep, 180
  zettel_array := StrSplit(clipboard, "-")
  clipboard := zettel_array[1]
return

!v::
  SendInput, {F2}
  Sleep, 120
  SendInput, {Home}
  Sleep, 120
  SendInput, {Ctrl down}{v}{Ctrl up}
  Sleep, 80
  SendInput, -
  Sleep, 80
  SendInput, {Left}
return

^g::
  old_clipboard := clipboard
  CopyTheBrainOutlineTitle()
  zettel_array := StrSplit(clipboard, "-")
  clipboard := zettel_array[1]
  Sleep, 160
  year_id := SubStr(clipboard, 1, 4)
  month_id := SubStr(clipboard, 5, 2)
  day_id := SubStr(clipboard, 7, 2)
  clipboard := year_id . "-" . month_id . "-" . day_id
  Sleep, 120
  SendInput, {Ctrl down}{p}{Ctrl up}
  Sleep, 300
  SendInput, %clipboard%
  Sleep, 360
  SendInput, {Down}
  Sleep, 120
  SendInput, {Enter}
  Sleep, 300
  SendInput, {Left}
  Sleep, 80
  CopyTheBrainOutlineTitle()
  date_str := clipboard
  Sleep, 80
  year_id := SubStr(date_str, 1, 4)
  month_id := SubStr(date_str, 6, 2)
  clipboard := year_id . "-" . month_id
  Sleep, 120
  SendInput, {Ctrl down}{p}{Ctrl up}
  Sleep, 300
  SendInput, %clipboard%
  clipboard := old_clipboard
  Sleep, 360
  SendInput, {Down}
  Sleep, 120
  SendInput, {Enter}
return

#IfWinActive

;;; 讯飞输入快捷键
; 用右侧的 Alt 键模拟 F10，唤起讯飞语音输入
RAlt::F4


