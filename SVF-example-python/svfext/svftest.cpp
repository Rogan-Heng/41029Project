//===- svf-ex.cpp -- A driver example of SVF-------------------------------------//
//
//                     SVF: Static Value-Flow Analysis
//
// Copyright (C) <2013->  <Yulei Sui>
//

// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.

// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.

// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.
//
//===-----------------------------------------------------------------------===//

/*
 // A driver program of SVF including usages of SVF APIs
 //
 // Author: Yulei Sui,
 */


#include "SVF-FE/LLVMUtil.h"
#include "Graphs/SVFG.h"
#include "WPA/Andersen.h"
#include "SVF-FE/SVFIRBuilder.h"
#include "Util/Options.h"

using namespace llvm;
using namespace std;
using namespace SVF;

SVFModule* svfModule = nullptr;
SVFIR* pag = nullptr;
Andersen* ander = nullptr;
PTACallGraph* callgraph = nullptr;
ICFG* icfg = nullptr;
VFG* vfg = nullptr;
SVFG* svfg = nullptr;

extern "C" {

void init(int argc, char ** argv);
void buildSVFIR();
void createAndersenWaveDiff();
void getPTACallGraph();
void getICFG();
void getVFG();
void buildFullSVFG();
void release();

void process(int argc, char ** argv);

}

void init(int argc, char ** argv)
{
	int arg_num = 0;
    char **arg_value = new char*[argc];
    std::vector<std::string> moduleNameVec;
    SVFUtil::processArguments(argc, argv, arg_num, arg_value, moduleNameVec);
    cl::ParseCommandLineOptions(arg_num, arg_value,
                                "Whole Program Points-to Analysis\n");
    
    if (Options::WriteAnder == "ir_annotator")
    {
        LLVMModuleSet::getLLVMModuleSet()->preProcessBCs(moduleNameVec);
    }

	svfModule = LLVMModuleSet::getLLVMModuleSet()->buildSVFModule(moduleNameVec);
	svfModule->buildSymbolTableInfo();
}

void release()
{
    if(nullptr != vfg) delete vfg;
    if(nullptr != svfg) delete svfg;
	AndersenWaveDiff::releaseAndersenWaveDiff();
    SVFIR::releaseSVFIR();

    LLVMModuleSet::getLLVMModuleSet()->dumpModulesToFile(".svf.bc");
    SVF::LLVMModuleSet::releaseLLVMModuleSet();
}

void buildSVFIR()
{
	SVFIRBuilder builder;
    pag = builder.build(svfModule);
}

void createAndersenWaveDiff()
{
	if(nullptr == pag) buildSVFIR();
	ander = AndersenWaveDiff::createAndersenWaveDiff(pag);
}

void getPTACallGraph()
{
	callgraph = ander->getPTACallGraph();
}

void getICFG()
{
	if(nullptr == pag) buildSVFIR();
	icfg = pag->getICFG();
}

void getVFG()
{
	if(nullptr == callgraph)	getPTACallGraph();
	vfg = new VFG(callgraph);
}

void buildFullSVFG()
{
	if(nullptr == ander) createAndersenWaveDiff();
	SVFGBuilder svfBuilder;
    svfg = svfBuilder.buildFullSVFG(ander);
}


void process(int argc, char ** argv)
{   
    init(argc, argv);
	buildSVFIR();
	createAndersenWaveDiff();
	getPTACallGraph();
	getICFG();
	getVFG();
	buildFullSVFG();
	release();
}





