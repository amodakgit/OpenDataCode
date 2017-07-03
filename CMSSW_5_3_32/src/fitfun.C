###Created by###
###Atanu Modak###
#include <iostream>
#include "TMath.h"
#include "math.h"

 /*--------------------------------------------------------------------*/
 Double_t breitgausfun(Double_t *x, Double_t *par)
 /*--------------------------------------------------------------------*/


 {

 //Fit parameters:
 //par[0]=Width (scale) Breit-Wigner
 //par[1]=Most Probable (MP, location) Breit mean
 //par[2]=Total area (integral -inf to inf, normalization constant)
 //par[3]=Width (sigma) of convoluted Gaussian function
 //par[8] = bin width
 //In the Landau distribution (represented by the CERNLIB approximation),
 //the maximum is located at x=-0.22278298 with the location parameter=0.
 //This shift is corrected within this function, so that the actual
 //maximum is identical to the MP parameter.

 //Added cubic background


 // Numeric constants
 Double_t invsq2pi = 0.3989422804014; // (2 pi)^(-1/2)
 Double_t twoPi = 6.2831853071795;//2Pi

 // Control constants
 Double_t np = 100.0; // number of convolution steps
 Double_t sc = 4; // convolution extends to +-sc Gaussian sigma

 // Variables
 Double_t xx;
 Double_t fland;
 Double_t sum = 0.0;
 Double_t xlow,xupp;
 Double_t step;
 Double_t i;


 // Range of convolution integral
 xlow = x[0] - sc * par[3];
 xupp = x[0] + sc * par[3];

 step = (xupp-xlow) / np;

 // Convolution integral of Breit and Gaussian by sum
 for(i=1.0; i<=np/2; i++) {
 xx = xlow + (i-.5) * step;
 fland = TMath::BreitWigner(xx,par[1],par[0]);
 sum += fland * TMath::Gaus(x[0],xx,par[3]);

 xx = xupp - (i-.5) * step;
 fland = TMath::BreitWigner(xx,par[1],par[0]);
 sum += fland * TMath::Gaus(x[0],xx,par[3]);
 }

 xx = x[0]-par[1];

 return (par[2] * par[8] * step * sum * invsq2pi / par[3]+par[4]*(1+par[5]*xx+par[6]*xx*xx + par[7]*xx*xx*xx));
 }


Double_t evaluate(double m, double m0, double sigma, double alpha, int n);

Double_t myCrystalBall(Double_t x, double alpha, int n, double mean, double sigma){


 //double norm  = par[0];
 /*double alpha = par[0];
 double n     = par[1];
 double m0    = par[2];
 double sigma = par[3];
 */

 //changed to quadratic background - par[5]
 //added binwdith factor - par[8]
 // return norm*evaluate(x[0], m0, sigma, alpha, (int)n)+par[5]*x[0] + par[6];
  return evaluate(x, mean, sigma, alpha, (int)n);
}


Double_t evaluate(double m, double m0, double sigma, double alpha, int n) {
 // n = 5;
 Double_t t =0;
 if (fabs(sigma) > 0.00001)
   t = (m - m0)/sigma;
 if ( alpha < 0 ) t = -t;

 Double_t absAlpha = fabs((Double_t)alpha);
 if ( t >= -1.*absAlpha ) {
   return exp(-0.5*t*t);
 }
 else {
   Double_t a =0;
   if (absAlpha > 0.00001)
     a= TMath::Power(Float_t(n)/absAlpha,n)*exp(-0.5*absAlpha*absAlpha);
   Double_t b = 0;
   if (absAlpha > 0.00001)
     b = Float_t(n)/absAlpha - absAlpha;
   if (TMath::Power(b-t,n) > 0.00001)
     return a/TMath::Power(b - t, n);
   else return 0;
 }
}

