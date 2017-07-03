import FWCore.ParameterSet.Config as cms

PATJetProducer = cms.EDProducer('PATJetProducer',
  jetSource = cms.InputTag('no default'),
  embedCaloTowers = cms.bool(True),
  embedPFCandidates = cms.bool(True),
  addGenPartonMatch = cms.bool(True),
  embedGenPartonMatch = cms.bool(False),
  genPartonMatch = cms.InputTag(''),
  addGenJetMatch = cms.bool(True),
  embedGenJetMatch = cms.bool(False),
  genJetMatch = cms.InputTag(''),
  addJetCharge = cms.bool(True),
  jetChargeSource = cms.InputTag('patJetCharge'),
  addJetID = cms.bool(True),
  jetIDMap = cms.InputTag(''),
  addPartonJetMatch = cms.bool(False),
  partonJetSource = cms.InputTag('NOT IMPLEMENTED'),
  addAssociatedTracks = cms.bool(True),
  trackAssociationSource = cms.InputTag('ic5JetTracksAssociatorAtVertex'),
  addTagInfos = cms.bool(True),
  tagInfoSources = cms.VInputTag(),
  addJetCorrFactors = cms.bool(True),
  jetCorrFactorsSource = cms.VInputTag(),
  addBTagInfo = cms.bool(True),
  addDiscriminators = cms.bool(True),
  discriminatorSources = cms.VInputTag(),
  getJetMCFlavour = cms.bool(True),
  useLegacyJetMCFlavour = cms.bool(False),
  addJetFlavourInfo = cms.bool(False),
  JetPartonMapSource = cms.InputTag('jetFlavourAssociationLegacy'),
  JetFlavourInfoSource = cms.InputTag('jetFlavourAssociation'),
  addResolutions = cms.bool(False),
  resolutions = cms.PSet(),
  efficiencies = cms.PSet(),
  addEfficiencies = cms.bool(False),
  userData = cms.PSet(
    userClasses = cms.PSet(),
    userFloats = cms.PSet(),
    userInts = cms.PSet(),
    userCands = cms.PSet(),
    userFunctions = cms.vstring(),
    userFunctionLabels = cms.vstring()
  )
)
