; ModuleID = 'example.c'
source_filename = "example.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @swap(i8** %p, i8** %q) #0 !dbg !9 {
entry:
  %p.addr = alloca i8**, align 8
  %q.addr = alloca i8**, align 8
  %t = alloca i8*, align 8
  store i8** %p, i8*** %p.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %p.addr, metadata !15, metadata !DIExpression()), !dbg !16
  store i8** %q, i8*** %q.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %q.addr, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %t, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = load i8**, i8*** %p.addr, align 8, !dbg !21
  %1 = load i8*, i8** %0, align 8, !dbg !22
  store i8* %1, i8** %t, align 8, !dbg !20
  %2 = load i8**, i8*** %q.addr, align 8, !dbg !23
  %3 = load i8*, i8** %2, align 8, !dbg !24
  %4 = load i8**, i8*** %p.addr, align 8, !dbg !25
  store i8* %3, i8** %4, align 8, !dbg !26
  %5 = load i8*, i8** %t, align 8, !dbg !27
  %6 = load i8**, i8*** %q.addr, align 8, !dbg !28
  store i8* %5, i8** %6, align 8, !dbg !29
  ret void, !dbg !30
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !31 {
entry:
  %a1 = alloca i8, align 1
  %b1 = alloca i8, align 1
  %a = alloca i8*, align 8
  %b = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8* %a1, metadata !35, metadata !DIExpression()), !dbg !36
  call void @llvm.dbg.declare(metadata i8* %b1, metadata !37, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.declare(metadata i8** %a, metadata !39, metadata !DIExpression()), !dbg !40
  store i8* %a1, i8** %a, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata i8** %b, metadata !41, metadata !DIExpression()), !dbg !42
  store i8* %b1, i8** %b, align 8, !dbg !42
  call void @swap(i8** %a, i8** %b), !dbg !43
  ret i32 0, !dbg !44
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "example.c", directory: "/home/yang/prjs/SVF-example-master")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "swap", scope: !1, file: !1, line: 1, type: !10, scopeLine: 1, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DISubroutineType(types: !11)
!11 = !{null, !12, !12}
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!15 = !DILocalVariable(name: "p", arg: 1, scope: !9, file: !1, line: 1, type: !12)
!16 = !DILocation(line: 1, column: 18, scope: !9)
!17 = !DILocalVariable(name: "q", arg: 2, scope: !9, file: !1, line: 1, type: !12)
!18 = !DILocation(line: 1, column: 28, scope: !9)
!19 = !DILocalVariable(name: "t", scope: !9, file: !1, line: 2, type: !13)
!20 = !DILocation(line: 2, column: 9, scope: !9)
!21 = !DILocation(line: 2, column: 14, scope: !9)
!22 = !DILocation(line: 2, column: 13, scope: !9)
!23 = !DILocation(line: 3, column: 14, scope: !9)
!24 = !DILocation(line: 3, column: 13, scope: !9)
!25 = !DILocation(line: 3, column: 9, scope: !9)
!26 = !DILocation(line: 3, column: 11, scope: !9)
!27 = !DILocation(line: 4, column: 13, scope: !9)
!28 = !DILocation(line: 4, column: 9, scope: !9)
!29 = !DILocation(line: 4, column: 11, scope: !9)
!30 = !DILocation(line: 5, column: 1, scope: !9)
!31 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 6, type: !32, scopeLine: 6, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!32 = !DISubroutineType(types: !33)
!33 = !{!34}
!34 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!35 = !DILocalVariable(name: "a1", scope: !31, file: !1, line: 7, type: !14)
!36 = !DILocation(line: 7, column: 12, scope: !31)
!37 = !DILocalVariable(name: "b1", scope: !31, file: !1, line: 7, type: !14)
!38 = !DILocation(line: 7, column: 16, scope: !31)
!39 = !DILocalVariable(name: "a", scope: !31, file: !1, line: 8, type: !13)
!40 = !DILocation(line: 8, column: 13, scope: !31)
!41 = !DILocalVariable(name: "b", scope: !31, file: !1, line: 9, type: !13)
!42 = !DILocation(line: 9, column: 13, scope: !31)
!43 = !DILocation(line: 10, column: 7, scope: !31)
!44 = !DILocation(line: 11, column: 1, scope: !31)