//////////BW*CB
 /*--------------------------------------------------------------------*/
 Double_t breitcbfun(Double_t *x, Double_t *par)
 /*--------------------------------------------------------------------*/
 {

 //Fit parameters:
 //par[0]=Width (scale) Breit-Wigner
 //par[1]=Most Probable (MP, location) Breit mean
 //par[2]=Total area (integral -inf to inf, normalization constant)
 //par[3]=Width (sigma) of convoluted CB
 //par[8] = bin width
 ///par[9] = alpha of CB
 ////par[10] = n of CB

 //Added cubic background


 // Numeric constants
 Double_t invsq2pi = 0.3989422804014; // (2 pi)^(-1/2)
 Double_t twoPi = 6.2831853071795;//2Pi

 // Control constants
 Double_t np = 100.0; // number of convolution steps
 //Double_t sc = 4; // convolution extends to +-sc CB sigma
 Double_t sc = 8; // convolution extends to +-sc CB sigma

 // Variables
 Double_t xx;
 Double_t fland;
 Double_t sum = 0.0;
 Double_t xlow,xupp;
 Double_t step;
 Double_t i;


 // Range of convolution integral
 xlow = x[0] - sc * par[3];
 xupp = x[0] + sc * par[3];

 step = (xupp-xlow) / np;

 // Convolution integral of Breit and Gaussian by sum
 for(i=1.0; i<=np/2; i++) {
 xx = xlow + (i-.5) * step;
 fland = TMath::BreitWigner(xx,par[1],par[0]);
 //sum += fland * TMath::Gaus(x[0],xx,par[3]);
 sum += fland * myCrystalBall(x[0],par[9],par[10],xx,par[3]); //////alpha,n,mean,sigma

 xx = xupp - (i-.5) * step;
 fland = TMath::BreitWigner(xx,par[1],par[0]);
 sum += fland * myCrystalBall(x[0],par[9],par[10],xx,par[3]); //////alpha,n,mean,sigma
 }

 xx = x[0]-par[1];

 return (par[2] * par[8] * step * sum * invsq2pi / par[3]+par[4]*(1+par[5]*xx+par[6]*xx*xx + par[7]*xx*xx*xx));
 }



//////////BW*CB
 /*--------------------------------------------------------------------*/
 Double_t breitcbfunDrawbkgonly(Double_t *x, Double_t *par)
 /*--------------------------------------------------------------------*/
 {

 //Fit parameters:
 //par[0]=Width (scale) Breit-Wigner
 //par[1]=Most Probable (MP, location) Breit mean
 //par[2]=Total area (integral -inf to inf, normalization constant)
 //par[3]=Width (sigma) of convoluted CB
 //par[8] = bin width
 ///par[9] = alpha of CB
 ////par[10] = n of CB

 //Added cubic background


 // Numeric constants
 Double_t invsq2pi = 0.3989422804014; // (2 pi)^(-1/2)
 Double_t twoPi = 6.2831853071795;//2Pi

 // Control constants
 Double_t np = 100.0; // number of convolution steps
 //Double_t sc = 4; // convolution extends to +-sc CB sigma
 Double_t sc = 8; // convolution extends to +-sc CB sigma

 // Variables
 Double_t xx;
 Double_t fland;
 Double_t sum = 0.0;
 Double_t xlow,xupp;
 Double_t step;
 Double_t i;


 // Range of convolution integral
 xlow = x[0] - sc * par[3];
 xupp = x[0] + sc * par[3];

 step = (xupp-xlow) / np;

 // Convolution integral of Breit and Gaussian by sum
 for(i=1.0; i<=np/2; i++) {
 xx = xlow + (i-.5) * step;
 fland = TMath::BreitWigner(xx,par[1],par[0]);
 //sum += fland * TMath::Gaus(x[0],xx,par[3]);
 sum += fland * myCrystalBall(x[0],par[9],par[10],xx,par[3]); //////alpha,n,mean,sigma

 xx = xupp - (i-.5) * step;
 fland = TMath::BreitWigner(xx,par[1],par[0]);
 sum += fland * myCrystalBall(x[0],par[9],par[10],xx,par[3]); //////alpha,n,mean,sigma
 }

 xx = x[0]-par[1];

 return (par[4]*(1+par[5]*xx+par[6]*xx*xx + par[7]*xx*xx*xx));
 }
//////////////////////////////////////////////////////////////

Double_t CrystalBall(Double_t* x, Double_t* par){

 if (par[1] < 0 ) par[1] *= -1;
 if (par[4] < 0 ) par[4] *= -1;

 double norm  = par[0];
 double alpha = par[1];
 double n     = par[2];
 double m0    = par[3];
 double sigma = par[4];

 //changed to quadratic background - par[5]
 //added binwdith factor - par[8]
 // return norm*evaluate(x[0], m0, sigma, alpha, (int)n)+par[5]*x[0] + par[6];
 return norm*evaluate(x[0], m0, sigma, alpha, (int)n)+par[5]*x[0]*x[0]+par[6]*x[0]+par[7]+par[10]*(TMath::Gaus(x[0],par[8],par[9])); //.6666 to accomdate bin width
}
//

