;; 通用快捷键
; 把 Alt + a 键映射为 Home 键
!a::Send {Home}
  ; 如果同时按下 Shift 键，等同于 Shift + Home
  +!a::Send {LShift down}{Home}
  ; 如果同时按下 Ctrl 键，等同蝓 Ctrl + Home
  ^!a::Send {LCtrl down}{Home}

; 把 Alt + e 键映射为 End 键
!e::Send {End}
  ; 如果同时按下 Shift 键，等同于 Shift + End
  +!e::Send {LShift down}{End}
  ; 如果同时按下 Ctrl 键，等同于 Ctrl + End
  ^!e::Send {LCtrl down}{End}

; 把 Alt + colon 映射为 Ctrl + Enter
!SC027::Send {Ctrl down}{Enter}{Ctrl up}

; 把 Alt + h 键映射为左方向键
!h::Send {Left}
  ; 如果同时按下 Shift 键，等同于 Alt + 左
  +!h::Send {LAlt down}{Left}
  ; 如果同时按下 Ctrl 键，等同于 Ctrl + 左
  ^!h::Send {LCtrl down}{Left}
  ; Alt + o 也映射为 Alt + 左（代表 Zoom Out）
  !o::Send {LAlt down}{Left}
  ; 如果按下 Ctrl + Shift + h，则模仿 Ctrl + Shift + 左
  ^+h::Send {LCtrl down}{LShift down}{Left}
  ; 如果按下 Ctrl + Win + h，则模仿 Ctrl + Win + 左
  ^#h::Send {LCtrl down}{LWin down}{Left}

; 把 Alt + j 键映射为下方向键
!j::Send {Down}
  ; 如果同时按下 Shift 键，则向下扩大选区
  +!j::Send {LShift down}{Down}
  ; 如果同时按下 Ctrl 键，等同于 Ctrl + 下
  ^!j::Send {LCtrl down}{Down}
  ; 如果同时按下 Ctrl + j，等同于 Ctrl + 下
  ;^j::Send {LCtrl down}{Down}
  ; 如果同时按下 Ctrl + Shift + j，则模仿 Ctrl + Shift + 下
  ^+j::Send {LCtrl down}{LShift down}{Down}

; 把 Alt + k 键映射为上方向键
!k::Send {Up}
  ; 如果同时按下 Shift 键，则向上扩大选区
  +!k::Send {LShift down}{Up}
  ; 如果同时按下 Ctrl 键，等同于 Ctrl + 上
  ^!k::Send {LCtrl down}{Up}
  ; 如果同时按下 Ctrl + k，等同于 Ctrl + 上
  ;^k::Send {LCtrl down}{Up}
  ; 如果同时按下 Ctrl + Shift + k，则模仿 Ctrl + Shift + 上
  ^+k::Send {LCtrl down}{LShift down}{Up}

; 把 Alt + l 键映射为右方向键
!l::Send {Right}
  ; 如果同时按下 Shift 键，等同于 Alt + 右
  +!l::Send {LAlt down}{Right}
  ; 如果同时按下 Ctrl 键，等同于 Ctrl + 右
  ^!l::Send {LCtrl down}{Right}
  ; 如果同时按下 Ctrl + Shift + l，则模仿 Ctrl + Shift + 右
  ^+l::Send {LCtrl down}{LShift down}{Right}
  ; 如果按下 Ctrl + Win + l，则模仿 Ctrl + Win + 右
  ^#l::Send {LCtrl down}{LWin down}{Right}
; 把 Alt + d 映射为删除键
!d::Send {Delete}

; 把 Alt + m 映射为编辑模式开启键
!m::Send {F2}
; 用右侧的 Alt 键模拟 F10，唤起讯飞语音输入
RAlt::F10

; 用 Capslock 模拟鼠标左键点击
#ifWinActive, with Flash Piano:
Capslock::LButton
#IfWinActive

;;; TheBrain 快捷键
; 在 TheBrain 8 中，输入 Alt + h/j/k/l 可以快速移动光标位置
#IfWinActive ahk_class SunAwtFrame
!h::Left
!j::Down
!k::Up
!l::Right
#IfWinActive
; 在 TheBrain 8 中，输入 Alt + ; 可以快速添加新的孤立节点
#IfWinActive ahk_class SunAwtFrame
!SC027::Send {Tab}{Enter}
Capslock::
  Send {F9}
  ; 确保大写锁定永远关闭
  SetCapsLockState, Off
  SetCapsLockState, AlwaysOff
return
#IfWinActive
; 在 TheBrain8 中，输入 Alt + z 可以获取
; 节点标题中的 Zettel 编号（如果有的话）

CopyTheBrainOutlineTitle() {
  Sleep, 100
  Send, {F2}
  Sleep, 200
  Send, {Ctrl down}{a}{Ctrl up}
  Sleep, 200
  Send, {Ctrl down}{c}{Ctrl up}
  Sleep, 120
  Send, {Esc}
}

#IfWinActive ahk_class SunAwtFrame
!z::
  CopyTheBrainOutlineTitle()
  Sleep, 180
  zettel_array := StrSplit(clipboard, "-")
  clipboard := zettel_array[1]
return

!v::
  Send, {F2}
  Sleep, 120
  Send, {Home}
  Sleep, 120
  Send, {Ctrl down}{v}{Ctrl up}
  Sleep, 80
  Send, -
  Sleep, 80
  Send, {Left}
return

^g::
  CopyTheBrainOutlineTitle()
  zettel_array := StrSplit(clipboard, "-")
  clipboard := zettel_array[1]
  Sleep, 160
  year_id := SubStr(clipboard, 1, 4)
  month_id := SubStr(clipboard, 5, 2)
  day_id := SubStr(clipboard, 7, 2)
  clipboard := year_id . "-" . month_id . "-" . day_id
  Sleep, 120
  Send, {Ctrl down}{p}{Ctrl up}
  Sleep, 300
  Send, %clipboard%
  Sleep, 360
  Send, {Down}
  Sleep, 120
  Send, {Enter}
  Sleep, 300
  Send, {Left}
  Sleep, 80
  CopyTheBrainOutlineTitle()
  date_str := clipboard
  Sleep, 80
  year_id := SubStr(date_str, 1, 4)
  month_id := SubStr(date_str, 6, 2)
  clipboard := year_id . "-" . month_id
  Sleep, 120
  Send, {Ctrl down}{p}{Ctrl up}
  Sleep, 300
  Send, %clipboard%
  Sleep, 360
  Send, {Down}
  Sleep, 120
  Send, {Enter}
return

#IfWinActive
