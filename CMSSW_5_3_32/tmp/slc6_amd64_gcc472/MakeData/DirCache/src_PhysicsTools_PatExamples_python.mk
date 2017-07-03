ifeq ($(strip $(PyPhysicsToolsPatExamples)),)
PyPhysicsToolsPatExamples := self/src/PhysicsTools/PatExamples/python
src_PhysicsTools_PatExamples_python_parent := 
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/PhysicsTools/PatExamples/python)
PyPhysicsToolsPatExamples_files := $(patsubst src/PhysicsTools/PatExamples/python/%,%,$(wildcard $(foreach dir,src/PhysicsTools/PatExamples/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PyPhysicsToolsPatExamples_LOC_USE := self  
PyPhysicsToolsPatExamples_PACKAGE := self/src/PhysicsTools/PatExamples/python
ALL_PRODS += PyPhysicsToolsPatExamples
PyPhysicsToolsPatExamples_INIT_FUNC        += $$(eval $$(call PythonProduct,PyPhysicsToolsPatExamples,src/PhysicsTools/PatExamples/python,src_PhysicsTools_PatExamples_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyPhysicsToolsPatExamples,src/PhysicsTools/PatExamples/python))
endif
ALL_COMMONRULES += src_PhysicsTools_PatExamples_python
src_PhysicsTools_PatExamples_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_PhysicsTools_PatExamples_python,src/PhysicsTools/PatExamples/python,PYTHON))
