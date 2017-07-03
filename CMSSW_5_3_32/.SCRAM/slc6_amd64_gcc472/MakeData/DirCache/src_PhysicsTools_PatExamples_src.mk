ifeq ($(strip $(PhysicsTools/PatExamples)),)
ALL_COMMONRULES += src_PhysicsTools_PatExamples_src
src_PhysicsTools_PatExamples_src_parent := PhysicsTools/PatExamples
src_PhysicsTools_PatExamples_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_PhysicsTools_PatExamples_src,src/PhysicsTools/PatExamples/src,LIBRARY))
PhysicsToolsPatExamples := self/PhysicsTools/PatExamples
PhysicsTools/PatExamples := PhysicsToolsPatExamples
PhysicsToolsPatExamples_files := $(patsubst src/PhysicsTools/PatExamples/src/%,%,$(wildcard $(foreach dir,src/PhysicsTools/PatExamples/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PhysicsToolsPatExamples_BuildFile    := $(WORKINGDIR)/cache/bf/src/PhysicsTools/PatExamples/BuildFile
PhysicsToolsPatExamples_LOC_USE := self  DataFormats/Math DataFormats/Common DataFormats/JetReco DataFormats/MuonReco DataFormats/PatCandidates FWCore/Utilities FWCore/Framework FWCore/ParameterSet FWCore/ServiceRegistry PhysicsTools/PatUtils PhysicsTools/UtilAlgos PhysicsTools/Utilities clhep
PhysicsToolsPatExamples_EX_LIB   := PhysicsToolsPatExamples
PhysicsToolsPatExamples_EX_USE   := $(foreach d,$(PhysicsToolsPatExamples_LOC_USE),$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
PhysicsToolsPatExamples_PACKAGE := self/src/PhysicsTools/PatExamples/src
ALL_PRODS += PhysicsToolsPatExamples
PhysicsToolsPatExamples_CLASS := LIBRARY
PhysicsTools/PatExamples_forbigobj+=PhysicsToolsPatExamples
PhysicsToolsPatExamples_INIT_FUNC        += $$(eval $$(call Library,PhysicsToolsPatExamples,src/PhysicsTools/PatExamples/src,src_PhysicsTools_PatExamples_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
endif
