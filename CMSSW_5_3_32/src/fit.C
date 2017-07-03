#include <string>
#include <TMath.h>
#include <iostream>
#include "TMath.h"
#include "TCanvas.h"
#include "TLegend.h"
#include "TF1.h"
#include "TH1F.h"
#include "TFile.h"
#include <fstream>
#include "TMath.h"
#include "string.h"
#include "fitfun.C"

using namespace TMath; 

//Double_t breitcbfun(Double_t *x, Double_t *par);

void fit(){


  bool debug = true;
  
  TFile *_file0 = TFile::Open("analyzePat.root");
  
  ROOT::Math::MinimizerOptions::SetDefaultMaxFunctionCalls(10000); 
  ROOT::Math::MinimizerOptions::SetDefaultTolerance(1); 
 
   ////passing probe
   TH1F *massZee = (TH1F*)_file0->Get("demo/ZM");
   massZee->SetMarkerStyle(20);
   
   TCanvas *c0 = new TCanvas("c0","--c0--",472,0,800,800);
   //////////////////////////////////////PASSING PROBES//////////////////////////////////
   
   //Creates a Root function based on function fitf above
   TF1 *f1 = new TF1("f1",CrystalBall,60,120,11);
   // Sets initial values and parameter names
   double DefPar0 = 102.7;   //normalization
   double DefPar1 = .93; //don't know "alpha"
   double DefPar2 = 50;  //don't know - number of steps?  "n"
   double DefPar3 = 90.7;  //mass/mean
   double DefPar4 = 2.3; //sigma for CB
   double DefPar5 = 0.; //quad bkg
   double DefPar6 = 0.;  //lin bkg
   ///data etabin 0,1
   //double DefPar7 = 1.2; //const bkg
   double DefPar7 = 200; //const bkg
   //double DefPar7 = 0.2; //const bkg

   double DefPar8 = 96.7; //gauss mean
   double DefPar9 = 2.3; //gauss width
   double DefPar10 = 73.0;//amplitude of gaussian
   
   f1->SetParameters(DefPar0,DefPar1,DefPar2,DefPar3,DefPar4,DefPar5,DefPar6, DefPar7, DefPar8, DefPar9, DefPar10);
   f1->SetParNames("norm","alpha","n", "m", "sigma","quad","lin","const", "gauss mean", "gauss width", "gauss amplitude");
   f1->SetParLimits(0,1,14000);  //normalization
   f1->SetParLimits(1,0,2);  //alpha
   f1->SetParLimits(2,1,200);  //number of steps
   f1->SetParLimits(3,82,100);  //mass
   // f1->SetParLimits(4,2,10);  //sigma for CB
   f1->SetParLimits(5,-10,10);  //quad bkg
   //f1->SetParLimits(6,-10,10);  //lin bkg
   f1->SetParLimits(6,-10,1000);  //lin bkg
   //f1->SetParLimits(7,-10,10);  //const bkg
   f1->SetParLimits(7,-10,2000);  //const bkg
   f1->SetParLimits(8,82,107);  //gauss mean
   // f1->SetParLimits(9,2,10);  //gauss width
   f1->SetParLimits(10,0,1000000);  //gauss amplitude
   
   //f1->FixParameter(6,0.);
   // Fit histogram in range defined by function
   
   /////////////////////////PASS PROBE/////////////////
   cout<<"=====================PASS PROBES================"<<endl;
   cout<<"doing PASS ee sample with quadratic background"<<endl;
   massZee->SetXTitle("Mass of ee (GeV)");
   
   char binw[100];
   sprintf(binw,"Events / %2.1f GeV/c^{2}", float(massZee->GetBinWidth(1)));
   
   massZee->SetYTitle(binw);
   massZee->GetYaxis()->SetTitleOffset(1.6);

   //massZee->SetYTitle("Entries/0.667 GeV");
   //f1->FixParameter(8, massZee->GetBinWidth(2));
   
   cout<<"bin width is: "<<massZee->GetBinWidth(2)<<endl;
   massZee->SetMarkerStyle(20);
   //massZee->Draw("pe1");
   
   f1->SetLineWidth(2);
   f1->SetLineColor(4);
   
   //massZee->Fit(f1,"ro");
   TFitResultPtr fitres  = massZee->Fit(f1,"ros");
   massZee->Draw("pe1");
   f1->Draw("same");

    //massZee->SetLineWidth(2);
   TMatrixDSym matrix = fitres->GetCorrelationMatrix();
   cout<<"=========Error matrix of PASSING PROBES============"<<endl;
   matrix.Print();

   // Float_t TotalIntegralErr = 0;
   TF1 *bkg = new TF1("bkg",Quad, 60, 120, 3);
//   bkg->SetParameter(2, f1->GetParameter(5));
   bkg->SetParameter(1, f1->GetParameter(6));
   bkg->SetParameter(0, f1->GetParameter(7));
   bkg->SetParameter(2, f1->GetParameter(5));
   bkg->SetLineStyle(7);
   bkg->SetLineWidth(2);
   bkg->SetLineColor(2);
   bkg->Draw("same");
   
   TLegend *leg_bkg = new TLegend(0.18,0.55,.38,0.65);
   leg_bkg->AddEntry(f1,"signal + background","l");
   leg_bkg->AddEntry(bkg,"background","l");
   leg_bkg->SetFillColor(0);
   leg_bkg->SetTextSize(0.025);
   leg_bkg->Draw("same");
   
   //////////////////////////////////SIGNAL ESTIMATION////////////////////////////
   cout<<"PARAMETERS IN BKG:"<<bkg->GetNpar()<<endl;;
   
    Float_t TotalIntegral = f1->Integral(60, 120);
   cout <<"TotalIntegral: "<<TotalIntegral<<endl;
   Float_t TotalIntegralErr = f1->IntegralError(60, 120);
   cout<<"TotalIntegralErr: "<<TotalIntegralErr<<endl;

    Float_t QuadBkgIntegral = bkg->Integral(60, 120);
   cout << "QuadBkgIntegral: " << QuadBkgIntegral << endl;
   Float_t QuadBkgIntegralErr = bkg->IntegralError(60, 120);
   cout << "QuadBkgIntegralErr: " << QuadBkgIntegralErr << endl;
   if (QuadBkgIntegral < 0) QuadBkgIntegral = 0;
   Float_t SignalIntegral = TotalIntegral - QuadBkgIntegral;
   Float_t NmassZee = SignalIntegral;
   Float_t SignalIntegralErr = sqrt(Power(TotalIntegralErr,2)+Power(QuadBkgIntegralErr,2));
   Float_t NmassZeeErr = SignalIntegralErr;
   cout<<"SignalIntegralErr: "<<SignalIntegralErr<<endl;
   cout << "SignalIntegral: " << SignalIntegral << endl;
   ////////////////////////////////END OF SIGNAL ESTIMATION///////////////////////////////////////////

//   double NmassLinZeg = (f1->GetParameter(2));
//   double NmassLinZegErr = (f1->GetParError(2));
}

