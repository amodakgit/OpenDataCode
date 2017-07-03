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
