	.file	"productos.c"
	.text
	.section .rdata,"dr"
.LC0:
	.ascii "r\0"
.LC1:
	.ascii "producto.txt\0"
.LC2:
	.ascii "%[^,],%[^,],%d,%f,%f\12\0"
.LC3:
	.ascii "ventas.txt\0"
.LC4:
	.ascii "%d,\0"
	.align 8
.LC5:
	.ascii "Ingrese codigo (o '0' para terminar): \0"
.LC6:
	.ascii "%s\0"
.LC7:
	.ascii "0\0"
.LC8:
	.ascii "Cantidad: \0"
.LC9:
	.ascii "%d\0"
	.align 8
.LC10:
	.ascii "Error en stock o producto no encontrado.\0"
.LC11:
	.ascii "Fecha (aaaa-mm-dd): \0"
.LC13:
	.ascii "\12--- FACTURA %d ---\12\0"
.LC14:
	.ascii "%s | Cant: %d | Total: %.2f\12\0"
.LC15:
	.ascii "TOTAL: %.2f\12\0"
.LC16:
	.ascii "Confirmar (1=Si, 0=No): \0"
.LC17:
	.ascii "w\0"
.LC18:
	.ascii "%s,%s,%d,%.2f,%.2f\12\0"
.LC19:
	.ascii "a\0"
.LC20:
	.ascii "%d,%s,%s,%d,%.2f,%.2f,%s\12\0"
	.text
	.globl	sistema_ventas
	.def	sistema_ventas;	.scl	2;	.type	32;	.endef
	.seh_proc	sistema_ventas
sistema_ventas:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rbx
	.seh_pushreg	%rbx
	movl	$4872, %eax
	call	___chkstk_ms
	subq	%rax, %rsp
	.seh_stackalloc	4872
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	leaq	.LC0(%rip), %rdx
	leaq	.LC1(%rip), %rax
	movq	%rax, %rcx
	call	fopen
	movq	%rax, 4688(%rbp)
	cmpq	$0, 4688(%rbp)
	je	.L29
	movl	$0, 4732(%rbp)
	jmp	.L4
.L5:
	addl	$1, 4732(%rbp)
.L4:
	movq	4688(%rbp), %rdx
	leaq	4432(%rbp), %rax
	movq	%rdx, %r8
	movl	$200, %edx
	movq	%rax, %rcx
	call	fgets
	testq	%rax, %rax
	jne	.L5
	movq	4688(%rbp), %rax
	movq	%rax, %rcx
	call	rewind
	movl	4732(%rbp), %eax
	cltq
	imulq	$84, %rax, %rax
	movq	%rax, %rcx
	call	malloc
	movq	%rax, 4680(%rbp)
	movl	$0, 4728(%rbp)
	jmp	.L6
