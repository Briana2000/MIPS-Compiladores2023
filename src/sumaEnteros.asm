.text
.globl main
.globl suma_enteros

# En este código MIPS se suman 2 números enteros. 
# Se hace uso de la pila para guardar y acceder a los registros.

main:
    li $t0, 5          # Cargar el primer operando
    addi $sp, $sp, -4  # actualizar el sp
    sw $t0, 0($sp)     # apilar t0
    li $t1, 2          # Cargar el segundo operando
    addi $sp, $sp, -4  # actualizar el sp
    sw $t1, 0($sp)     # apilar t1
    jal suma_enteros   # Llamar a la función suma
    lw $t0, 0($sp)     # Obtener el resultado de la suma de la pila
    addi $sp, $sp, 4   # actualizar el sp
    li $v0, 1          # Preparar la llamada a la función print_int
    move $a0, $t0      # Mover el resultado de la suma a $a0
    syscall            # Llamar a la función print_int
    li $v0, 10         # Preparar la llamada a la función exit
    syscall            # Llamar a la función exit


suma_enteros: 
    lw $t1, 0($sp)     # Obtener el segundo operando
    addi $sp, $sp, 4   # actualizar el sp
    lw $t0, 0($sp)     # Obtener el primer operando
    addi $sp, $sp, 4   # actualizar el sp
    add $t0, $t0, $t1  # Realizar la suma
    addi $sp, $sp, -4  # actualizar el sp
    sw $t0, 0($sp)     # Guardar el resultado en la pila
    jr $ra             # Volver a la dirección de retorno
 
