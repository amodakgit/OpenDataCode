import FWCore.ParameterSet.Config as cms

process = cms.Process("Demo")

process.load("FWCore.MessageService.MessageLogger_cfi")

process.maxEvents = cms.untracked.PSet( input = cms.untracked.int32(-1) )

process.source = cms.Source("PoolSource",
    fileNames = cms.untracked.vstring(
#        'file:/afs/cern.ch/work/a/amodak/public/IISc/CMSSW_5_3_32/src/pattuples2011/SingleMuon_PAT_data_test.root'
        'file:/afs/cern.ch/work/a/amodak/public/IISc/CMSSW_5_3_32/src/pattuples2011/WJets_PAT_MC_jettest.root'
    )
)

process.demo = cms.EDAnalyzer('DemoAnalyzer',
                               MuonSrc = cms.InputTag("cleanPatMuons"),
                               ElectronSrc = cms.InputTag("cleanPatElectrons"),
                               JetSrc = cms.InputTag("cleanPatJets"),
                               TauSrc = cms.InputTag("cleanPatTaus"),
                               MetSrc = cms.InputTag("patMETs"),
                               VertexSrc = cms.InputTag("offlinePrimaryVertices"),
)

process.TFileService = cms.Service("TFileService", fileName = cms.string('analyzePat.root') )
process.p = cms.Path(process.demo)
