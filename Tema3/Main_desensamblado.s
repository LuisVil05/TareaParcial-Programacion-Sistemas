
Main.o:     file format pe-x86-64


Disassembly of section .text:

0000000000000000 <main>:
   0:	55                   	push   %rbp
   1:	48 89 e5             	mov    %rsp,%rbp
   4:	48 83 ec 20          	sub    $0x20,%rsp
   8:	e8 00 00 00 00       	call   d <main+0xd>
   d:	e8 00 00 00 00       	call   12 <main+0x12>
  12:	83 f8 01             	cmp    $0x1,%eax
  15:	75 05                	jne    1c <main+0x1c>
  17:	e8 00 00 00 00       	call   1c <main+0x1c>
  1c:	b8 00 00 00 00       	mov    $0x0,%eax
  21:	48 83 c4 20          	add    $0x20,%rsp
  25:	5d                   	pop    %rbp
  26:	c3                   	ret
  27:	90                   	nop
  28:	90                   	nop
  29:	90                   	nop
  2a:	90                   	nop
  2b:	90                   	nop
  2c:	90                   	nop
  2d:	90                   	nop
  2e:	90                   	nop
  2f:	90                   	nop
