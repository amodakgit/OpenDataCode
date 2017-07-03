ifeq ($(strip $(Demo/DemoAnalyzer)),)
ALL_COMMONRULES += src_Demo_DemoAnalyzer_src
src_Demo_DemoAnalyzer_src_parent := Demo/DemoAnalyzer
src_Demo_DemoAnalyzer_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_Demo_DemoAnalyzer_src,src/Demo/DemoAnalyzer/src,LIBRARY))
DemoDemoAnalyzer := self/Demo/DemoAnalyzer
Demo/DemoAnalyzer := DemoDemoAnalyzer
DemoDemoAnalyzer_files := $(patsubst src/Demo/DemoAnalyzer/src/%,%,$(wildcard $(foreach dir,src/Demo/DemoAnalyzer/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
DemoDemoAnalyzer_BuildFile    := $(WORKINGDIR)/cache/bf/src/Demo/DemoAnalyzer/BuildFile
DemoDemoAnalyzer_LOC_USE := self  FWCore/Framework FWCore/PluginManager FWCore/ParameterSet DataFormats/TrackReco CommonTools/UtilAlgos PhysicsTools/UtilAlgos
DemoDemoAnalyzer_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,DemoDemoAnalyzer,DemoDemoAnalyzer,$(SCRAMSTORENAME_LIB),src/Demo/DemoAnalyzer/src))
DemoDemoAnalyzer_PACKAGE := self/src/Demo/DemoAnalyzer/src
ALL_PRODS += DemoDemoAnalyzer
DemoDemoAnalyzer_CLASS := LIBRARY
Demo/DemoAnalyzer_forbigobj+=DemoDemoAnalyzer
DemoDemoAnalyzer_INIT_FUNC        += $$(eval $$(call Library,DemoDemoAnalyzer,src/Demo/DemoAnalyzer/src,src_Demo_DemoAnalyzer_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
endif
ifeq ($(strip $(PhysicsToolsPatAlgos_plugins)),)
PhysicsToolsPatAlgos_plugins := self/src/PhysicsTools/PatAlgos/plugins
PLUGINS:=yes
PhysicsToolsPatAlgos_plugins_files := $(patsubst src/PhysicsTools/PatAlgos/plugins/%,%,$(foreach file,*.cc,$(eval xfile:=$(wildcard src/PhysicsTools/PatAlgos/plugins/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/PhysicsTools/PatAlgos/plugins/$(file). Please fix src/PhysicsTools/PatAlgos/plugins/BuildFile.))))
PhysicsToolsPatAlgos_plugins_BuildFile    := $(WORKINGDIR)/cache/bf/src/PhysicsTools/PatAlgos/plugins/BuildFile
PhysicsToolsPatAlgos_plugins_LOC_USE := self  PhysicsTools/PatAlgos FWCore/Framework FWCore/ParameterSet FWCore/MessageLogger FWCore/MessageService L1Trigger/GlobalTriggerAnalyzer HLTrigger/HLTcore DataFormats/PatCandidates DataFormats/BTauReco DataFormats/JetReco DataFormats/TrackReco DataFormats/Candidate DataFormats/HeavyIonEvent PhysicsTools/PatUtils CondFormats/JetMETObjects JetMETCorrections/Objects TrackingTools/TransientTrack SimDataFormats/Track SimDataFormats/Vertex SimGeneral/HepPDTRecord RecoMET/METAlgorithms RecoEgamma/EgammaTools TrackingTools/IPTools root
PhysicsToolsPatAlgos_plugins_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,PhysicsToolsPatAlgos_plugins,PhysicsToolsPatAlgos_plugins,$(SCRAMSTORENAME_LIB),src/PhysicsTools/PatAlgos/plugins))
PhysicsToolsPatAlgos_plugins_PACKAGE := self/src/PhysicsTools/PatAlgos/plugins
ALL_PRODS += PhysicsToolsPatAlgos_plugins
PhysicsTools/PatAlgos_forbigobj+=PhysicsToolsPatAlgos_plugins
PhysicsToolsPatAlgos_plugins_INIT_FUNC        += $$(eval $$(call Library,PhysicsToolsPatAlgos_plugins,src/PhysicsTools/PatAlgos/plugins,src_PhysicsTools_PatAlgos_plugins,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
PhysicsToolsPatAlgos_plugins_CLASS := LIBRARY
else
$(eval $(call MultipleWarningMsg,PhysicsToolsPatAlgos_plugins,src/PhysicsTools/PatAlgos/plugins))
endif
ALL_COMMONRULES += src_PhysicsTools_PatAlgos_plugins
src_PhysicsTools_PatAlgos_plugins_parent := PhysicsTools/PatAlgos
src_PhysicsTools_PatAlgos_plugins_INIT_FUNC += $$(eval $$(call CommonProductRules,src_PhysicsTools_PatAlgos_plugins,src/PhysicsTools/PatAlgos/plugins,PLUGINS))
ifeq ($(strip $(PhysicsTools/PatAlgos)),)
ALL_COMMONRULES += src_PhysicsTools_PatAlgos_src
src_PhysicsTools_PatAlgos_src_parent := PhysicsTools/PatAlgos
src_PhysicsTools_PatAlgos_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_PhysicsTools_PatAlgos_src,src/PhysicsTools/PatAlgos/src,LIBRARY))
PhysicsToolsPatAlgos := self/PhysicsTools/PatAlgos
PhysicsTools/PatAlgos := PhysicsToolsPatAlgos
PhysicsToolsPatAlgos_files := $(patsubst src/PhysicsTools/PatAlgos/src/%,%,$(wildcard $(foreach dir,src/PhysicsTools/PatAlgos/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PhysicsToolsPatAlgos_BuildFile    := $(WORKINGDIR)/cache/bf/src/PhysicsTools/PatAlgos/BuildFile
PhysicsToolsPatAlgos_LOC_USE := self  DataFormats/Candidate DataFormats/Common DataFormats/EgammaCandidates DataFormats/EgammaReco DataFormats/JetReco DataFormats/Math DataFormats/METReco DataFormats/MuonReco DataFormats/PatCandidates DataFormats/TauReco DataFormats/TrackReco DataFormats/VertexReco FWCore/Framework FWCore/ParameterSet FWCore/ServiceRegistry FWCore/Utilities PhysicsTools/PatUtils PhysicsTools/Utilities PhysicsTools/IsolationAlgos clhep
PhysicsToolsPatAlgos_EX_LIB   := PhysicsToolsPatAlgos
PhysicsToolsPatAlgos_EX_USE   := $(foreach d,$(PhysicsToolsPatAlgos_LOC_USE),$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
PhysicsToolsPatAlgos_PACKAGE := self/src/PhysicsTools/PatAlgos/src
ALL_PRODS += PhysicsToolsPatAlgos
PhysicsToolsPatAlgos_CLASS := LIBRARY
PhysicsTools/PatAlgos_forbigobj+=PhysicsToolsPatAlgos
PhysicsToolsPatAlgos_INIT_FUNC        += $$(eval $$(call Library,PhysicsToolsPatAlgos,src/PhysicsTools/PatAlgos/src,src_PhysicsTools_PatAlgos_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
endif
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
