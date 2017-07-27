#include "TChain.h"
//#include "UBTF_SelectorAnalysis.h"

void launchTselSignal5000p(){

TChain *f = new TChain("U102");

f->Add("/einstein2/stefania/padme/prod/prodUboson5000p_20170725_17_10_38/UBTF.root");
f->Add("/einstein2/stefania/padme/prod/prodUboson5000p_20170725_17_10_52/UBTF.root");
f->Add("/einstein2/stefania/padme/prod/prodUboson5000p_20170725_17_10_44/UBTF.root");
f->Add("/einstein2/stefania/padme/prod/prodUboson5000p_20170725_17_10_56/UBTF.root");
f->Add("/einstein2/stefania/padme/prod/prodUboson5000p_20170725_17_10_49/UBTF.root");

UBTF_SelectorAnalysis a;

f->Process(&a);

}