Double_t CrystalBallOnly(Double_t* x, Double_t* par){

  if (par[1] < 0 ) par[1] *= -1;
  if (par[4] < 0 ) par[4] *= -1;

 double norm  = par[0];
 double alpha = par[1];
 double n     = par[2];
 double m0    = par[3];
 double sigma = par[4];

 //changed to quadratic background - par[5]
 //added binwdith factor - par[8]
 // return norm*evaluate(x[0], m0, sigma, alpha, (int)n)+par[5]*x[0] + par[6];
 return norm*evaluate(x[0], m0, sigma, alpha, (int)n)+par[5]*x[0]*x[0] + par[6]*x[0]+par[7];
}

/////BKGPDF from CM
Double_t cmsbkgfunc(Double_t x,  Double_t alpha, Double_t beta, Double_t gamma, Double_t peak)  
{ 
  
  /*double alpha = par[0];
    double beta = par[1];
    double gamma = par[2];
  double peak = par[3];
  */

  // ENTER EXPRESSION IN TERMS OF VARIABLE ARGUMENTS HERE 
  Double_t erf = TMath::Erfc((alpha - x) * beta);
  //Double_t erf = RooMath::erfc((alpha - x) * beta);
  Double_t u = (x - peak)*gamma;
  
  if(u < -70) u = 1e20;
  else if( u>70 ) u = 0;
  else u = exp(-u);   //exponential decay
  
  
  return erf*u;
 } 




Double_t CrystalBallOnlycmsbkg(Double_t* x, Double_t* par){

  if (par[1] < 0 ) par[1] *= -1;
  if (par[4] < 0 ) par[4] *= -1;

 double norm  = par[0];
 double alpha = par[1];
 double n     = par[2];
 double m0    = par[3];
 double sigma = par[4];

 double alphabkg = par[5];
 double betabkg = par[6];
 double gammabkg = par[7];



 //changed to quadratic background - par[5]
 //added binwdith factor - par[8]
 // return norm*evaluate(x[0], m0, sigma, alpha, (int)n)+par[5]*x[0] + par[6];
 return norm*evaluate(x[0], m0, sigma, alpha, (int)n)+par[5]*x[0]*x[0] + cmsbkgfunc(x[0],alphabkg,betabkg,gammabkg,m0);
}


Double_t Lin(Double_t* x, Double_t* par){

  return (par[1]*x[0] + par[0]);
}

Double_t Quad(Double_t* x, Double_t* par){

  return (par[2]*x[0]*x[0]+par[1]*x[0]+par[0]);
}
//

Double_t cmsbkgpdf(Double_t* x,  Double_t* par)
{ 
  
  double alpha = par[0];
  double beta = par[1];
  double gamma = par[2];
  double peak = par[3];
  

  // ENTER EXPRESSION IN TERMS OF VARIABLE ARGUMENTS HERE 
  Double_t erf = TMath::Erfc((alpha - x[0]) * beta);
  //Double_t erf = RooMath::erfc((alpha - x) * beta);
  Double_t u = (x[0] - peak)*gamma;
  
  if(u < -70) u = 1e20;
  else if( u>70 ) u = 0;
  else u = exp(-u);   //exponential decay
  return erf*u;
 } 




 /*--------------------------------------------------------------------*/
Double_t breitcbcmsbkgfun(Double_t *x, Double_t *par)
 /*--------------------------------------------------------------------*/
 {

 //Fit parameters:
 //par[0]=Width (scale) Breit-Wigner
 //par[1]=Most Probable (MP, location) Breit mean
 //par[2]=Total area (integral -inf to inf, normalization constant)
 //par[3]=Width (sigma) of convoluted CB
 //par[8] = bin width
 ///par[9] = alpha of CB
 ////par[10] = n of CB

 //Added cubic background


   double alpha = par[4];
   double beta = par[5];
   double gamma = par[6];
   double peak = par[1];

 // Numeric constants
 Double_t invsq2pi = 0.3989422804014; // (2 pi)^(-1/2)
 Double_t twoPi = 6.2831853071795;//2Pi

 // Control constants
 Double_t np = 100.0; // number of convolution steps
 Double_t sc = 4; // convolution extends to +-sc CB sigma

 // Variables
 Double_t xx;
 Double_t fland;
 Double_t sum = 0.0;
 Double_t xlow,xupp;
 Double_t step;
 Double_t i;


 // Range of convolution integral
 xlow = x[0] - sc * par[3];
 xupp = x[0] + sc * par[3];

 step = (xupp-xlow) / np;

 // Convolution integral of Breit and Gaussian by sum
 for(i=1.0; i<=np/2; i++) {
 xx = xlow + (i-.5) * step;
 fland = TMath::BreitWigner(xx,par[1],par[0]);
 //sum += fland * TMath::Gaus(x[0],xx,par[3]);
 sum += fland * myCrystalBall(x[0],par[9],par[10],xx,par[3]); //////alpha,n,mean,sigma

 xx = xupp - (i-.5) * step;
 fland = TMath::BreitWigner(xx,par[1],par[0]);
 sum += fland * myCrystalBall(x[0],par[9],par[10],xx,par[3]); //////alpha,n,mean,sigma
 }

 xx = x[0]-par[1];

 //return (par[2] * par[8] * step * sum * invsq2pi / par[3]+par[4]*(1+par[5]*xx+par[6]*xx*xx + par[7]*xx*xx*xx));
 return (par[2] * par[8] * step * sum * invsq2pi) / par[3]+ cmsbkgfunc(xx,alpha,beta,gamma,peak) ;

 }




