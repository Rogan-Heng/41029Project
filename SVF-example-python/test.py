import ctypes
import sys

class SVF_ext(object) :
	lib = ctypes.cdll.LoadLibrary('')
	args = []

	#module initial
	def init(self, argv) :
		argn = len(argv)
		for i in range(argn) : 
			self.args.append(ctypes.c_char_p(bytes(argv[i], "utf-8")))

		self.lib=ctypes.cdll.LoadLibrary('./svfext/libsvfext.so')
		self.lib.init(argn, (ctypes.c_char_p*argn)(*self.args))

	
	# Build Program Assignment Graph (SVFIR)
	def buildSVFIR(self) : 
		self.lib.buildSVFIR()

	#Create Andersen's pointer analysis
	def createAndersenWaveDiff(self) : 
		self.lib.createAndersenWaveDiff()

	#Call Graph
	def getPTACallGraph(self) : 
		self.lib.getPTACallGraph()

	#ICFG
	def getICFG(self) : 
		self.lib.getICFG()

	#Value-Flow Graph (VFG)
	def getVFG(self) : 
		self.lib.getVFG()

	#Sparse value-flow graph (SVFG)
	def buildFullSVFG(self) : 
		self.lib.buildFullSVFG()

	#clean up memory
	def release(self) : 
		self.lib.release()
	
	

def main(argv):
	#equal to call process
	ext = SVF_ext()
	ext.init(argv)
	ext.buildSVFIR();
	ext.createAndersenWaveDiff();
	ext.getICFG();
	ext.getVFG();
	ext.buildFullSVFG();
	ext.release();
		
    
if __name__ == "__main__":
     main(sys.argv)






