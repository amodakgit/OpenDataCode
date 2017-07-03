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
