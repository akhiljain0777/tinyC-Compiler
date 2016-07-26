	.file	"ass1_14CS10003.c"					#file name
	.section	.rodata						#read-only data section
	.align 8							#align with 8-byte boundary 
.LC0:									#Label of f-string-1st printf
	.string	"Enter how many elements you want:"
.LC1:									#Label of f-string scanf
	.string	"%d"
.LC2:									#Label of f-string-2nd printf
	.string	"Enter the %d elements:\n"
.LC3:									#Label of f-string-3rd printf		
	.string	"\nEnter the item to search"
.LC4:									#Label of f-string-4th printf
	.string	"\n%d found in position: %d\n"
.LC5:									#Label of f-string-5th printf
	.string	"\n%d inserted in position: %d\n"
.LC6:									#Label of f-string-6th printf
	.string	"The list of %d elements:\n"
.LC7:									#Label of f-string-7th printf
	.string	"%6d"
	.text								#Code starts
	.globl	main							#main is a global name
	.type	main, @function						#main is a function
main:									#main : Starts
.LFB0:
	.cfi_startproc							#Call Frame Information
	pushq	%rbp							#Save old Base Pointer
	.cfi_def_cfa_offset 16						#adding an absolute offset
	.cfi_offset 6, -16
	movq	%rsp, %rbp						#rbp <-- rsp set new stack base pointer
	.cfi_def_cfa_register 6
	subq	$416, %rsp						#create space for local array and variables 100*4 + 4*4
	movl	$.LC0, %edi						#edi <-- starting address of LC0 printf format string
	call	puts							#Call puts for printf
	leaq	-416(%rbp), %rax					# rsi < -- (rbp-416)  &n
	movq	%rax, %rsi						# rsi < -- rax   (n)
	movl	$.LC1, %edi						# edi < -- starting address of scanf format string
	movl	$0, %eax						# eax < -- 0
	call	__isoc99_scanf						# scanf return value is stored in eax 
	movl	-416(%rbp), %eax					# eax < - - rbp - 416  (pointing to n) 
	movl	%eax, %esi						# esi < -- eax (n)		
	movl	$.LC2, %edi						# edi < -- starting address of LC2 printf format string
	movl	$0, %eax						# eax < -- 0
	call	printf							# printf is called
	movl	$0, -408(%rbp)						# (rbp - 408 ) < -- 0  (i=0)
	jmp	.L2			
.L3:
	leaq	-400(%rbp), %rax					# rax < -- (rbp-400) accessing the array
	movl	-408(%rbp), %edx					# edx < -- (rbp - 408) i.e. edx is assigned to i
	movslq	%edx, %rdx						# value of i(edx) is stored in rdx	
	salq	$2, %rdx						# rdx < -- shift arithmetic 2 bit left (4*i)
	addq	%rdx, %rax						# rax < -- rax + rdx (4*i)
	movq	%rax, %rsi						# rsi < -- rax  (&data[i])	
	movl	$.LC1, %edi						# edi < -- starting address of scanf format string
	movl	$0, %eax						# eax < -- 0
	call	__isoc99_scanf						# scanf return value is stored in eax
	addl	$1, -408(%rbp)						# (rbp - 408)= (rbp - 408) + 1  i.e (i=i+1)
