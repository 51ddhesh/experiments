	.file	"kilo.c"
	.text
	.globl	E
	.bss
	.align 32
	.type	E, @object
	.size	E, 208
E:
	.zero	208
	.section	.rodata
.LC0:
	.string	"\033[2J"
.LC1:
	.string	"\033[H"
	.text
	.globl	die
	.type	die, @function
die:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movl	$4, %edx
	leaq	.LC0(%rip), %rax
	movq	%rax, %rsi
	movl	$1, %edi
	call	write@PLT
	movl	$3, %edx
	leaq	.LC1(%rip), %rax
	movq	%rax, %rsi
	movl	$1, %edi
	call	write@PLT
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	perror@PLT
	movl	$1, %edi
	call	exit@PLT
	.cfi_endproc
.LFE6:
	.size	die, .-die
	.section	.rodata
.LC2:
	.string	"tcsetattr"
	.text
	.globl	disableRawMode
	.type	disableRawMode, @function
disableRawMode:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	144+E(%rip), %rax
	movq	%rax, %rdx
	movl	$2, %esi
	movl	$0, %edi
	call	tcsetattr@PLT
	cmpl	$-1, %eax
	jne	.L4
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	die
.L4:
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	disableRawMode, .-disableRawMode
	.section	.rodata
.LC3:
	.string	"tcgetattr"
	.text
	.globl	enableRawMode
	.type	enableRawMode, @function
enableRawMode:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	144+E(%rip), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	tcgetattr@PLT
	cmpl	$-1, %eax
	jne	.L6
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	call	die
.L6:
	leaq	disableRawMode(%rip), %rax
	movq	%rax, %rdi
	call	atexit@PLT
	movq	144+E(%rip), %rax
	movq	152+E(%rip), %rdx
	movq	%rax, -80(%rbp)
	movq	%rdx, -72(%rbp)
	movq	160+E(%rip), %rax
	movq	168+E(%rip), %rdx
	movq	%rax, -64(%rbp)
	movq	%rdx, -56(%rbp)
	movq	176+E(%rip), %rax
	movq	184+E(%rip), %rdx
	movq	%rax, -48(%rbp)
	movq	%rdx, -40(%rbp)
	movq	188+E(%rip), %rax
	movq	196+E(%rip), %rdx
	movq	%rax, -36(%rbp)
	movq	%rdx, -28(%rbp)
	movl	-80(%rbp), %eax
	andl	$-1331, %eax
	movl	%eax, -80(%rbp)
	movl	-76(%rbp), %eax
	andl	$-2, %eax
	movl	%eax, -76(%rbp)
	movl	-72(%rbp), %eax
	orl	$48, %eax
	movl	%eax, -72(%rbp)
	movl	-68(%rbp), %eax
	andl	$-32780, %eax
	movl	%eax, -68(%rbp)
	movb	$0, -57(%rbp)
	movb	$1, -58(%rbp)
	leaq	-80(%rbp), %rax
	movq	%rax, %rdx
	movl	$2, %esi
	movl	$0, %edi
	call	tcsetattr@PLT
	cmpl	$-1, %eax
	jne	.L9
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	die
.L9:
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L8
	call	__stack_chk_fail@PLT
.L8:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	enableRawMode, .-enableRawMode
	.section	.rodata
.LC4:
	.string	"read"
	.text
	.globl	editorReadKey
	.type	editorReadKey, @function
