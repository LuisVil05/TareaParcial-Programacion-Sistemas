	.file	"usuarios.c"
	.text
	.section .rdata,"dr"
.LC0:
	.ascii "r\0"
.LC1:
	.ascii "vendedores.txt\0"
.LC2:
	.ascii "%[^,],%[^,],%[^\12]\12\0"
.LC3:
	.ascii "Usuario: \0"
.LC4:
	.ascii "%s\0"
.LC5:
	.ascii "Clave: \0"
	.align 8
.LC6:
	.ascii "Error. Intentos restantes: %d\12\0"
	.text
	.globl	login
	.def	login;	.scl	2;	.type	32;	.endef
	.seh_proc	login
login:
	pushq	%rbp
	.seh_pushreg	%rbp
	subq	$368, %rsp
	.seh_stackalloc	368
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	leaq	.LC0(%rip), %rdx
	leaq	.LC1(%rip), %rax
	movq	%rax, %rcx
	call	fopen
	movq	%rax, 208(%rbp)
	cmpq	$0, 208(%rbp)
	jne	.L2
	movl	$0, %eax
	jmp	.L15
.L2:
	movl	$0, 236(%rbp)
	jmp	.L4
.L5:
	addl	$1, 236(%rbp)
.L4:
	movq	208(%rbp), %rdx
	leaq	48(%rbp), %rax
	movq	%rdx, %r8
	movl	$150, %edx
	movq	%rax, %rcx
	call	fgets
	testq	%rax, %rax
	jne	.L5
	movq	208(%rbp), %rax
	movq	%rax, %rcx
	call	rewind
	movl	236(%rbp), %eax
	cltq
	imulq	$150, %rax, %rax
	movq	%rax, %rcx
	call	malloc
	movq	%rax, 200(%rbp)
	movl	$0, 232(%rbp)
	jmp	.L6
.L7:
	movl	232(%rbp), %eax
	cltq
	imulq	$150, %rax, %rdx
	movq	200(%rbp), %rax
	addq	%rdx, %rax
	leaq	100(%rax), %rcx
	movl	232(%rbp), %eax
	cltq
	imulq	$150, %rax, %rdx
	movq	200(%rbp), %rax
	addq	%rdx, %rax
	leaq	50(%rax), %r8
	movl	232(%rbp), %eax
	cltq
	imulq	$150, %rax, %rdx
	movq	200(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, %r10
	leaq	.LC2(%rip), %rdx
	movq	208(%rbp), %rax
	movq	%rcx, 32(%rsp)
	movq	%r8, %r9
	movq	%r10, %r8
	movq	%rax, %rcx
	call	fscanf
	addl	$1, 232(%rbp)
.L6:
	movl	232(%rbp), %eax
	cmpl	236(%rbp), %eax
	jl	.L7
	movq	208(%rbp), %rax
	movq	%rax, %rcx
	call	fclose
	movl	$0, 228(%rbp)
	movl	$0, 224(%rbp)
	jmp	.L8
.L14:
	leaq	.LC3(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	-16(%rbp), %rax
	leaq	.LC4(%rip), %rcx
	movq	%rax, %rdx
	call	scanf
	leaq	.LC5(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	-80(%rbp), %rax
	leaq	.LC4(%rip), %rcx
	movq	%rax, %rdx
	call	scanf
	movl	$0, 220(%rbp)
	jmp	.L9
.L12:
	movl	220(%rbp), %eax
	cltq
	imulq	$150, %rax, %rdx
	movq	200(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, %rdx
	leaq	-16(%rbp), %rax
	movq	%rax, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L10
	movl	220(%rbp), %eax
	cltq
	imulq	$150, %rax, %rdx
	movq	200(%rbp), %rax
	addq	%rdx, %rax
	leaq	50(%rax), %rdx
	leaq	-80(%rbp), %rax
	movq	%rax, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L10
	movl	$1, 224(%rbp)
	jmp	.L11
.L10:
	addl	$1, 220(%rbp)
.L9:
	movl	220(%rbp), %eax
	cmpl	236(%rbp), %eax
	jl	.L12
.L11:
	cmpl	$0, 224(%rbp)
	jne	.L8
	addl	$1, 228(%rbp)
	movl	$3, %eax
	subl	228(%rbp), %eax
	leaq	.LC6(%rip), %rcx
	movl	%eax, %edx
	call	printf
.L8:
	cmpl	$2, 228(%rbp)
	jg	.L13
	cmpl	$0, 224(%rbp)
	je	.L14
.L13:
	movq	200(%rbp), %rax
	movq	%rax, %rcx
	call	free
	movl	224(%rbp), %eax
.L15:
	addq	$368, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.ident	"GCC: (Rev13, Built by MSYS2 project) 15.2.0"
	.def	fopen;	.scl	2;	.type	32;	.endef
	.def	fgets;	.scl	2;	.type	32;	.endef
	.def	rewind;	.scl	2;	.type	32;	.endef
	.def	malloc;	.scl	2;	.type	32;	.endef
	.def	fscanf;	.scl	2;	.type	32;	.endef
	.def	fclose;	.scl	2;	.type	32;	.endef
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	scanf;	.scl	2;	.type	32;	.endef
	.def	strcmp;	.scl	2;	.type	32;	.endef
	.def	free;	.scl	2;	.type	32;	.endef
