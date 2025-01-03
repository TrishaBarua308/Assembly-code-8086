.model small
.stack 100h
.code
.data
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,1
    int 21h
    mov bl,al
    
    mov cl,'1'
   
   for:
    cmp cl,bl
    jg exit:
    
    sub cl,'0'  ; cl contains int value
    
    add bh,cl   ; bh+=cl
    
    add cl,'0'  ;convert back to character
    
    inc cl
    jmp for:
      
      exit:
    mov dl,bh
    add dl,'0'  
    
    mov ah,2
    int 21h 
    
    mov ah,4ch
    int 21h
    main endp
end main