editorReadKey:
.LFB9:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	jmp	.L11
.L13:
	cmpl	$-1, -16(%rbp)
	jne	.L11
	call	__errno_location@PLT
	movl	(%rax), %eax
	cmpl	$11, %eax
	je	.L11
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	call	die
.L11:
	leaq	-17(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rsi
	movl	$0, %edi
	call	read@PLT
	movl	%eax, -16(%rbp)
	cmpl	$1, -16(%rbp)
	jne	.L13
	movzbl	-17(%rbp), %eax
	cmpb	$27, %al
	jne	.L14
	leaq	-11(%rbp), %rax
	movl	$1, %edx
	movq	%rax, %rsi
	movl	$0, %edi
	call	read@PLT
	cmpq	$1, %rax
	je	.L15
	movl	$27, %eax
	jmp	.L41
.L15:
	leaq	-11(%rbp), %rax
	addq	$1, %rax
	movl	$1, %edx
	movq	%rax, %rsi
	movl	$0, %edi
	call	read@PLT
	cmpq	$1, %rax
	je	.L17
	movl	$27, %eax
	jmp	.L41
.L17:
	movzbl	-11(%rbp), %eax
	cmpb	$91, %al
	jne	.L18
	movzbl	-10(%rbp), %eax
	cmpb	$47, %al
	jle	.L19
	movzbl	-10(%rbp), %eax
	cmpb	$57, %al
	jg	.L19
	leaq	-11(%rbp), %rax
	addq	$2, %rax
	movl	$1, %edx
	movq	%rax, %rsi
	movl	$0, %edi
	call	read@PLT
	cmpq	$1, %rax
	je	.L20
	movl	$27, %eax
	jmp	.L41
.L20:
	movzbl	-9(%rbp), %eax
	cmpb	$126, %al
	jne	.L43
	movzbl	-10(%rbp), %eax
	movsbl	%al, %eax
	subl	$49, %eax
	cmpl	$7, %eax
	ja	.L43
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L23(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L23(%rip), %rdx
	addq	%rdx, %rax
	notrack jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L23:
	.long	.L29-.L23
	.long	.L43-.L23
	.long	.L28-.L23
	.long	.L27-.L23
	.long	.L26-.L23
	.long	.L25-.L23
	.long	.L24-.L23
	.long	.L22-.L23
	.text
.L29:
	movl	$1005, %eax
	jmp	.L41
.L28:
	movl	$1004, %eax
	jmp	.L41
.L27:
	movl	$1006, %eax
	jmp	.L41
.L26:
	movl	$1007, %eax
	jmp	.L41
.L25:
	movl	$1008, %eax
	jmp	.L41
.L24:
	movl	$1005, %eax
	jmp	.L41
.L22:
	movl	$1006, %eax
	jmp	.L41
.L19:
	movzbl	-10(%rbp), %eax
	movsbl	%al, %eax
	subl	$65, %eax
	cmpl	$7, %eax
	ja	.L38
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L32(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L32(%rip), %rdx
	addq	%rdx, %rax
	notrack jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L32:
	.long	.L37-.L32
	.long	.L36-.L32
	.long	.L35-.L32
	.long	.L34-.L32
	.long	.L38-.L32
	.long	.L33-.L32
	.long	.L38-.L32
	.long	.L31-.L32
	.text
.L37:
	movl	$1002, %eax
	jmp	.L41
.L36:
	movl	$1003, %eax
	jmp	.L41
.L35:
	movl	$1001, %eax
	jmp	.L41
.L34:
	movl	$1000, %eax
	jmp	.L41
.L31:
	movl	$1005, %eax
	jmp	.L41
.L33:
	movl	$1006, %eax
	jmp	.L41
.L18:
	movzbl	-11(%rbp), %eax
	cmpb	$79, %al
	jne	.L38
	movzbl	-10(%rbp), %eax
	movsbl	%al, %eax
	cmpl	$70, %eax
	je	.L39
	cmpl	$72, %eax
	jne	.L38
	movl	$1005, %eax
	jmp	.L41
.L39:
	movl	$1006, %eax
	jmp	.L41
.L43:
	nop
.L38:
	movl	$27, %eax
	jmp	.L41
.L14:
	movzbl	-17(%rbp), %eax
	movsbl	%al, %eax
.L41:
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L42
	call	__stack_chk_fail@PLT
.L42:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	editorReadKey, .-editorReadKey
	.section	.rodata
.LC5:
	.string	"\033[6n"
.LC6:
	.string	"%d;%d"
	.text
	.globl	getCursorPosition
	.type	getCursorPosition, @function
getCursorPosition:
.LFB10:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%rdi, -72(%rbp)
	movq	%rsi, -80(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, -52(%rbp)
	movl	$4, %edx
	leaq	.LC5(%rip), %rax
	movq	%rax, %rsi
	movl	$1, %edi
	call	write@PLT
	cmpq	$4, %rax
	je	.L47
	movl	$-1, %eax
	jmp	.L55
.L51:
	leaq	-48(%rbp), %rdx
	movl	-52(%rbp), %eax
	addq	%rdx, %rax
	movl	$1, %edx
	movq	%rax, %rsi
	movl	$0, %edi
	call	read@PLT
	cmpq	$1, %rax
	jne	.L57
	movl	-52(%rbp), %eax
	movzbl	-48(%rbp,%rax), %eax
	cmpb	$82, %al
	je	.L58
	addl	$1, -52(%rbp)
.L47:
	cmpl	$30, -52(%rbp)
	jbe	.L51
	jmp	.L49
.L57:
	nop
	jmp	.L49
.L58:
	nop
.L49:
	movl	-52(%rbp), %eax
	movb	$0, -48(%rbp,%rax)
	movzbl	-48(%rbp), %eax
	cmpb	$27, %al
	jne	.L52
	movzbl	-47(%rbp), %eax
	cmpb	$91, %al
	je	.L53
.L52:
	movl	$-1, %eax
	jmp	.L55
.L53:
	movq	-80(%rbp), %rdx
	movq	-72(%rbp), %rax
	leaq	-48(%rbp), %rcx
	leaq	2(%rcx), %rdi
	movq	%rdx, %rcx
	movq	%rax, %rdx
	leaq	.LC6(%rip), %rax
	movq	%rax, %rsi
	movl	$0, %eax
	call	__isoc23_sscanf@PLT
	cmpl	$2, %eax
	je	.L54
	movl	$-1, %eax
	jmp	.L55
.L54:
	movl	$0, %eax
.L55:
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L56
	call	__stack_chk_fail@PLT
.L56:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	getCursorPosition, .-getCursorPosition
	.section	.rodata
.LC7:
	.string	"\033[999C\033[999B"
	.text
	.globl	getWindowSize
	.type	getWindowSize, @function
getWindowSize:
.LFB11:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	-16(%rbp), %rax
	movq	%rax, %rdx
	movl	$21523, %esi
	movl	$1, %edi
	movl	$0, %eax
	call	ioctl@PLT
	cmpl	$-1, %eax
	je	.L60
	movzwl	-14(%rbp), %eax
	testw	%ax, %ax
	jne	.L61
.L60:
	movl	$12, %edx
	leaq	.LC7(%rip), %rax
	movq	%rax, %rsi
	movl	$1, %edi
	call	write@PLT
	cmpq	$12, %rax
	je	.L62
	movl	$-1, %eax
	jmp	.L64
.L62:
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	getCursorPosition
	jmp	.L64
.L61:
	movzwl	-14(%rbp), %eax
	movzwl	%ax, %edx
	movq	-32(%rbp), %rax
	movl	%edx, (%rax)
	movzwl	-16(%rbp), %eax
	movzwl	%ax, %edx
	movq	-24(%rbp), %rax
	movl	%edx, (%rax)
	movl	$0, %eax
.L64:
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L65
	call	__stack_chk_fail@PLT
.L65:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	getWindowSize, .-getWindowSize
	.globl	editorRowRxToCx
	.type	editorRowRxToCx, @function
editorRowRxToCx:
.LFB12:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	$0, -8(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L67
.L71:
	movq	-24(%rbp), %rax
	movq	8(%rax), %rdx
	movl	-4(%rbp), %eax
	cltq
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$9, %al
	jne	.L68
	movl	-8(%rbp), %edx
	movl	%edx, %eax
	sarl	$31, %eax
	shrl	$29, %eax
	addl	%eax, %edx
	andl	$7, %edx
	subl	%eax, %edx
	movl	$7, %eax
	subl	%edx, %eax
	addl	%eax, -8(%rbp)
.L68:
	addl	$1, -8(%rbp)
	movl	-8(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jle	.L69
	movl	-4(%rbp), %eax
	jmp	.L70
.L69:
	addl	$1, -4(%rbp)
.L67:
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, -4(%rbp)
	jl	.L71
	movl	-4(%rbp), %eax
.L70:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	editorRowRxToCx, .-editorRowRxToCx
	.globl	editorRowCxToRx
	.type	editorRowCxToRx, @function
editorRowCxToRx:
.LFB13:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	$0, -8(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L73
.L75:
	movq	-24(%rbp), %rax
	movq	8(%rax), %rdx
	movl	-4(%rbp), %eax
	cltq
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$9, %al
	jne	.L74
	movl	-8(%rbp), %edx
	movl	%edx, %eax
	sarl	$31, %eax
	shrl	$29, %eax
	addl	%eax, %edx
	andl	$7, %edx
	subl	%eax, %edx
	movl	$7, %eax
	subl	%edx, %eax
	addl	%eax, -8(%rbp)
.L74:
	addl	$1, -8(%rbp)
	addl	$1, -4(%rbp)
.L73:
	movl	-4(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jl	.L75
	movl	-8(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	editorRowCxToRx, .-editorRowCxToRx
	.globl	editorUpdateRow
	.type	editorUpdateRow, @function
editorUpdateRow:
.LFB14:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	$0, -16(%rbp)
	movl	$0, -12(%rbp)
	jmp	.L78
.L80:
	movq	-24(%rbp), %rax
	movq	8(%rax), %rdx
	movl	-12(%rbp), %eax
	cltq
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$9, %al
	jne	.L79
	addl	$1, -16(%rbp)
.L79:
	addl	$1, -12(%rbp)
.L78:
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, -12(%rbp)
	jl	.L80
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-24(%rbp), %rax
	movl	(%rax), %ecx
	movl	-16(%rbp), %edx
	movl	%edx, %eax
	sall	$3, %eax
	subl	%edx, %eax
	addl	%ecx, %eax
	addl	$1, %eax
	cltq
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, 16(%rax)
	movl	$0, -8(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L81
.L86:
	movq	-24(%rbp), %rax
	movq	8(%rax), %rdx
	movl	-4(%rbp), %eax
	cltq
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$9, %al
	jne	.L82
	movq	-24(%rbp), %rax
	movq	16(%rax), %rcx
	movl	-8(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -8(%rbp)
	cltq
	addq	%rcx, %rax
	movb	$32, (%rax)
	jmp	.L83
.L84:
	movq	-24(%rbp), %rax
	movq	16(%rax), %rcx
	movl	-8(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -8(%rbp)
	cltq
	addq	%rcx, %rax
	movb	$32, (%rax)
.L83:
	movl	-8(%rbp), %eax
	andl	$7, %eax
	testl	%eax, %eax
	jne	.L84
	jmp	.L85
.L82:
	movq	-24(%rbp), %rax
	movq	8(%rax), %rdx
	movl	-4(%rbp), %eax
	cltq
	leaq	(%rdx,%rax), %rcx
	movq	-24(%rbp), %rax
	movq	16(%rax), %rsi
	movl	-8(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -8(%rbp)
	cltq
	leaq	(%rsi,%rax), %rdx
	movzbl	(%rcx), %eax
	movb	%al, (%rdx)
.L85:
	addl	$1, -4(%rbp)
.L81:
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, -4(%rbp)
	jl	.L86
	movq	-24(%rbp), %rax
	movq	16(%rax), %rdx
	movl	-8(%rbp), %eax
	cltq
	addq	%rdx, %rax
	movb	$0, (%rax)
	movq	-24(%rbp), %rax
	movl	-8(%rbp), %edx
	movl	%edx, 4(%rax)
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	editorUpdateRow, .-editorUpdateRow
	.globl	editorInsertRow
	.type	editorInsertRow, @function
editorInsertRow:
.LFB15:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$40, %rsp
	.cfi_offset 3, -24
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	cmpl	$0, -20(%rbp)
	js	.L91
	movl	28+E(%rip), %eax
	cmpl	%eax, -20(%rbp)
	jg	.L91
	movl	28+E(%rip), %eax
	addl	$1, %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	movq	32+E(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	realloc@PLT
	movq	%rax, 32+E(%rip)
	movl	28+E(%rip), %eax
	subl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdi
	movq	32+E(%rip), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rax, %rcx
	movq	32+E(%rip), %rsi
	movl	-20(%rbp), %eax
	cltq
	leaq	1(%rax), %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rsi, %rax
	movq	%rdi, %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	memmove@PLT
	movq	32+E(%rip), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movq	-40(%rbp), %rdx
	movl	%edx, (%rax)
	movq	-40(%rbp), %rax
	leaq	1(%rax), %rcx
	movq	32+E(%rip), %rsi
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	leaq	(%rsi,%rax), %rbx
	movq	%rcx, %rdi
	call	malloc@PLT
	movq	%rax, 8(%rbx)
	movq	32+E(%rip), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movq	8(%rax), %rax
	movq	-40(%rbp), %rdx
	movq	-32(%rbp), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	memcpy@PLT
	movq	32+E(%rip), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movq	8(%rax), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
	movq	32+E(%rip), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	$0, 4(%rax)
	movq	32+E(%rip), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movq	$0, 16(%rax)
	movq	32+E(%rip), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movq	%rax, %rdi
	call	editorUpdateRow
	movl	28+E(%rip), %eax
	addl	$1, %eax
	movl	%eax, 28+E(%rip)
	movl	40+E(%rip), %eax
	addl	$1, %eax
	movl	%eax, 40+E(%rip)
	jmp	.L87
.L91:
	nop
.L87:
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	editorInsertRow, .-editorInsertRow
	.globl	editorFreeRow
	.type	editorFreeRow, @function
editorFreeRow:
.LFB16:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.size	editorFreeRow, .-editorFreeRow
	.globl	editorDelRow
	.type	editorDelRow, @function
editorDelRow:
.LFB17:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	cmpl	$0, -4(%rbp)
	js	.L97
	movl	28+E(%rip), %eax
	cmpl	%eax, -4(%rbp)
	jge	.L97
	movq	32+E(%rip), %rcx
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movq	%rax, %rdi
	call	editorFreeRow
	movl	28+E(%rip), %eax
	subl	-4(%rbp), %eax
	subl	$1, %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdi
	movq	32+E(%rip), %rcx
	movl	-4(%rbp), %eax
	cltq
	leaq	1(%rax), %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rax, %rcx
	movq	32+E(%rip), %rsi
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rsi, %rax
	movq	%rdi, %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	memmove@PLT
	movl	28+E(%rip), %eax
	subl	$1, %eax
	movl	%eax, 28+E(%rip)
	movl	40+E(%rip), %eax
	addl	$1, %eax
	movl	%eax, 40+E(%rip)
	jmp	.L93
.L97:
	nop
.L93:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE17:
	.size	editorDelRow, .-editorDelRow
	.globl	editorRowInsertChar
	.type	editorRowInsertChar, @function
editorRowInsertChar:
.LFB18:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	%edx, -16(%rbp)
	cmpl	$0, -12(%rbp)
	js	.L99
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, -12(%rbp)
	jle	.L100
.L99:
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -12(%rbp)
.L100:
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	addl	$2, %eax
	movslq	%eax, %rdx
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	realloc@PLT
	movq	-8(%rbp), %rdx
	movq	%rax, 8(%rdx)
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	subl	-12(%rbp), %eax
	addl	$1, %eax
	cltq
	movq	-8(%rbp), %rdx
	movq	8(%rdx), %rcx
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	leaq	(%rcx,%rdx), %rsi
	movq	-8(%rbp), %rdx
	movq	8(%rdx), %rdx
	movl	-12(%rbp), %ecx
	movslq	%ecx, %rcx
	addq	$1, %rcx
	addq	%rdx, %rcx
	movq	%rax, %rdx
	movq	%rcx, %rdi
	call	memmove@PLT
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	-8(%rbp), %rax
	movl	%edx, (%rax)
	movq	-8(%rbp), %rax
	movq	8(%rax), %rdx
	movl	-12(%rbp), %eax
	cltq
	addq	%rdx, %rax
	movl	-16(%rbp), %edx
	movb	%dl, (%rax)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	editorUpdateRow
	movl	40+E(%rip), %eax
	addl	$1, %eax
	movl	%eax, 40+E(%rip)
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE18:
	.size	editorRowInsertChar, .-editorRowInsertChar
	.globl	editorRowAppendString
	.type	editorRowAppendString, @function
editorRowAppendString:
.LFB19:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	leaq	1(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	realloc@PLT
	movq	-8(%rbp), %rdx
	movq	%rax, 8(%rdx)
	movq	-8(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cltq
	leaq	(%rdx,%rax), %rcx
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rax, %rsi
	movq	%rcx, %rdi
	call	memcpy@PLT
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %edx
	movq	-24(%rbp), %rax
	addl	%edx, %eax
	movl	%eax, %edx
	movq	-8(%rbp), %rax
	movl	%edx, (%rax)
	movq	-8(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cltq
	addq	%rdx, %rax
	movb	$0, (%rax)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	editorUpdateRow
	movl	40+E(%rip), %eax
	addl	$1, %eax
	movl	%eax, 40+E(%rip)
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE19:
	.size	editorRowAppendString, .-editorRowAppendString
	.globl	editorRowDelChar
	.type	editorRowDelChar, @function
editorRowDelChar:
.LFB20:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	cmpl	$0, -12(%rbp)
	js	.L106
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, -12(%rbp)
	jge	.L106
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	subl	-12(%rbp), %eax
	cltq
	movq	-8(%rbp), %rdx
	movq	8(%rdx), %rdx
	movl	-12(%rbp), %ecx
	movslq	%ecx, %rcx
	addq	$1, %rcx
	leaq	(%rdx,%rcx), %rsi
	movq	-8(%rbp), %rdx
	movq	8(%rdx), %rcx
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	addq	%rdx, %rcx
	movq	%rax, %rdx
	movq	%rcx, %rdi
	call	memmove@PLT
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	leal	-1(%rax), %edx
	movq	-8(%rbp), %rax
	movl	%edx, (%rax)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	editorUpdateRow
	movl	40+E(%rip), %eax
	addl	$1, %eax
	movl	%eax, 40+E(%rip)
	jmp	.L102
.L106:
	nop
.L102:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE20:
	.size	editorRowDelChar, .-editorRowDelChar
	.section	.rodata
.LC8:
	.string	""
	.text
	.globl	editorInsertChar
	.type	editorInsertChar, @function
editorInsertChar:
.LFB21:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	4+E(%rip), %edx
	movl	28+E(%rip), %eax
	cmpl	%eax, %edx
	jne	.L108
	movl	28+E(%rip), %eax
	movl	$0, %edx
	leaq	.LC8(%rip), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	editorInsertRow
.L108:
	movl	E(%rip), %ecx
	movq	32+E(%rip), %rsi
	movl	4+E(%rip), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	leaq	(%rsi,%rax), %rdi
	movl	-4(%rbp), %eax
	movl	%eax, %edx
	movl	%ecx, %esi
	call	editorRowInsertChar
	movl	E(%rip), %eax
	addl	$1, %eax
	movl	%eax, E(%rip)
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE21:
	.size	editorInsertChar, .-editorInsertChar
	.globl	editorInsertNewLine
	.type	editorInsertNewLine, @function
editorInsertNewLine:
.LFB22:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	E(%rip), %eax
	testl	%eax, %eax
	jne	.L110
	movl	4+E(%rip), %eax
	movl	$0, %edx
	leaq	.LC8(%rip), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	editorInsertRow
	jmp	.L111
.L110:
	movq	32+E(%rip), %rcx
	movl	4+E(%rip), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	(%rax), %edx
	movl	E(%rip), %eax
	subl	%eax, %edx
	movslq	%edx, %rax
	movq	-8(%rbp), %rdx
	movq	8(%rdx), %rcx
	movl	E(%rip), %edx
	movslq	%edx, %rdx
	leaq	(%rcx,%rdx), %rsi
	movl	4+E(%rip), %edx
	leal	1(%rdx), %ecx
	movq	%rax, %rdx
	movl	%ecx, %edi
	call	editorInsertRow
	movq	32+E(%rip), %rcx
	movl	4+E(%rip), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movq	%rax, -8(%rbp)
	movl	E(%rip), %edx
	movq	-8(%rbp), %rax
	movl	%edx, (%rax)
	movq	-8(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cltq
	addq	%rdx, %rax
	movb	$0, (%rax)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	editorUpdateRow
.L111:
	movl	4+E(%rip), %eax
	addl	$1, %eax
	movl	%eax, 4+E(%rip)
	movl	$0, E(%rip)
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE22:
	.size	editorInsertNewLine, .-editorInsertNewLine
	.globl	editorDelChar
	.type	editorDelChar, @function
editorDelChar:
.LFB23:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	4+E(%rip), %edx
	movl	28+E(%rip), %eax
	cmpl	%eax, %edx
	je	.L117
	movl	E(%rip), %eax
	testl	%eax, %eax
	jne	.L115
	movl	4+E(%rip), %eax
	testl	%eax, %eax
	je	.L118
.L115:
	movq	32+E(%rip), %rcx
	movl	4+E(%rip), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movq	%rax, -8(%rbp)
	movl	E(%rip), %eax
	testl	%eax, %eax
	jle	.L116
	movl	E(%rip), %eax
	leal	-1(%rax), %edx
	movq	-8(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	editorRowDelChar
	movl	E(%rip), %eax
	subl	$1, %eax
	movl	%eax, E(%rip)
	jmp	.L112
.L116:
	movq	32+E(%rip), %rcx
	movl	4+E(%rip), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	subq	$24, %rax
	addq	%rcx, %rax
	movl	(%rax), %eax
	movl	%eax, E(%rip)
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	movslq	%eax, %rsi
	movq	-8(%rbp), %rax
	movq	8(%rax), %rcx
	movq	32+E(%rip), %rdi
	movl	4+E(%rip), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	subq	$24, %rax
	addq	%rdi, %rax
	movq	%rsi, %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	editorRowAppendString
	movl	4+E(%rip), %eax
	movl	%eax, %edi
	call	editorDelRow
	movl	4+E(%rip), %eax
	subl	$1, %eax
	movl	%eax, 4+E(%rip)
	jmp	.L112
.L117:
	nop
	jmp	.L112
.L118:
	nop
.L112:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE23:
	.size	editorDelChar, .-editorDelChar
	.globl	editorRowsToString
	.type	editorRowsToString, @function
editorRowsToString:
.LFB24:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movl	$0, -28(%rbp)
	movl	$0, -24(%rbp)
	jmp	.L120
.L121:
	movq	32+E(%rip), %rcx
	movl	-24(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	(%rax), %eax
	addl	$1, %eax
	addl	%eax, -28(%rbp)
	addl	$1, -24(%rbp)
.L120:
	movl	28+E(%rip), %eax
	cmpl	%eax, -24(%rbp)
	jl	.L121
	movq	-40(%rbp), %rax
	movl	-28(%rbp), %edx
	movl	%edx, (%rax)
	movl	-28(%rbp), %eax
	cltq
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	movl	$0, -20(%rbp)
	jmp	.L122
.L123:
	movq	32+E(%rip), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	(%rax), %eax
	movslq	%eax, %rsi
	movq	32+E(%rip), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movq	8(%rax), %rcx
	movq	-16(%rbp), %rax
	movq	%rsi, %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	memcpy@PLT
	movq	32+E(%rip), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	(%rax), %eax
	cltq
	addq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movb	$10, (%rax)
	addq	$1, -16(%rbp)
	addl	$1, -20(%rbp)
.L122:
	movl	28+E(%rip), %eax
	cmpl	%eax, -20(%rbp)
	jl	.L123
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE24:
	.size	editorRowsToString, .-editorRowsToString
	.section	.rodata
.LC9:
	.string	"r"
.LC10:
	.string	"fopen"
	.text
	.globl	editorOpen
	.type	editorOpen, @function
editorOpen:
.LFB25:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -56(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	48+E(%rip), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	strdup@PLT
	movq	%rax, 48+E(%rip)
	movq	-56(%rbp), %rax
	leaq	.LC9(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L126
	leaq	.LC10(%rip), %rax
	movq	%rax, %rdi
	call	die
.L126:
	movq	$0, -40(%rbp)
	movq	$0, -32(%rbp)
	jmp	.L127
.L130:
	subq	$1, -24(%rbp)
.L128:
	cmpq	$0, -24(%rbp)
	jle	.L129
	movq	-40(%rbp), %rax
	movq	-24(%rbp), %rdx
	subq	$1, %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$10, %al
	je	.L130
	movq	-40(%rbp), %rax
	movq	-24(%rbp), %rdx
	subq	$1, %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$13, %al
	je	.L130
.L129:
	movq	-24(%rbp), %rdx
	movq	-40(%rbp), %rcx
	movl	28+E(%rip), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	editorInsertRow
.L127:
	movq	-16(%rbp), %rdx
	leaq	-32(%rbp), %rcx
	leaq	-40(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	getline@PLT
	movq	%rax, -24(%rbp)
	cmpq	$-1, -24(%rbp)
	jne	.L128
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	movl	$0, 40+E(%rip)
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L132
	call	__stack_chk_fail@PLT
.L132:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE25:
	.size	editorOpen, .-editorOpen
	.section	.rodata
.LC11:
	.string	"Save as: %s (ESC to cancel)"
.LC12:
	.string	"Save aborted"
.LC13:
	.string	"%d bytes written to disk"
.LC14:
	.string	"Cant Save! I/O error: %s"
	.text
	.globl	editorSave
	.type	editorSave, @function
editorSave:
.LFB26:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	48+E(%rip), %rax
	testq	%rax, %rax
	jne	.L134
	movl	$0, %esi
	leaq	.LC11(%rip), %rax
	movq	%rax, %rdi
	call	editorPrompt
	movq	%rax, 48+E(%rip)
	movq	48+E(%rip), %rax
	testq	%rax, %rax
	jne	.L134
	leaq	.LC12(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	editorSetStatusMessage
	jmp	.L133
.L134:
	leaq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	editorRowsToString
	movq	%rax, -16(%rbp)
	movq	48+E(%rip), %rax
	movl	$420, %edx
	movl	$66, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	open@PLT
	movl	%eax, -20(%rbp)
	cmpl	$-1, -20(%rbp)
	je	.L136
	movl	-24(%rbp), %eax
	movslq	%eax, %rdx
	movl	-20(%rbp), %eax
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	ftruncate@PLT
	cmpl	$-1, %eax
	je	.L137
	movl	-24(%rbp), %eax
	movslq	%eax, %rdx
	movq	-16(%rbp), %rcx
	movl	-20(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write@PLT
	movq	%rax, %rdx
	movl	-24(%rbp), %eax
	cltq
	cmpq	%rax, %rdx
	jne	.L137
	movl	-20(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movl	$0, 40+E(%rip)
	movl	-24(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	editorSetStatusMessage
	jmp	.L133
.L137:
	movl	-20(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
.L136:
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %edi
	call	strerror@PLT
	movq	%rax, %rsi
	leaq	.LC14(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	editorSetStatusMessage
.L133:
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L139
	call	__stack_chk_fail@PLT
.L139:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE26:
	.size	editorSave, .-editorSave
	.globl	editorFindCallback
	.type	editorFindCallback, @function
editorFindCallback:
.LFB27:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movl	%esi, -44(%rbp)
	cmpl	$13, -44(%rbp)
	je	.L141
	cmpl	$27, -44(%rbp)
	jne	.L142
.L141:
	movl	$-1, last_match.2(%rip)
	movl	$1, direction.1(%rip)
	jmp	.L140
.L142:
	cmpl	$1001, -44(%rbp)
	je	.L144
	cmpl	$1003, -44(%rbp)
	jne	.L145
.L144:
	movl	$1, direction.1(%rip)
	jmp	.L146
.L145:
	cmpl	$1000, -44(%rbp)
	je	.L147
	cmpl	$1002, -44(%rbp)
	jne	.L148
.L147:
	movl	$-1, direction.1(%rip)
	jmp	.L146
.L148:
	movl	$-1, last_match.2(%rip)
	movl	$1, direction.1(%rip)
.L146:
	movl	last_match.2(%rip), %eax
	cmpl	$-1, %eax
	jne	.L149
	movl	$1, direction.1(%rip)
.L149:
	movl	last_match.2(%rip), %eax
	movl	%eax, -24(%rbp)
	movl	$0, -20(%rbp)
	jmp	.L150
.L154:
	movl	direction.1(%rip), %eax
	addl	%eax, -24(%rbp)
	cmpl	$-1, -24(%rbp)
	jne	.L151
	movl	28+E(%rip), %eax
	subl	$1, %eax
	movl	%eax, -24(%rbp)
	jmp	.L152
.L151:
	movl	28+E(%rip), %eax
	cmpl	%eax, -24(%rbp)
	jne	.L152
	movl	$0, -24(%rbp)
.L152:
	movq	32+E(%rip), %rcx
	movl	-24(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	-40(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strstr@PLT
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	je	.L153
	movl	-24(%rbp), %eax
	movl	%eax, last_match.2(%rip)
	movl	-24(%rbp), %eax
	movl	%eax, 4+E(%rip)
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	-8(%rbp), %rdx
	subq	%rax, %rdx
	movq	-16(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	editorRowRxToCx
	movl	%eax, E(%rip)
	movl	28+E(%rip), %eax
	movl	%eax, 12+E(%rip)
	jmp	.L140
.L153:
	addl	$1, -20(%rbp)
.L150:
	movl	28+E(%rip), %eax
	cmpl	%eax, -20(%rbp)
	jl	.L154
.L140:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE27:
	.size	editorFindCallback, .-editorFindCallback
	.section	.rodata
	.align 8
.LC15:
	.string	"Search: %s (USE ESC/Arrows/Enter)"
	.text
	.globl	editorFind
	.type	editorFind, @function
editorFind:
.LFB28:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	E(%rip), %eax
	movl	%eax, -24(%rbp)
	movl	4+E(%rip), %eax
	movl	%eax, -20(%rbp)
	movl	16+E(%rip), %eax
	movl	%eax, -16(%rbp)
	movl	12+E(%rip), %eax
	movl	%eax, -12(%rbp)
	leaq	editorFindCallback(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC15(%rip), %rax
	movq	%rax, %rdi
	call	editorPrompt
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	je	.L156
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	jmp	.L158
.L156:
	movl	-24(%rbp), %eax
	movl	%eax, E(%rip)
	movl	-20(%rbp), %eax
	movl	%eax, 4+E(%rip)
	movl	-16(%rbp), %eax
	movl	%eax, 16+E(%rip)
	movl	-12(%rbp), %eax
	movl	%eax, 12+E(%rip)
.L158:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE28:
	.size	editorFind, .-editorFind
	.globl	abAppend
	.type	abAppend, @function
abAppend:
.LFB29:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	%edx, -36(%rbp)
	movq	-24(%rbp), %rax
	movl	8(%rax), %edx
	movl	-36(%rbp), %eax
	addl	%edx, %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	realloc@PLT
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	je	.L162
	movl	-36(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	movl	8(%rax), %eax
	movslq	%eax, %rcx
	movq	-8(%rbp), %rax
	addq	%rax, %rcx
	movq	-32(%rbp), %rax
	movq	%rax, %rsi
	movq	%rcx, %rdi
	call	memcpy@PLT
	movq	-24(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-24(%rbp), %rax
	movl	8(%rax), %edx
	movl	-36(%rbp), %eax
	addl	%eax, %edx
	movq	-24(%rbp), %rax
	movl	%edx, 8(%rax)
	jmp	.L159
.L162:
	nop
.L159:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE29:
	.size	abAppend, .-abAppend
	.globl	abFree
	.type	abFree, @function
abFree:
.LFB30:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE30:
	.size	abFree, .-abFree
	.globl	editorScroll
	.type	editorScroll, @function
editorScroll:
.LFB31:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$0, 8+E(%rip)
	movl	4+E(%rip), %edx
	movl	28+E(%rip), %eax
	cmpl	%eax, %edx
	jge	.L165
	movl	E(%rip), %ecx
	movq	32+E(%rip), %rsi
	movl	4+E(%rip), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rsi, %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	editorRowCxToRx
	movl	%eax, 8+E(%rip)
.L165:
	movl	4+E(%rip), %edx
	movl	12+E(%rip), %eax
	cmpl	%eax, %edx
	jge	.L166
	movl	4+E(%rip), %eax
	movl	%eax, 12+E(%rip)
.L166:
	movl	4+E(%rip), %edx
	movl	12+E(%rip), %ecx
	movl	20+E(%rip), %eax
	addl	%ecx, %eax
	cmpl	%eax, %edx
	jl	.L167
	movl	4+E(%rip), %edx
	movl	20+E(%rip), %eax
	subl	%eax, %edx
	leal	1(%rdx), %eax
	movl	%eax, 12+E(%rip)
.L167:
	movl	8+E(%rip), %edx
	movl	16+E(%rip), %eax
	cmpl	%eax, %edx
	jge	.L168
	movl	8+E(%rip), %eax
	movl	%eax, 16+E(%rip)
.L168:
	movl	8+E(%rip), %edx
	movl	16+E(%rip), %ecx
	movl	24+E(%rip), %eax
	addl	%ecx, %eax
	cmpl	%eax, %edx
	jl	.L170
	movl	8+E(%rip), %edx
	movl	24+E(%rip), %eax
	subl	%eax, %edx
	leal	1(%rdx), %eax
	movl	%eax, 16+E(%rip)
.L170:
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE31:
	.size	editorScroll, .-editorScroll
	.section	.rodata
.LC16:
	.string	"0.0.1"
.LC17:
	.string	"Kilo editor -- version %s"
.LC18:
	.string	"~"
.LC19:
	.string	" "
.LC20:
	.string	"\033[K"
.LC21:
	.string	"\r\n"
	.text
	.globl	editorDrawRows
	.type	editorDrawRows, @function
editorDrawRows:
.LFB32:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$144, %rsp
	movq	%rdi, -136(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, -116(%rbp)
	jmp	.L172
.L183:
	movl	12+E(%rip), %edx
	movl	-116(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, -100(%rbp)
	movl	28+E(%rip), %eax
	cmpl	%eax, -100(%rbp)
	jl	.L173
	movl	28+E(%rip), %eax
	testl	%eax, %eax
	jne	.L174
	movl	20+E(%rip), %eax
	movslq	%eax, %rdx
	imulq	$1431655766, %rdx, %rdx
	movq	%rdx, %rcx
	shrq	$32, %rcx
	cltd
	movl	%ecx, %eax
	subl	%edx, %eax
	cmpl	%eax, -116(%rbp)
	jne	.L174
	leaq	-96(%rbp), %rax
	leaq	.LC16(%rip), %rdx
	movq	%rdx, %rcx
	leaq	.LC17(%rip), %rdx
	movl	$80, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	snprintf@PLT
	movl	%eax, -112(%rbp)
	movl	24+E(%rip), %eax
	cmpl	%eax, -112(%rbp)
	jle	.L175
	movl	24+E(%rip), %eax
	movl	%eax, -112(%rbp)
.L175:
	movl	24+E(%rip), %eax
	subl	-112(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, -108(%rbp)
	cmpl	$0, -108(%rbp)
	je	.L177
	movq	-136(%rbp), %rax
	movl	$1, %edx
	leaq	.LC18(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	abAppend
	subl	$1, -108(%rbp)
	jmp	.L177
.L178:
	movq	-136(%rbp), %rax
	movl	$1, %edx
	leaq	.LC19(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	abAppend
.L177:
	movl	-108(%rbp), %eax
	leal	-1(%rax), %edx
	movl	%edx, -108(%rbp)
	testl	%eax, %eax
	jne	.L178
	movl	-112(%rbp), %edx
	leaq	-96(%rbp), %rcx
	movq	-136(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	abAppend
	jmp	.L180
.L174:
	movq	-136(%rbp), %rax
	movl	$1, %edx
	leaq	.LC18(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	abAppend
	jmp	.L180
.L173:
	movq	32+E(%rip), %rcx
	movl	-100(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	4(%rax), %edx
	movl	16+E(%rip), %eax
	subl	%eax, %edx
	movl	%edx, -104(%rbp)
	cmpl	$0, -104(%rbp)
	jns	.L181
	movl	$0, -104(%rbp)
.L181:
	movl	24+E(%rip), %eax
	cmpl	%eax, -104(%rbp)
	jle	.L182
	movl	24+E(%rip), %eax
	movl	%eax, -104(%rbp)
.L182:
	movq	32+E(%rip), %rcx
	movl	-100(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movq	16(%rax), %rdx
	movl	16+E(%rip), %eax
	cltq
	leaq	(%rdx,%rax), %rcx
	movl	-104(%rbp), %edx
	movq	-136(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	abAppend
.L180:
	movq	-136(%rbp), %rax
	movl	$3, %edx
	leaq	.LC20(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	abAppend
	movq	-136(%rbp), %rax
	movl	$2, %edx
	leaq	.LC21(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	abAppend
	addl	$1, -116(%rbp)
.L172:
	movl	20+E(%rip), %eax
	cmpl	%eax, -116(%rbp)
	jl	.L183
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L184
	call	__stack_chk_fail@PLT
.L184:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE32:
	.size	editorDrawRows, .-editorDrawRows
	.section	.rodata
.LC22:
	.string	"\033[7m"
.LC23:
	.string	"(modified)"
.LC24:
	.string	"[No Name]"
.LC25:
	.string	"%.20s - %d lines"
.LC26:
	.string	"%d/%d"
.LC27:
	.string	"\033[m"
	.text
	.globl	editorDrawStatusBar
	.type	editorDrawStatusBar, @function
editorDrawStatusBar:
.LFB33:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$208, %rsp
	movq	%rdi, -200(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	-200(%rbp), %rax
	movl	$4, %edx
	leaq	.LC22(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	abAppend
	movl	40+E(%rip), %eax
	testl	%eax, %eax
	je	.L186
	leaq	.LC23(%rip), %rdx
	jmp	.L187
.L186:
	leaq	.LC8(%rip), %rdx
.L187:
	movl	28+E(%rip), %ecx
	movq	48+E(%rip), %rax
	testq	%rax, %rax
	je	.L188
	movq	48+E(%rip), %rax
	jmp	.L189
.L188:
	leaq	.LC24(%rip), %rax
.L189:
	leaq	-176(%rbp), %rdi
	movq	%rdx, %r9
	movl	%ecx, %r8d
	movq	%rax, %rcx
	leaq	.LC25(%rip), %rax
	movq	%rax, %rdx
	movl	$80, %esi
	movl	$0, %eax
	call	snprintf@PLT
	movl	%eax, -184(%rbp)
	movl	28+E(%rip), %ecx
	movl	4+E(%rip), %eax
	leal	1(%rax), %edx
	leaq	-96(%rbp), %rax
	movl	%ecx, %r8d
	movl	%edx, %ecx
	leaq	.LC26(%rip), %rdx
	movl	$80, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	snprintf@PLT
	movl	%eax, -180(%rbp)
	movl	24+E(%rip), %eax
	cmpl	%eax, -184(%rbp)
	jle	.L190
	movl	24+E(%rip), %eax
	movl	%eax, -184(%rbp)
.L190:
	movl	-184(%rbp), %edx
	leaq	-176(%rbp), %rcx
	movq	-200(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	abAppend
	jmp	.L191
.L194:
	movl	24+E(%rip), %eax
	subl	-184(%rbp), %eax
	cmpl	%eax, -180(%rbp)
	jne	.L192
	movl	-180(%rbp), %edx
	leaq	-96(%rbp), %rcx
	movq	-200(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	abAppend
	jmp	.L193
.L192:
	movq	-200(%rbp), %rax
	movl	$1, %edx
	leaq	.LC19(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	abAppend
	addl	$1, -184(%rbp)
.L191:
	movl	24+E(%rip), %eax
	cmpl	%eax, -184(%rbp)
	jl	.L194
.L193:
	movq	-200(%rbp), %rax
	movl	$3, %edx
	leaq	.LC27(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	abAppend
	movq	-200(%rbp), %rax
	movl	$2, %edx
	leaq	.LC21(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	abAppend
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L195
	call	__stack_chk_fail@PLT
.L195:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE33:
	.size	editorDrawStatusBar, .-editorDrawStatusBar
	.globl	editorDrawMessageBar
	.type	editorDrawMessageBar, @function
editorDrawMessageBar:
.LFB34:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rax
	movl	$3, %edx
	leaq	.LC20(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	abAppend
	leaq	56+E(%rip), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movl	%eax, -4(%rbp)
	movl	24+E(%rip), %eax
	cmpl	%eax, -4(%rbp)
	jle	.L197
	movl	24+E(%rip), %eax
	movl	%eax, -4(%rbp)
.L197:
	cmpl	$0, -4(%rbp)
	je	.L199
	movl	$0, %edi
	call	time@PLT
	movq	%rax, %rdx
	movq	136+E(%rip), %rax
	subq	%rax, %rdx
	cmpq	$4, %rdx
	jg	.L199
	movl	-4(%rbp), %edx
	movq	-24(%rbp), %rax
	leaq	56+E(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	abAppend
.L199:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE34:
	.size	editorDrawMessageBar, .-editorDrawMessageBar
	.section	.rodata
.LC28:
	.string	"\033[?25l"
.LC29:
	.string	"\033[%d;%dH"
.LC30:
	.string	"\033[?25h"
	.text
	.globl	editorRefreshScreen
	.type	editorRefreshScreen, @function
editorRefreshScreen:
.LFB35:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	call	editorScroll
	movq	$0, -64(%rbp)
	movl	$0, -56(%rbp)
	leaq	-64(%rbp), %rax
	movl	$6, %edx
	leaq	.LC28(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	abAppend
	leaq	-64(%rbp), %rax
	movl	$3, %edx
	leaq	.LC1(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	abAppend
	leaq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	editorDrawRows
	leaq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	editorDrawStatusBar
	leaq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	editorDrawMessageBar
	movl	8+E(%rip), %edx
	movl	16+E(%rip), %eax
	subl	%eax, %edx
	leal	1(%rdx), %ecx
	movl	4+E(%rip), %edx
	movl	12+E(%rip), %eax
	subl	%eax, %edx
	addl	$1, %edx
	leaq	-48(%rbp), %rax
	movl	%ecx, %r8d
	movl	%edx, %ecx
	leaq	.LC29(%rip), %rdx
	movl	$32, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	snprintf@PLT
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movl	%eax, %edx
	leaq	-48(%rbp), %rcx
	leaq	-64(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	abAppend
	leaq	-64(%rbp), %rax
	movl	$6, %edx
	leaq	.LC30(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	abAppend
	movl	-56(%rbp), %eax
	movslq	%eax, %rdx
	movq	-64(%rbp), %rax
	movq	%rax, %rsi
	movl	$1, %edi
	call	write@PLT
	leaq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	abFree
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L201
	call	__stack_chk_fail@PLT
.L201:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE35:
	.size	editorRefreshScreen, .-editorRefreshScreen
	.globl	editorSetStatusMessage
	.type	editorSetStatusMessage, @function
editorSetStatusMessage:
.LFB36:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$224, %rsp
	movq	%rdi, -216(%rbp)
	movq	%rsi, -168(%rbp)
	movq	%rdx, -160(%rbp)
	movq	%rcx, -152(%rbp)
	movq	%r8, -144(%rbp)
	movq	%r9, -136(%rbp)
	testb	%al, %al
	je	.L203
	movaps	%xmm0, -128(%rbp)
	movaps	%xmm1, -112(%rbp)
	movaps	%xmm2, -96(%rbp)
	movaps	%xmm3, -80(%rbp)
	movaps	%xmm4, -64(%rbp)
	movaps	%xmm5, -48(%rbp)
	movaps	%xmm6, -32(%rbp)
	movaps	%xmm7, -16(%rbp)
.L203:
	movq	%fs:40, %rax
	movq	%rax, -184(%rbp)
	xorl	%eax, %eax
	movl	$8, -208(%rbp)
	movl	$48, -204(%rbp)
	leaq	16(%rbp), %rax
	movq	%rax, -200(%rbp)
	leaq	-176(%rbp), %rax
	movq	%rax, -192(%rbp)
	leaq	-208(%rbp), %rdx
	movq	-216(%rbp), %rax
	movq	%rdx, %rcx
	movq	%rax, %rdx
	movl	$80, %esi
	leaq	56+E(%rip), %rax
	movq	%rax, %rdi
	call	vsnprintf@PLT
	movl	$0, %edi
	call	time@PLT
	movq	%rax, 136+E(%rip)
	nop
	movq	-184(%rbp), %rax
	subq	%fs:40, %rax
	je	.L204
	call	__stack_chk_fail@PLT
.L204:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE36:
	.size	editorSetStatusMessage, .-editorSetStatusMessage
	.globl	editorPrompt
	.type	editorPrompt, @function
editorPrompt:
.LFB37:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	$128, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -16(%rbp)
	movq	$0, -8(%rbp)
	movq	-16(%rbp), %rax
	movb	$0, (%rax)
.L217:
	movq	-16(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	editorSetStatusMessage
	call	editorRefreshScreen
	call	editorReadKey
	movl	%eax, -28(%rbp)
	cmpl	$1004, -28(%rbp)
	je	.L206
	cmpl	$8, -28(%rbp)
	je	.L206
	cmpl	$127, -28(%rbp)
	jne	.L207
.L206:
	cmpq	$0, -8(%rbp)
	je	.L209
	subq	$1, -8(%rbp)
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
	jmp	.L209
.L207:
	cmpl	$27, -28(%rbp)
	jne	.L210
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	editorSetStatusMessage
	cmpq	$0, -48(%rbp)
	je	.L211
	movl	-28(%rbp), %edx
	movq	-16(%rbp), %rax
	movq	-48(%rbp), %rcx
	movl	%edx, %esi
	movq	%rax, %rdi
	call	*%rcx
.L211:
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movl	$0, %eax
	jmp	.L212
.L210:
	cmpl	$13, -28(%rbp)
	jne	.L213
	cmpq	$0, -8(%rbp)
	je	.L209
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	editorSetStatusMessage
	cmpq	$0, -48(%rbp)
	je	.L214
	movl	-28(%rbp), %edx
	movq	-16(%rbp), %rax
	movq	-48(%rbp), %rcx
	movl	%edx, %esi
	movq	%rax, %rdi
	call	*%rcx
.L214:
	movq	-16(%rbp), %rax
	jmp	.L212
.L213:
	call	__ctype_b_loc@PLT
	movq	(%rax), %rax
	movl	-28(%rbp), %edx
	movslq	%edx, %rdx
	addq	%rdx, %rdx
	addq	%rdx, %rax
	movzwl	(%rax), %eax
	movzwl	%ax, %eax
	andl	$2, %eax
	testl	%eax, %eax
	jne	.L209
	cmpl	$127, -28(%rbp)
	jg	.L209
	movq	-24(%rbp), %rax
	subq	$1, %rax
	cmpq	%rax, -8(%rbp)
	jne	.L215
	salq	-24(%rbp)
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	realloc@PLT
	movq	%rax, -16(%rbp)
.L215:
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movq	-16(%rbp), %rdx
	addq	%rdx, %rax
	movl	-28(%rbp), %edx
	movb	%dl, (%rax)
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
.L209:
	cmpq	$0, -48(%rbp)
	je	.L217
	movl	-28(%rbp), %edx
	movq	-16(%rbp), %rax
	movq	-48(%rbp), %rcx
	movl	%edx, %esi
	movq	%rax, %rdi
	call	*%rcx
	jmp	.L217
.L212:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE37:
	.size	editorPrompt, .-editorPrompt
	.globl	editorMoveCursor
	.type	editorMoveCursor, @function
editorMoveCursor:
.LFB38:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)
	movl	4+E(%rip), %edx
	movl	28+E(%rip), %eax
	cmpl	%eax, %edx
	jge	.L219
	movq	32+E(%rip), %rcx
	movl	4+E(%rip), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	jmp	.L220
.L219:
	movl	$0, %eax
.L220:
	movq	%rax, -8(%rbp)
	cmpl	$1003, -20(%rbp)
	je	.L221
	cmpl	$1003, -20(%rbp)
	jg	.L222
	cmpl	$1002, -20(%rbp)
	je	.L223
	cmpl	$1002, -20(%rbp)
	jg	.L222
	cmpl	$1000, -20(%rbp)
	je	.L224
	cmpl	$1001, -20(%rbp)
	je	.L225
	jmp	.L222
.L224:
	movl	E(%rip), %eax
	testl	%eax, %eax
	je	.L226
	movl	E(%rip), %eax
	subl	$1, %eax
	movl	%eax, E(%rip)
	jmp	.L237
.L226:
	movl	4+E(%rip), %eax
	testl	%eax, %eax
	jle	.L237
	movl	4+E(%rip), %eax
	subl	$1, %eax
	movl	%eax, 4+E(%rip)
	movq	32+E(%rip), %rcx
	movl	4+E(%rip), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	(%rax), %eax
	movl	%eax, E(%rip)
	jmp	.L237
.L225:
	cmpq	$0, -8(%rbp)
	je	.L228
	movl	E(%rip), %edx
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, %edx
	jge	.L228
	movl	E(%rip), %eax
	addl	$1, %eax
	movl	%eax, E(%rip)
	jmp	.L238
.L228:
	cmpq	$0, -8(%rbp)
	je	.L238
	movl	E(%rip), %edx
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, %edx
	jne	.L238
	movl	4+E(%rip), %eax
	addl	$1, %eax
	movl	%eax, 4+E(%rip)
	movl	$0, E(%rip)
	jmp	.L238
.L223:
	movl	4+E(%rip), %eax
	testl	%eax, %eax
	je	.L239
	movl	4+E(%rip), %eax
	subl	$1, %eax
	movl	%eax, 4+E(%rip)
	jmp	.L239
.L221:
	movl	4+E(%rip), %edx
	movl	28+E(%rip), %eax
	cmpl	%eax, %edx
	jge	.L240
	movl	4+E(%rip), %eax
	addl	$1, %eax
	movl	%eax, 4+E(%rip)
	jmp	.L240
.L237:
	nop
	jmp	.L222
.L238:
	nop
	jmp	.L222
.L239:
	nop
	jmp	.L222
.L240:
	nop
.L222:
	movl	4+E(%rip), %edx
	movl	28+E(%rip), %eax
	cmpl	%eax, %edx
	jge	.L232
	movq	32+E(%rip), %rcx
	movl	4+E(%rip), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	jmp	.L233
.L232:
	movl	$0, %eax
.L233:
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	je	.L234
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	jmp	.L235
.L234:
	movl	$0, %eax
.L235:
	movl	%eax, -12(%rbp)
	movl	E(%rip), %eax
	cmpl	%eax, -12(%rbp)
	jge	.L241
	movl	-12(%rbp), %eax
	movl	%eax, E(%rip)
.L241:
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE38:
	.size	editorMoveCursor, .-editorMoveCursor
	.section	.rodata
	.align 8
.LC31:
	.string	"WARNING! File has unsaved changes. Press Ctrl-Q %d more time(s) to quit."
	.text
	.globl	editorProcessKeypress
	.type	editorProcessKeypress, @function
editorProcessKeypress:
.LFB39:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	call	editorReadKey
	movl	%eax, -4(%rbp)
	cmpl	$1008, -4(%rbp)
	jg	.L243
	cmpl	$1000, -4(%rbp)
	jge	.L244
	cmpl	$27, -4(%rbp)
	jg	.L245
	cmpl	$6, -4(%rbp)
	jge	.L246
	jmp	.L243
.L244:
	movl	-4(%rbp), %eax
	subl	$1000, %eax
	cmpl	$8, %eax
	ja	.L243
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L248(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L248(%rip), %rdx
	addq	%rdx, %rax
	notrack jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L248:
	.long	.L252-.L248
	.long	.L252-.L248
	.long	.L252-.L248
	.long	.L252-.L248
	.long	.L251-.L248
	.long	.L250-.L248
	.long	.L249-.L248
	.long	.L247-.L248
	.long	.L247-.L248
	.text
.L246:
	movl	-4(%rbp), %eax
	subl	$6, %eax
	cmpl	$21, %eax
	ja	.L243
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L254(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L254(%rip), %rdx
	addq	%rdx, %rax
	notrack jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L254:
	.long	.L258-.L254
	.long	.L243-.L254
	.long	.L251-.L254
	.long	.L243-.L254
	.long	.L243-.L254
	.long	.L243-.L254
	.long	.L270-.L254
	.long	.L257-.L254
	.long	.L243-.L254
	.long	.L243-.L254
	.long	.L243-.L254
	.long	.L256-.L254
	.long	.L243-.L254
	.long	.L255-.L254
	.long	.L243-.L254
	.long	.L243-.L254
	.long	.L243-.L254
	.long	.L243-.L254
	.long	.L243-.L254
	.long	.L243-.L254
	.long	.L243-.L254
	.long	.L270-.L254
	.text
.L245:
	cmpl	$127, -4(%rbp)
	je	.L251
	jmp	.L243
.L257:
	call	editorInsertNewLine
	jmp	.L259
.L256:
	movl	40+E(%rip), %eax
	testl	%eax, %eax
	je	.L260
	movl	quit_times.0(%rip), %eax
	testl	%eax, %eax
	jle	.L260
	movl	quit_times.0(%rip), %eax
	movl	%eax, %esi
	leaq	.LC31(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	editorSetStatusMessage
	movl	quit_times.0(%rip), %eax
	subl	$1, %eax
	movl	%eax, quit_times.0(%rip)
	jmp	.L242
.L260:
	movl	$4, %edx
	leaq	.LC0(%rip), %rax
	movq	%rax, %rsi
	movl	$1, %edi
	call	write@PLT
	movl	$3, %edx
	leaq	.LC1(%rip), %rax
	movq	%rax, %rsi
	movl	$1, %edi
	call	write@PLT
	movl	$0, %edi
	call	exit@PLT
.L255:
	call	editorSave
	jmp	.L259
.L250:
	movl	$0, E(%rip)
	jmp	.L259
.L249:
	movl	4+E(%rip), %edx
	movl	28+E(%rip), %eax
	cmpl	%eax, %edx
	jge	.L271
	movq	32+E(%rip), %rcx
	movl	4+E(%rip), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	movl	(%rax), %eax
	movl	%eax, E(%rip)
	jmp	.L271
.L258:
	call	editorFind
	jmp	.L259
.L251:
	cmpl	$1004, -4(%rbp)
	jne	.L263
	movl	$1001, %edi
	call	editorMoveCursor
.L263:
	call	editorDelChar
	jmp	.L259
.L247:
	cmpl	$1007, -4(%rbp)
	jne	.L264
	movl	12+E(%rip), %eax
	movl	%eax, 4+E(%rip)
	jmp	.L265
.L264:
	cmpl	$1008, -4(%rbp)
	jne	.L265
	movl	12+E(%rip), %edx
	movl	20+E(%rip), %eax
	addl	%edx, %eax
	subl	$1, %eax
	movl	%eax, 4+E(%rip)
	movl	4+E(%rip), %edx
	movl	28+E(%rip), %eax
	cmpl	%eax, %edx
	jle	.L265
	movl	28+E(%rip), %eax
	movl	%eax, 4+E(%rip)
.L265:
	movl	20+E(%rip), %eax
	movl	%eax, -8(%rbp)
	jmp	.L266
.L269:
	cmpl	$1007, -4(%rbp)
	jne	.L267
	movl	$1002, %eax
	jmp	.L268
.L267:
	movl	$1003, %eax
.L268:
	movl	%eax, %edi
	call	editorMoveCursor
.L266:
	movl	-8(%rbp), %eax
	leal	-1(%rax), %edx
	movl	%edx, -8(%rbp)
	testl	%eax, %eax
	jne	.L269
	jmp	.L259
.L252:
	movl	-4(%rbp), %eax
	movl	%eax, %edi
	call	editorMoveCursor
	jmp	.L259
.L243:
	movl	-4(%rbp), %eax
	movl	%eax, %edi
	call	editorInsertChar
	jmp	.L259
.L270:
	nop
	jmp	.L259
.L271:
	nop
.L259:
	movl	$3, quit_times.0(%rip)
.L242:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE39:
	.size	editorProcessKeypress, .-editorProcessKeypress
	.section	.rodata
.LC32:
	.string	"getWindowSize"
	.text
	.globl	initEditor
	.type	initEditor, @function
initEditor:
.LFB40:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$0, E(%rip)
	movl	$0, 4+E(%rip)
	movl	$0, 8+E(%rip)
	movl	$0, 12+E(%rip)
	movl	$0, 16+E(%rip)
	movl	$0, 28+E(%rip)
	movq	$0, 32+E(%rip)
	movl	$0, 40+E(%rip)
	movq	$0, 48+E(%rip)
	movb	$0, 56+E(%rip)
	movq	$0, 136+E(%rip)
	leaq	24+E(%rip), %rax
	movq	%rax, %rsi
	leaq	20+E(%rip), %rax
	movq	%rax, %rdi
	call	getWindowSize
	cmpl	$-1, %eax
	jne	.L273
	leaq	.LC32(%rip), %rax
	movq	%rax, %rdi
	call	die
.L273:
	movl	20+E(%rip), %eax
	subl	$2, %eax
	movl	%eax, 20+E(%rip)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE40:
	.size	initEditor, .-initEditor
	.section	.rodata
	.align 8
.LC33:
	.string	"HELP: Ctrl-S = save | Ctrl-Q = quit | Ctrl-F = find"
	.text
	.globl	main
	.type	main, @function
main:
.LFB41:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movq	%rsi, -16(%rbp)
	call	enableRawMode
	call	initEditor
	cmpl	$1, -4(%rbp)
	jle	.L275
	movq	-16(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	editorOpen
.L275:
	leaq	.LC33(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	editorSetStatusMessage
.L276:
	call	editorRefreshScreen
	call	editorProcessKeypress
	nop
	jmp	.L276
	.cfi_endproc
.LFE41:
	.size	main, .-main
	.data
	.align 4
	.type	last_match.2, @object
	.size	last_match.2, 4
last_match.2:
	.long	-1
	.align 4
	.type	direction.1, @object
	.size	direction.1, 4
direction.1:
	.long	1
	.align 4
	.type	quit_times.0, @object
	.size	quit_times.0, 4
quit_times.0:
	.long	3
	.ident	"GCC: (Ubuntu 14.2.0-19ubuntu2) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
