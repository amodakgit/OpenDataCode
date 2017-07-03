ALL_COMMONRULES += src_PhysicsTools_PatExamples_test
src_PhysicsTools_PatExamples_test_parent := PhysicsTools/PatExamples
src_PhysicsTools_PatExamples_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_PhysicsTools_PatExamples_test,src/PhysicsTools/PatExamples/test,TEST))