.L2:
	movl	-416(%rbp), %eax					# eax < -- n
	cmpl	%eax, -408(%rbp)					# (rbp - 408 ) < eax  i.e (i < n)
	jl	.L3							# if condition true then continue the scanning loop
	movl	-416(%rbp), %edx					# edx < --(rbp - 416) i.e edx = n
	leaq	-400(%rbp), %rax					# rax < -- (rbp - 400) (starting pointer of array)
	movl	%edx, %esi						# esi (2nd parameter of inst_sort) < -- edx  i.e. esi=n
	movq	%rax, %rdi						# rdi (1st parameter of inst_sort) < -- rax (starting pointer of a)
	call	inst_sort						# inst_sort is called
	movl	$.LC3, %edi						# edi < -- starting address of LC3 printf format string
	call	puts							# call puts for printf
	leaq	-412(%rbp), %rax					# rax < -- (rbp - 412)   (for item)
	movq	%rax, %rsi						# rsi < -- rax
	movl	$.LC1, %edi						# edi < -- starting address of scanf format string
	movl	$0, %eax						# eax < -- 0
	call	__isoc99_scanf						# scanf return value is stored in eax
	movl	-412(%rbp), %edx					# edx (3rd argument of binary search) <--(rbp-412) item
	movl	-416(%rbp), %ecx					# ecx < -- (rbp - 416 ) i.e. ecx=n
	leaq	-400(%rbp), %rax					# rax < -- (rbp - 400) < -- starting of array
	movl	%ecx, %esi						# esi(2nd parameter of binary search) < -- edx i.e. n
	movq	%rax, %rdi					# rdi(1st parameter of binary search) < -- rax i.e starting of array
	call	bsearch							# binary search called
	movl	%eax, -404(%rbp)				# (rbp - 404) <-- eax   (for loc)(eax stores return value of bsearch)
	movl	-404(%rbp), %eax					# eax < -- (rbp -404) 
	cltq								#cltq promotes an int to an int64 (eax to rax)	
	movl	-400(%rbp,%rax,4), %edx					# edx < -- a[loc] i.e. rdx < -- (rbp-400)+4*rax 
	movl	-412(%rbp), %eax					# eax < -- item i.e. eax < -- (rbp - 412)
	cmpl	%eax, %edx						# a[loc] is compared with item
	jne	.L4							# if not equals to then jump to else statement
	movl	-404(%rbp), %eax					# eax < -- (rbp-404) i.e. eax < -- loc 
	leal	1(%rax), %edx						# edx(1st parameter of printf) < -- (rax +1)  i.e. edx <-- loc+1
	movl	-412(%rbp), %eax					# eax <-- (rbp - 412) i.e. eax < -- item 
	movl	%eax, %esi						# esi (2nd parameter of printf) <--  eax
	movl	$.LC4, %edi						#edi < -- starting address of LC4 printf format string
	movl	$0, %eax						# eax < -- 0
	call	printf							# call for printf and eax stores return value of printf
	jmp	.L5							# jump to L5 and skip else
.L4:
	movl	-412(%rbp), %edx					#edx(3rd parameter of insert) < -- (rbp-412) i.e. edx=item
	movl	-416(%rbp), %ecx					#ecx <-- (rbp - 416) i.e. ecx=n
	leaq	-400(%rbp), %rax					#rax <-- (rbp - 400) i.e ecx points to starting index of array 
	movl	%ecx, %esi						#esi(2nd parameter of insert) < -- ecx i.e. esi = n
	movq	%rax, %rdi						#rdi(1st parameter of insert)<--rax i.e starting index of array
	call	insert							#insert is called
	movl	%eax, -404(%rbp)				 	#(rbp - 404) <--eax i.e return value of insert  (loc<--eax)
	movl	-416(%rbp), %eax					# eax <-- (rbp - 416) i.e. eax <-- n
	addl	$1, %eax						# eax <-- eax+1
	movl	%eax, -416(%rbp)					# (rbp - 416) <-- eax i.e. n is incrimented
	movl	-404(%rbp), %eax					# eax < -- (rbp-404) i.e. eax < -- loc 
	leal	1(%rax), %edx						# edx(1st parameter of printf) < -- (rax +1)  i.e. edx <-- loc+1
	movl	-412(%rbp), %eax					# eax <-- (rbp - 412) i.e. eax < -- item 
	movl	%eax, %esi						# esi (2nd parameter of printf) <--  eax
	movl	$.LC5, %edi						#edi < -- starting address of LC5 printf format string
	movl	$0, %eax						# eax <-- 0
	call	printf							# call for printf and eax stores return value of printf