/*--------------------------------------------------------------------*/
Double_t breitcbcmsbkgPluslinearfun(Double_t *x, Double_t *par)
 /*--------------------------------------------------------------------*/
 {

 //Fit parameters:
 //par[0]=Width (scale) Breit-Wigner
 //par[1]=Most Probable (MP, location) Breit mean
 //par[2]=Total area (integral -inf to inf, normalization constant)
 //par[3]=Width (sigma) of convoluted CB
 //par[8] = bin width
 ///par[9] = alpha of CB
 ////par[10] = n of CB

 //Added cubic background


   double alpha = par[4];
   double beta = par[5];
   double gamma = par[6];
   double peak = par[1];
   
   /////parameters for linear function whihc increases towards high side
   double cons  = par[11];
   double slope = par[12];
   
 // Numeric constants
 Double_t invsq2pi = 0.3989422804014; // (2 pi)^(-1/2)
 Double_t twoPi = 6.2831853071795;//2Pi

 // Control constants
 Double_t np = 100.0; // number of convolution steps
 Double_t sc = 4; // convolution extends to +-sc CB sigma

 // Variables
 Double_t xx;
 Double_t fland;
 Double_t sum = 0.0;
 Double_t xlow,xupp;
 Double_t step;
 Double_t i;


 // Range of convolution integral
 xlow = x[0] - sc * par[3];
 xupp = x[0] + sc * par[3];

 step = (xupp-xlow) / np;

 // Convolution integral of Breit and Gaussian by sum
 for(i=1.0; i<=np/2; i++) {
 xx = xlow + (i-.5) * step;
 fland = TMath::BreitWigner(xx,par[1],par[0]);
 //sum += fland * TMath::Gaus(x[0],xx,par[3]);
 sum += fland * myCrystalBall(x[0],par[9],par[10],xx,par[3]); //////alpha,n,mean,sigma

 xx = xupp - (i-.5) * step;
 fland = TMath::BreitWigner(xx,par[1],par[0]);
 sum += fland * myCrystalBall(x[0],par[9],par[10],xx,par[3]); //////alpha,n,mean,sigma
 }

 xx = x[0]-par[1];

 //return (par[2] * par[8] * step * sum * invsq2pi / par[3]+par[4]*(1+par[5]*xx+par[6]*xx*xx + par[7]*xx*xx*xx));
 return (par[2] * par[8] * step * sum * invsq2pi) / par[3]+ cmsbkgfunc(xx,alpha,beta,gamma,peak)  + cons + slope*x[0];

 }


/////BKGPDF from CM
Double_t cmsbkgPluslinfunc(Double_t* x,  Double_t* par)  
{ 
  
  double alpha = par[0];
  double beta = par[1];
  double gamma = par[2];
  double peak = par[3];
  double cons = par[4];
  double slope = par[5];

  // ENTER EXPRESSION IN TERMS OF VARIABLE ARGUMENTS HERE 
  Double_t erf = TMath::Erfc((alpha - x[0]) * beta);
  //Double_t erf = RooMath::erfc((alpha - x) * beta);
  Double_t u = (x[0] - peak)*gamma;
  
  if(u < -70) u = 1e20;
  else if( u>70 ) u = 0;
  else u = exp(-u);   //exponential decay
  
  
  return (erf*u + cons + (x[0])*slope);
 } 
