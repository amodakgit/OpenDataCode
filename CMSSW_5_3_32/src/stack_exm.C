
#include <TFile.h>
#include <TROOT.h>
#include <TPaveText.h>
#include <iostream>
#include <iomanip>
#include "TH1.h"

using namespace std;

void stack_exm() 
{  
   TFile* f[3];
   TH1F* g[3];
   TH1D* h[3];
   THStack* hs = new THStack ("hs", "MT Stack");
   TLegend* tl = new TLegend(0.7, 0.8, 0.9, 0.9);

   f[0] = TFile::Open("WJETSFILE");
   f[1] = TFile::Open("TTJETSFILE"); 
   f[2] = TFile::Open("DYJETSFILE");

   double cs[]={31314, 165, 3048}; //7 TeV XS in pb for WJets:TTjets:DYJets

   for (int i = 0; i < 3; ++i){
       g[i] = dynamic_cast<TH1F*>(f[i]->Get("HISTNAME"));
       h[i] = dynamic_cast<TH1D*>(f[i]->Get("EvtCounter"));
       g[i]->Rebin(10);
   }

   for (int j = 0; j < 3; ++j) {
     double sf = cs[j]*2100/h[j]->GetEntries();
     g[j]->Scale(sf);
   }

   g[0]->SetFillColor(3);
   hs->Add(g[0]);
   tl->AddEntry(g[0], "WJets", "f");

   g[1]->SetFillColor(7);
   hs->Add(g[1]);
   tl->AddEntry(g[1], "TTJets", "f");

   g[2]->SetFillColor(5);
   hs->Add(g[2]);
   tl->AddEntry(g[2], "DYJets", "f");

   g[3]->SetFillColor(44);
   hs->Add(g[3]);
   tl->AddEntry(g[3], "QCD", "f");


   // Now plot
   hs->SetMaximum(g[0]->GetMaximum()*1.4);

   TCanvas *can = new TCanvas ("can", "stacked hist", 10, 10, 900, 900);
   hs->Draw("HIST");
   tl->Draw();
   can->Modified();   
}
