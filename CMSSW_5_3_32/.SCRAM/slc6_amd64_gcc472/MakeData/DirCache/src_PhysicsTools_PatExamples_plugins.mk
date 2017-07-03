ifeq ($(strip $(PhysicsToolsPatExamples_plugins)),)
PhysicsToolsPatExamples_plugins := self/src/PhysicsTools/PatExamples/plugins
PLUGINS:=yes
PhysicsToolsPatExamples_plugins_files := $(patsubst src/PhysicsTools/PatExamples/plugins/%,%,$(foreach file,*.cc,$(eval xfile:=$(wildcard src/PhysicsTools/PatExamples/plugins/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/PhysicsTools/PatExamples/plugins/$(file). Please fix src/PhysicsTools/PatExamples/plugins/BuildFile.))))
PhysicsToolsPatExamples_plugins_BuildFile    := $(WORKINGDIR)/cache/bf/src/PhysicsTools/PatExamples/plugins/BuildFile
PhysicsToolsPatExamples_plugins_LOC_USE := self  FWCore/Framework FWCore/ParameterSet FWCore/MessageLogger FWCore/MessageService FWCore/ServiceRegistry FWCore/Utilities DataFormats/Common DataFormats/BeamSpot DataFormats/TrackReco DataFormats/VertexReco DataFormats/BTauReco DataFormats/PatCandidates HLTrigger/HLTcore PhysicsTools/PatExamples PhysicsTools/PatAlgos PhysicsTools/PatUtils PhysicsTools/CandUtils PhysicsTools/UtilAlgos root
PhysicsToolsPatExamples_plugins_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,PhysicsToolsPatExamples_plugins,PhysicsToolsPatExamples_plugins,$(SCRAMSTORENAME_LIB),src/PhysicsTools/PatExamples/plugins))
PhysicsToolsPatExamples_plugins_PACKAGE := self/src/PhysicsTools/PatExamples/plugins
ALL_PRODS += PhysicsToolsPatExamples_plugins
PhysicsTools/PatExamples_forbigobj+=PhysicsToolsPatExamples_plugins
PhysicsToolsPatExamples_plugins_INIT_FUNC        += $$(eval $$(call Library,PhysicsToolsPatExamples_plugins,src/PhysicsTools/PatExamples/plugins,src_PhysicsTools_PatExamples_plugins,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
PhysicsToolsPatExamples_plugins_CLASS := LIBRARY
else
$(eval $(call MultipleWarningMsg,PhysicsToolsPatExamples_plugins,src/PhysicsTools/PatExamples/plugins))
endif
ALL_COMMONRULES += src_PhysicsTools_PatExamples_plugins
src_PhysicsTools_PatExamples_plugins_parent := PhysicsTools/PatExamples
src_PhysicsTools_PatExamples_plugins_INIT_FUNC += $$(eval $$(call CommonProductRules,src_PhysicsTools_PatExamples_plugins,src/PhysicsTools/PatExamples/plugins,PLUGINS))
