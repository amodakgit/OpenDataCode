ALL_SUBSYSTEMS+=OutreachExercise2011
subdirs_src_OutreachExercise2011 = src_OutreachExercise2011_DecaysToLeptons
ALL_PACKAGES += OutreachExercise2011/DecaysToLeptons
subdirs_src_OutreachExercise2011_DecaysToLeptons := src_OutreachExercise2011_DecaysToLeptons_python
ifeq ($(strip $(PyOutreachExercise2011DecaysToLeptons)),)
PyOutreachExercise2011DecaysToLeptons := self/src/OutreachExercise2011/DecaysToLeptons/python
src_OutreachExercise2011_DecaysToLeptons_python_parent := 
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/OutreachExercise2011/DecaysToLeptons/python)
PyOutreachExercise2011DecaysToLeptons_files := $(patsubst src/OutreachExercise2011/DecaysToLeptons/python/%,%,$(wildcard $(foreach dir,src/OutreachExercise2011/DecaysToLeptons/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PyOutreachExercise2011DecaysToLeptons_LOC_USE := self  
PyOutreachExercise2011DecaysToLeptons_PACKAGE := self/src/OutreachExercise2011/DecaysToLeptons/python
ALL_PRODS += PyOutreachExercise2011DecaysToLeptons
PyOutreachExercise2011DecaysToLeptons_INIT_FUNC        += $$(eval $$(call PythonProduct,PyOutreachExercise2011DecaysToLeptons,src/OutreachExercise2011/DecaysToLeptons/python,src_OutreachExercise2011_DecaysToLeptons_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyOutreachExercise2011DecaysToLeptons,src/OutreachExercise2011/DecaysToLeptons/python))
endif
ALL_COMMONRULES += src_OutreachExercise2011_DecaysToLeptons_python
src_OutreachExercise2011_DecaysToLeptons_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_OutreachExercise2011_DecaysToLeptons_python,src/OutreachExercise2011/DecaysToLeptons/python,PYTHON))
ALL_SUBSYSTEMS+=Demo
subdirs_src_Demo = src_Demo_DemoAnalyzer
ALL_PACKAGES += Demo/DemoAnalyzer
subdirs_src_Demo_DemoAnalyzer := src_Demo_DemoAnalyzer_python src_Demo_DemoAnalyzer_src src_Demo_DemoAnalyzer_test
ifeq ($(strip $(PyDemoDemoAnalyzer)),)
PyDemoDemoAnalyzer := self/src/Demo/DemoAnalyzer/python
src_Demo_DemoAnalyzer_python_parent := 
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/Demo/DemoAnalyzer/python)
PyDemoDemoAnalyzer_files := $(patsubst src/Demo/DemoAnalyzer/python/%,%,$(wildcard $(foreach dir,src/Demo/DemoAnalyzer/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PyDemoDemoAnalyzer_LOC_USE := self  
PyDemoDemoAnalyzer_PACKAGE := self/src/Demo/DemoAnalyzer/python
ALL_PRODS += PyDemoDemoAnalyzer
PyDemoDemoAnalyzer_INIT_FUNC        += $$(eval $$(call PythonProduct,PyDemoDemoAnalyzer,src/Demo/DemoAnalyzer/python,src_Demo_DemoAnalyzer_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyDemoDemoAnalyzer,src/Demo/DemoAnalyzer/python))
endif
ALL_COMMONRULES += src_Demo_DemoAnalyzer_python
src_Demo_DemoAnalyzer_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_Demo_DemoAnalyzer_python,src/Demo/DemoAnalyzer/python,PYTHON))
ALL_COMMONRULES += src_Demo_DemoAnalyzer_test
src_Demo_DemoAnalyzer_test_parent := Demo/DemoAnalyzer
src_Demo_DemoAnalyzer_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_Demo_DemoAnalyzer_test,src/Demo/DemoAnalyzer/test,TEST))
ALL_SUBSYSTEMS+=pattuples2011
subdirs_src_pattuples2011 = src_pattuples2011_START53_LV6A1 src_pattuples2011_FT_53_LV5_AN1
ALL_PACKAGES += pattuples2011/FT_53_LV5_AN1
subdirs_src_pattuples2011_FT_53_LV5_AN1 := 
ALL_SUBSYSTEMS+=PhysicsTools
subdirs_src_PhysicsTools = src_PhysicsTools_PatAlgos src_PhysicsTools_PatExamples
ALL_PACKAGES += PhysicsTools/PatAlgos
subdirs_src_PhysicsTools_PatAlgos := src_PhysicsTools_PatAlgos_doc src_PhysicsTools_PatAlgos_interface src_PhysicsTools_PatAlgos_plugins src_PhysicsTools_PatAlgos_python src_PhysicsTools_PatAlgos_scripts src_PhysicsTools_PatAlgos_src src_PhysicsTools_PatAlgos_test
ifeq ($(strip $(PyPhysicsToolsPatAlgos)),)
PyPhysicsToolsPatAlgos := self/src/PhysicsTools/PatAlgos/python
src_PhysicsTools_PatAlgos_python_parent := 
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/PhysicsTools/PatAlgos/python)
PyPhysicsToolsPatAlgos_files := $(patsubst src/PhysicsTools/PatAlgos/python/%,%,$(wildcard $(foreach dir,src/PhysicsTools/PatAlgos/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PyPhysicsToolsPatAlgos_LOC_USE := self  
PyPhysicsToolsPatAlgos_PACKAGE := self/src/PhysicsTools/PatAlgos/python
ALL_PRODS += PyPhysicsToolsPatAlgos
PyPhysicsToolsPatAlgos_INIT_FUNC        += $$(eval $$(call PythonProduct,PyPhysicsToolsPatAlgos,src/PhysicsTools/PatAlgos/python,src_PhysicsTools_PatAlgos_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyPhysicsToolsPatAlgos,src/PhysicsTools/PatAlgos/python))
endif
ALL_COMMONRULES += src_PhysicsTools_PatAlgos_python
src_PhysicsTools_PatAlgos_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_PhysicsTools_PatAlgos_python,src/PhysicsTools/PatAlgos/python,PYTHON))
src_PhysicsTools_PatAlgos_scripts_files := $(filter-out \#% %\#,$(notdir $(wildcard $(foreach dir,$(LOCALTOP)/src/PhysicsTools/PatAlgos/scripts,$(dir)/*))))
$(eval $(call Src2StoreCopy,src_PhysicsTools_PatAlgos_scripts,src/PhysicsTools/PatAlgos/scripts,$(SCRAMSTORENAME_BIN),*))
ifeq ($(strip $(runtestPhysicsToolsPatAlgos)),)
runtestPhysicsToolsPatAlgos_files := $(patsubst src/PhysicsTools/PatAlgos/test/%,%,$(foreach file,runtestPhysicsToolsPatAlgos.cpp,$(eval xfile:=$(wildcard src/PhysicsTools/PatAlgos/test/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/PhysicsTools/PatAlgos/test/$(file). Please fix src/PhysicsTools/PatAlgos/test/BuildFile.))))
runtestPhysicsToolsPatAlgos := self/src/PhysicsTools/PatAlgos/test
runtestPhysicsToolsPatAlgos_TEST_RUNNER_CMD :=  runtestPhysicsToolsPatAlgos  /bin/bash PhysicsTools/PatAlgos/test runtests.sh
runtestPhysicsToolsPatAlgos_BuildFile    := $(WORKINGDIR)/cache/bf/src/PhysicsTools/PatAlgos/test/BuildFile
runtestPhysicsToolsPatAlgos_LOC_USE := self  FWCore/Utilities
runtestPhysicsToolsPatAlgos_PACKAGE := self/src/PhysicsTools/PatAlgos/test
ALL_PRODS += runtestPhysicsToolsPatAlgos
runtestPhysicsToolsPatAlgos_INIT_FUNC        += $$(eval $$(call Binary,runtestPhysicsToolsPatAlgos,src/PhysicsTools/PatAlgos/test,src_PhysicsTools_PatAlgos_test,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_TEST),test,$(SCRAMSTORENAME_LOGS)))
runtestPhysicsToolsPatAlgos_CLASS := TEST
else
$(eval $(call MultipleWarningMsg,runtestPhysicsToolsPatAlgos,src/PhysicsTools/PatAlgos/test))
endif
ifeq ($(strip $(PhysicsToolsPatAlgos_testAnalyzers)),)
PhysicsToolsPatAlgos_testAnalyzers := self/src/PhysicsTools/PatAlgos/test
PhysicsToolsPatAlgos_testAnalyzers_files := $(patsubst src/PhysicsTools/PatAlgos/test/%,%,$(foreach file,private/*.cc,$(eval xfile:=$(wildcard src/PhysicsTools/PatAlgos/test/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/PhysicsTools/PatAlgos/test/$(file). Please fix src/PhysicsTools/PatAlgos/test/BuildFile.))))
PhysicsToolsPatAlgos_testAnalyzers_BuildFile    := $(WORKINGDIR)/cache/bf/src/PhysicsTools/PatAlgos/test/BuildFile
PhysicsToolsPatAlgos_testAnalyzers_LOC_USE := self  FWCore/Framework FWCore/ParameterSet DataFormats/BTauReco PhysicsTools/PatUtils DataFormats/PatCandidates PhysicsTools/UtilAlgos root
PhysicsToolsPatAlgos_testAnalyzers_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,PhysicsToolsPatAlgos_testAnalyzers,PhysicsToolsPatAlgos_testAnalyzers,$(SCRAMSTORENAME_LIB),src/PhysicsTools/PatAlgos/test))
PhysicsToolsPatAlgos_testAnalyzers_PACKAGE := self/src/PhysicsTools/PatAlgos/test
ALL_PRODS += PhysicsToolsPatAlgos_testAnalyzers
PhysicsToolsPatAlgos_testAnalyzers_INIT_FUNC        += $$(eval $$(call Library,PhysicsToolsPatAlgos_testAnalyzers,src/PhysicsTools/PatAlgos/test,src_PhysicsTools_PatAlgos_test,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
PhysicsToolsPatAlgos_testAnalyzers_CLASS := TEST_LIBRARY
else
$(eval $(call MultipleWarningMsg,PhysicsToolsPatAlgos_testAnalyzers,src/PhysicsTools/PatAlgos/test))
endif
ALL_COMMONRULES += src_PhysicsTools_PatAlgos_test
src_PhysicsTools_PatAlgos_test_parent := PhysicsTools/PatAlgos
src_PhysicsTools_PatAlgos_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_PhysicsTools_PatAlgos_test,src/PhysicsTools/PatAlgos/test,TEST))
ALL_PACKAGES += PhysicsTools/PatExamples
subdirs_src_PhysicsTools_PatExamples := src_PhysicsTools_PatExamples_bin src_PhysicsTools_PatExamples_plugins src_PhysicsTools_PatExamples_python src_PhysicsTools_PatExamples_src src_PhysicsTools_PatExamples_test
ifeq ($(strip $(PatMuonEDMAnalyzer)),)
PatMuonEDMAnalyzer_files := $(patsubst src/PhysicsTools/PatExamples/bin/%,%,$(foreach file,PatMuonEDMAnalyzer.cc,$(eval xfile:=$(wildcard src/PhysicsTools/PatExamples/bin/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/PhysicsTools/PatExamples/bin/$(file). Please fix src/PhysicsTools/PatExamples/bin/BuildFile.))))
PatMuonEDMAnalyzer := self/src/PhysicsTools/PatExamples/bin
PatMuonEDMAnalyzer_BuildFile    := $(WORKINGDIR)/cache/bf/src/PhysicsTools/PatExamples/bin/BuildFile
PatMuonEDMAnalyzer_LOC_USE := self  root boost rootcintex FWCore/FWLite DataFormats/FWLite FWCore/PythonParameterSet DataFormats/PatCandidates CommonTools/Utils PhysicsTools/FWLite PhysicsTools/Utilities PhysicsTools/PatUtils PhysicsTools/PatExamples PhysicsTools/SelectorUtils
PatMuonEDMAnalyzer_PACKAGE := self/src/PhysicsTools/PatExamples/bin
ALL_PRODS += PatMuonEDMAnalyzer
PatMuonEDMAnalyzer_INIT_FUNC        += $$(eval $$(call Binary,PatMuonEDMAnalyzer,src/PhysicsTools/PatExamples/bin,src_PhysicsTools_PatExamples_bin,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_BIN),bin,$(SCRAMSTORENAME_LOGS)))
PatMuonEDMAnalyzer_CLASS := BINARY
else
$(eval $(call MultipleWarningMsg,PatMuonEDMAnalyzer,src/PhysicsTools/PatExamples/bin))
endif
ifeq ($(strip $(PatCOCExercise)),)
PatCOCExercise_files := $(patsubst src/PhysicsTools/PatExamples/bin/%,%,$(foreach file,PatCOCExercise.cc,$(eval xfile:=$(wildcard src/PhysicsTools/PatExamples/bin/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/PhysicsTools/PatExamples/bin/$(file). Please fix src/PhysicsTools/PatExamples/bin/BuildFile.))))
PatCOCExercise := self/src/PhysicsTools/PatExamples/bin
PatCOCExercise_BuildFile    := $(WORKINGDIR)/cache/bf/src/PhysicsTools/PatExamples/bin/BuildFile
PatCOCExercise_LOC_USE := self  root boost rootcintex FWCore/FWLite DataFormats/FWLite FWCore/PythonParameterSet DataFormats/PatCandidates CommonTools/Utils PhysicsTools/FWLite PhysicsTools/Utilities PhysicsTools/PatUtils PhysicsTools/PatExamples PhysicsTools/SelectorUtils
PatCOCExercise_PACKAGE := self/src/PhysicsTools/PatExamples/bin
ALL_PRODS += PatCOCExercise
PatCOCExercise_INIT_FUNC        += $$(eval $$(call Binary,PatCOCExercise,src/PhysicsTools/PatExamples/bin,src_PhysicsTools_PatExamples_bin,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_BIN),bin,$(SCRAMSTORENAME_LOGS)))
PatCOCExercise_CLASS := BINARY
else
$(eval $(call MultipleWarningMsg,PatCOCExercise,src/PhysicsTools/PatExamples/bin))
endif
ifeq ($(strip $(PatMuonFWLiteAnalyzer)),)
PatMuonFWLiteAnalyzer_files := $(patsubst src/PhysicsTools/PatExamples/bin/%,%,$(foreach file,PatMuonFWLiteAnalyzer.cc,$(eval xfile:=$(wildcard src/PhysicsTools/PatExamples/bin/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/PhysicsTools/PatExamples/bin/$(file). Please fix src/PhysicsTools/PatExamples/bin/BuildFile.))))
PatMuonFWLiteAnalyzer := self/src/PhysicsTools/PatExamples/bin
PatMuonFWLiteAnalyzer_BuildFile    := $(WORKINGDIR)/cache/bf/src/PhysicsTools/PatExamples/bin/BuildFile
PatMuonFWLiteAnalyzer_LOC_USE := self  root boost rootcintex FWCore/FWLite DataFormats/FWLite FWCore/PythonParameterSet DataFormats/PatCandidates CommonTools/Utils PhysicsTools/FWLite PhysicsTools/Utilities PhysicsTools/PatUtils PhysicsTools/PatExamples PhysicsTools/SelectorUtils
PatMuonFWLiteAnalyzer_PACKAGE := self/src/PhysicsTools/PatExamples/bin
ALL_PRODS += PatMuonFWLiteAnalyzer
PatMuonFWLiteAnalyzer_INIT_FUNC        += $$(eval $$(call Binary,PatMuonFWLiteAnalyzer,src/PhysicsTools/PatExamples/bin,src_PhysicsTools_PatExamples_bin,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_BIN),bin,$(SCRAMSTORENAME_LOGS)))
PatMuonFWLiteAnalyzer_CLASS := BINARY
else
$(eval $(call MultipleWarningMsg,PatMuonFWLiteAnalyzer,src/PhysicsTools/PatExamples/bin))
endif
ALL_COMMONRULES += src_PhysicsTools_PatExamples_bin
src_PhysicsTools_PatExamples_bin_parent := PhysicsTools/PatExamples
src_PhysicsTools_PatExamples_bin_INIT_FUNC += $$(eval $$(call CommonProductRules,src_PhysicsTools_PatExamples_bin,src/PhysicsTools/PatExamples/bin,BINARY))
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
ALL_COMMONRULES += src_PhysicsTools_PatExamples_test
src_PhysicsTools_PatExamples_test_parent := PhysicsTools/PatExamples
src_PhysicsTools_PatExamples_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_PhysicsTools_PatExamples_test,src/PhysicsTools/PatExamples/test,TEST))
ALL_SUBSYSTEMS+=HEPTutorial
subdirs_src_HEPTutorial = src_HEPTutorial_files
ALL_PACKAGES += HEPTutorial/files
subdirs_src_HEPTutorial_files := 
ALL_PACKAGES += pattuples2011/START53_LV6A1
subdirs_src_pattuples2011_START53_LV6A1 := 