.L5:
	movl	-416(%rbp), %eax					# eax <-- (rbp - 416) i.e. eax <-- n
	movl	%eax, %esi						# esi (2nd parameter of printf) <--  eax
	movl	$.LC6, %edi						# edi <-- starting address of LC6 printf format string
	movl	$0, %eax						# eax <-- 0
	call	printf							# call for printf and eax stores return value of printf
	movl	$0, -408(%rbp)						# (rbp - 408) < -- 0 i.e i=0
	jmp	.L6							# jmp to L6
.L7:
	movl	-408(%rbp), %eax					# eax <-- (rbp - 408) i.e. eax <-- i
	cltq								#convert int to int64 (eax to rax) 
	movl	-400(%rbp,%rax,4), %eax					# eax < -- (rbp-400) + 4* rax  i.e. eax <-- a[i]
	movl	%eax, %esi						# esi(2nd argument to printf)
	movl	$.LC7, %edi						#edi < -- starting address of LC7 printf format string 
	movl	$0, %eax						# eax <-- 0
	call	printf							#call for printf and eax stores return value of printf
	addl	$1, -408(%rbp)						#(rbp - 408) =(rbp -408) +1 i.e. i = i+1
.L6:
	movl	-416(%rbp), %eax					# eax <-- (rbp - 416) i.e. eax <-- n
	cmpl	%eax, -408(%rbp)					# (rbp - 408) i.e i is compared with n
	jl	.L7							# if i<n jump to L7
	movl	$10, %edi						# edi <-- 10
	call	putchar							# put "\n"
	movl	$0, %eax						# eax <-- 0
	leave								# leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc							# end of process				
.LFE0:
	.size	main, .-main
	.globl	inst_sort						# inst_sort is global name
	.type	inst_sort, @function					# inst_sort is function 
inst_sort:
.LFB1:
	.cfi_startproc							# Call Frame Information
	pushq	%rbp							# Save old base pointer
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	$1, -8(%rbp)
	jmp	.L10
.L14:
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, -4(%rbp)
	movl	-8(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -12(%rbp)
	jmp	.L11
.L13:
	movl	-12(%rbp), %eax
	cltq
	addq	$1, %rax
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	-24(%rbp), %rax
	addq	%rcx, %rax
	movl	(%rax), %eax
	movl	%eax, (%rdx)
	subl	$1, -12(%rbp)
.L11:
	cmpl	$0, -12(%rbp)
	js	.L12
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	-4(%rbp), %eax
	jg	.L13
.L12:
	movl	-12(%rbp), %eax
	cltq
	addq	$1, %rax
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movl	-4(%rbp), %eax
	movl	%eax, (%rdx)
	addl	$1, -8(%rbp)
.L10:
	movl	-8(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jl	.L14
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	inst_sort, .-inst_sort
	.globl	bsearch
	.type	bsearch, @function
bsearch:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	%edx, -32(%rbp)
	movl	$1, -8(%rbp)
	movl	-28(%rbp), %eax
	movl	%eax, -12(%rbp)
.L19:
	movl	-12(%rbp), %eax
	movl	-8(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	-32(%rbp), %eax
	jle	.L16
	movl	-4(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -12(%rbp)
	jmp	.L17
.L16:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	-32(%rbp), %eax
	jge	.L17
	movl	-4(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -8(%rbp)
.L17:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	-32(%rbp), %eax
	je	.L18
	movl	-8(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jle	.L19
.L18:
	movl	-4(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	bsearch, .-bsearch
	.globl	insert
	.type	insert, @function
insert:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	%edx, -32(%rbp)
	movl	-28(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -4(%rbp)
	jmp	.L22
.L24:
	movl	-4(%rbp), %eax
	cltq
	addq	$1, %rax
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	-24(%rbp), %rax
	addq	%rcx, %rax
	movl	(%rax), %eax
	movl	%eax, (%rdx)
	subl	$1, -4(%rbp)
.L22:
	cmpl	$0, -4(%rbp)
	js	.L23
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	-32(%rbp), %eax
	jg	.L24
.L23:
	movl	-4(%rbp), %eax
	cltq
	addq	$1, %rax
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movl	-32(%rbp), %eax
	movl	%eax, (%rdx)
	movl	-4(%rbp), %eax
	addl	$1, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	insert, .-insert
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.1) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