.L7:
	movl	4728(%rbp), %eax
	cltq
	imulq	$84, %rax, %rdx
	movq	4680(%rbp), %rax
	addq	%rdx, %rax
	leaq	80(%rax), %r9
	movl	4728(%rbp), %eax
	cltq
	imulq	$84, %rax, %rdx
	movq	4680(%rbp), %rax
	addq	%rdx, %rax
	leaq	76(%rax), %r8
	movl	4728(%rbp), %eax
	cltq
	imulq	$84, %rax, %rdx
	movq	4680(%rbp), %rax
	addq	%rdx, %rax
	leaq	72(%rax), %rcx
	movl	4728(%rbp), %eax
	cltq
	imulq	$84, %rax, %rdx
	movq	4680(%rbp), %rax
	addq	%rdx, %rax
	leaq	20(%rax), %r10
	movl	4728(%rbp), %eax
	cltq
	imulq	$84, %rax, %rdx
	movq	4680(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, %r11
	leaq	.LC2(%rip), %rdx
	movq	4688(%rbp), %rax
	movq	%r9, 48(%rsp)
	movq	%r8, 40(%rsp)
	movq	%rcx, 32(%rsp)
	movq	%r10, %r9
	movq	%r11, %r8
	movq	%rax, %rcx
	call	fscanf
	addl	$1, 4728(%rbp)
.L6:
	movl	4728(%rbp), %eax
	cmpl	4732(%rbp), %eax
	jl	.L7
	movq	4688(%rbp), %rax
	movq	%rax, %rcx
	call	fclose
	leaq	.LC0(%rip), %rdx
	leaq	.LC3(%rip), %rax
	movq	%rax, %rcx
	call	fopen
	movq	%rax, 4672(%rbp)
	movl	$0, 4428(%rbp)
	cmpq	$0, 4672(%rbp)
	je	.L8
	jmp	.L9
.L10:
	leaq	4428(%rbp), %rcx
	leaq	.LC4(%rip), %rdx
	leaq	4432(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	sscanf
.L9:
	movq	4672(%rbp), %rdx
	leaq	4432(%rbp), %rax
	movq	%rdx, %r8
	movl	$200, %edx
	movq	%rax, %rcx
	call	fgets
	testq	%rax, %rax
	jne	.L10
	movq	4672(%rbp), %rax
	movq	%rax, %rcx
	call	fclose
.L8:
	movl	4428(%rbp), %eax
	addl	$1, %eax
	movl	%eax, 4428(%rbp)
	movl	$1, 4668(%rbp)
	movl	$0, 4724(%rbp)
	jmp	.L11
.L19:
	leaq	.LC5(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	4400(%rbp), %rax
	leaq	.LC6(%rip), %rcx
	movq	%rax, %rdx
	call	scanf
	leaq	.LC7(%rip), %rdx
	leaq	4400(%rbp), %rax
	movq	%rax, %rcx
	call	strcmp
	testl	%eax, %eax
	je	.L30
	leaq	.LC8(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	4396(%rbp), %rax
	leaq	.LC9(%rip), %rcx
	movq	%rax, %rdx
	call	scanf
	movl	$-1, 4720(%rbp)
	movl	$0, 4716(%rbp)
	jmp	.L14
.L17:
	movl	4716(%rbp), %eax
	cltq
	imulq	$84, %rax, %rdx
	movq	4680(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, %rcx
	leaq	4400(%rbp), %rax
	movq	%rax, %rdx
	call	strcmp
	testl	%eax, %eax
	jne	.L15
	movl	4716(%rbp), %eax
	movl	%eax, 4720(%rbp)
	jmp	.L16
.L15:
	addl	$1, 4716(%rbp)
.L14:
	movl	4716(%rbp), %eax
	cmpl	4732(%rbp), %eax
	jl	.L17
.L16:
	cmpl	$-1, 4720(%rbp)
	je	.L18
	movl	4720(%rbp), %eax
	cltq
	imulq	$84, %rax, %rdx
	movq	4680(%rbp), %rax
	addq	%rdx, %rax
	movl	72(%rax), %edx
	movl	4396(%rbp), %eax
	cmpl	%eax, %edx
	jl	.L18
	movl	4720(%rbp), %eax
	cltq
	imulq	$84, %rax, %rdx
	movq	4680(%rbp), %rax
	addq	%rax, %rdx
	movl	4724(%rbp), %eax
	cltq
	imulq	$84, %rax, %rax
	leaq	4736(%rax), %rax
	addq	%rbp, %rax
	subq	$4544, %rax
	movq	(%rdx), %rcx
	movq	8(%rdx), %rbx
	movq	%rcx, (%rax)
	movq	%rbx, 8(%rax)
	movq	16(%rdx), %rcx
	movq	24(%rdx), %rbx
	movq	%rcx, 16(%rax)
	movq	%rbx, 24(%rax)
	movq	32(%rdx), %rcx
	movq	40(%rdx), %rbx
	movq	%rcx, 32(%rax)
	movq	%rbx, 40(%rax)
	movq	48(%rdx), %rcx
	movq	56(%rdx), %rbx
	movq	%rcx, 48(%rax)
	movq	%rbx, 56(%rax)
	movq	64(%rdx), %rcx
	movq	72(%rdx), %rbx
	movq	%rcx, 64(%rax)
	movq	%rbx, 72(%rax)
	movl	80(%rdx), %edx
	movl	%edx, 80(%rax)
	movl	4396(%rbp), %edx
	movl	4724(%rbp), %eax
	cltq
	movl	%edx, -16(%rbp,%rax,4)
	movl	4720(%rbp), %eax
	cltq
	imulq	$84, %rax, %rdx
	movq	4680(%rbp), %rax
	addq	%rdx, %rax
	movl	72(%rax), %ecx
	movl	4396(%rbp), %eax
	movl	4720(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$84, %rdx, %r8
	movq	4680(%rbp), %rdx
	addq	%r8, %rdx
	subl	%eax, %ecx
	movl	%ecx, 72(%rdx)
	addl	$1, 4724(%rbp)
	jmp	.L11
.L18:
	leaq	.LC10(%rip), %rax
	movq	%rax, %rcx
	call	puts
.L11:
	cmpl	$1, 4668(%rbp)
	je	.L19
	jmp	.L13
.L30:
	nop
.L13:
	cmpl	$0, 4724(%rbp)
	jle	.L20
	leaq	.LC11(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	-31(%rbp), %rax
	leaq	.LC6(%rip), %rcx
	movq	%rax, %rdx
	call	scanf
	pxor	%xmm0, %xmm0
	movss	%xmm0, 4712(%rbp)
	movl	4428(%rbp), %eax
	leaq	.LC13(%rip), %rcx
	movl	%eax, %edx
	call	printf
	movl	$0, 4708(%rbp)
	jmp	.L21
.L22:
	movl	4708(%rbp), %eax
	cltq
	movl	-16(%rbp,%rax,4), %eax
	pxor	%xmm1, %xmm1
	cvtsi2ssl	%eax, %xmm1
	movl	4708(%rbp), %eax
	cltq
	imulq	$84, %rax, %rax
	leaq	4736(%rax), %rax
	addq	%rbp, %rax
	subq	$4464, %rax
	movss	(%rax), %xmm0
	mulss	%xmm1, %xmm0
	movss	%xmm0, 4644(%rbp)
	movss	4712(%rbp), %xmm0
	addss	4644(%rbp), %xmm0
	movss	%xmm0, 4712(%rbp)
	pxor	%xmm0, %xmm0
	cvtss2sd	4644(%rbp), %xmm0
	movl	4708(%rbp), %eax
	cltq
	movl	-16(%rbp,%rax,4), %ecx
	leaq	192(%rbp), %rax
	movl	4708(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$84, %rdx, %rdx
	addq	$16, %rdx
	addq	%rdx, %rax
	leaq	4(%rax), %rdx
	movapd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	movq	%xmm1, %r8
	leaq	.LC14(%rip), %rax
	movapd	%xmm0, %xmm3
	movq	%r8, %r9
	movl	%ecx, %r8d
	movq	%rax, %rcx
	call	printf
	addl	$1, 4708(%rbp)
.L21:
	movl	4708(%rbp), %eax
	cmpl	4724(%rbp), %eax
	jl	.L22
	pxor	%xmm0, %xmm0
	cvtss2sd	4712(%rbp), %xmm0
	movapd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	movq	%xmm1, %rdx
	leaq	.LC15(%rip), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %rcx
	call	printf
	leaq	.LC16(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	-36(%rbp), %rax
	leaq	.LC9(%rip), %rcx
	movq	%rax, %rdx
	call	scanf
	movl	-36(%rbp), %eax
	cmpl	$1, %eax
	jne	.L20
	leaq	.LC17(%rip), %rdx
	leaq	.LC1(%rip), %rax
	movq	%rax, %rcx
	call	fopen
	movq	%rax, 4656(%rbp)
	movl	$0, 4704(%rbp)
	jmp	.L24
.L25:
	movl	4704(%rbp), %eax
	cltq
	imulq	$84, %rax, %rdx
	movq	4680(%rbp), %rax
	addq	%rdx, %rax
	movss	80(%rax), %xmm0
	pxor	%xmm1, %xmm1
	cvtss2sd	%xmm0, %xmm1
	movl	4704(%rbp), %eax
	cltq
	imulq	$84, %rax, %rdx
	movq	4680(%rbp), %rax
	addq	%rdx, %rax
	movss	76(%rax), %xmm0
	cvtss2sd	%xmm0, %xmm0
	movl	4704(%rbp), %eax
	cltq
	imulq	$84, %rax, %rdx
	movq	4680(%rbp), %rax
	addq	%rdx, %rax
	movl	72(%rax), %ecx
	movl	4704(%rbp), %eax
	cltq
	imulq	$84, %rax, %rdx
	movq	4680(%rbp), %rax
	addq	%rdx, %rax
	leaq	20(%rax), %r8
	movl	4704(%rbp), %eax
	cltq
	imulq	$84, %rax, %rdx
	movq	4680(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, %r10
	leaq	.LC18(%rip), %rdx
	movq	4656(%rbp), %rax
	movsd	%xmm1, 48(%rsp)
	movsd	%xmm0, 40(%rsp)
	movl	%ecx, 32(%rsp)
	movq	%r8, %r9
	movq	%r10, %r8
	movq	%rax, %rcx
	call	fprintf
	addl	$1, 4704(%rbp)
.L24:
	movl	4704(%rbp), %eax
	cmpl	4732(%rbp), %eax
	jl	.L25
	movq	4656(%rbp), %rax
	movq	%rax, %rcx
	call	fclose
	leaq	.LC19(%rip), %rdx
	leaq	.LC3(%rip), %rax
	movq	%rax, %rcx
	call	fopen
	movq	%rax, 4648(%rbp)
	movl	$0, 4700(%rbp)
	jmp	.L26
.L27:
	movl	4700(%rbp), %eax
	cltq
	imulq	$84, %rax, %rax
	leaq	4736(%rax), %rax
	addq	%rbp, %rax
	subq	$4464, %rax
	movss	(%rax), %xmm0
	pxor	%xmm1, %xmm1
	cvtss2sd	%xmm0, %xmm1
	movl	4700(%rbp), %eax
	cltq
	imulq	$84, %rax, %rax
	leaq	4736(%rax), %rax
	addq	%rbp, %rax
	subq	$4468, %rax
	movss	(%rax), %xmm0
	cvtss2sd	%xmm0, %xmm0
	movl	4700(%rbp), %eax
	cltq
	movl	-16(%rbp,%rax,4), %ecx
	leaq	192(%rbp), %rax
	movl	4700(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$84, %rdx, %rdx
	addq	$16, %rdx
	addq	%rdx, %rax
	leaq	4(%rax), %r9
	leaq	192(%rbp), %rdx
	movl	4700(%rbp), %eax
	cltq
	imulq	$84, %rax, %rax
	leaq	(%rdx,%rax), %r11
	movl	4428(%rbp), %r10d
	leaq	.LC20(%rip), %rdx
	movq	4648(%rbp), %rax
	leaq	-31(%rbp), %r8
	movq	%r8, 64(%rsp)
	movsd	%xmm1, 56(%rsp)
	movsd	%xmm0, 48(%rsp)
	movl	%ecx, 40(%rsp)
	movq	%r9, 32(%rsp)
	movq	%r11, %r9
	movl	%r10d, %r8d
	movq	%rax, %rcx
	call	fprintf
	addl	$1, 4700(%rbp)
.L26:
	movl	4700(%rbp), %eax
	cmpl	4724(%rbp), %eax
	jl	.L27
	movq	4648(%rbp), %rax
	movq	%rax, %rcx
	call	fclose
.L20:
	movq	4680(%rbp), %rax
	movq	%rax, %rcx
	call	free
	jmp	.L1
.L29:
	nop
.L1:
	addq	$4872, %rsp
	popq	%rbx
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
	.def	sscanf;	.scl	2;	.type	32;	.endef
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	scanf;	.scl	2;	.type	32;	.endef
	.def	strcmp;	.scl	2;	.type	32;	.endef
	.def	puts;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	free;	.scl	2;	.type	32;	.endef
