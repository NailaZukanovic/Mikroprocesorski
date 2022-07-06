name "calc-max-sum"
org 100h ; directive make tiny com file.
; calculate the sum of elements in vector,
; store result in position of max element

.data
; variables:
array db 5, 4, 3, 2, 1, 10, 9, 8, 7, 6

.code
; number of elements:
mov cx, 10

; al will store the sum:
mov ax, 0  

; bl will store the elements:
mov bx, 0

; dl will store the max:
mov dx, 0

; si is an index:
mov si, 0

; sum elements and max elelement:

next: 
mov bl, array[si]
add al, bl

; compare with next el
cmp dl,bl
jge nochange 

; position of max el 
mov di,si 
 
; max element in dl
mov dl,bl

; next byte:  
nochange:
inc si

; loop until cx=0:
loop next

; store result in position of max el: 

mov array[di], al

ret
