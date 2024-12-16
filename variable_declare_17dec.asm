.model small
.stack 100h
.data   ; store virtual address for variable initialization

a db 5  ; define byte, how much space needed  ,  static initialization
b db ?  ; dynamic initialization
.code   

main proc
    mov ax,@data  ;connection between code & data segment
    mov ds,ax     ; by default ax, so store in ds
    
    mov ah,1
    int 21h
    mov b,al      ; input b
    
    mov ah,2
    mov ah,10     ; new line
    int 21h
    mov ah,13     ;carriage return
    int 21h
    
    mov ah,2
    mov dl,a
    add dl,48
    int 21h       ; output a
    
    mov ah,2
    mov dl,b
    int 21h       ; output b
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main