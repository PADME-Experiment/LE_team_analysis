#
echo "Running launchUbosonSample.sh at `date`"
##### cards
mycard=prodFastDigiUboson10MeV_10000.mac
jobTime=`date +%Y%m%d_%H_%M_%S`
jobOutDir=/einstein2/stefania/padme/prod/prodUboson_$jobTime
echo "I start from here `pwd` - jobTime is " $jobTime
echo "Output will be collected in " $jobOutDir
echo "setting env .... "
export PADMEFWlocation=/afs/le.infn.it/user/s/spagnolo/padme/PADMEsw/simul/towardMCprod_June26_2017/padmeFRAMEWORK/
export ATLAS_LOCAL_ROOT_BASE=/cvmfs/atlas.cern.ch/repo/ATLASLocalRootBase
source ${ATLAS_LOCAL_ROOT_BASE}/user/atlasLocalSetup.sh
lsetup asetup
asetup 21.0.14,AtlasOffline #this maybe is needed only to compile G4 (cmake)
source  /afs/le.infn.it/project/padme/software/geant4.9.6.p04-install/share/Geant4-9.6.4/geant4make/geant4make.sh
lsetup root # root
echo "setting general env done !"
# set root
source $PADMEFWlocation/Configure/padme_init.sh
echo "setting padme specific env done !"
export PADMEMCbin=$PADMEFWlocation/PadmeMC/bin/Linux-g++
cp /afs/le.infn.it/user/s/spagnolo/padme/PADMEsw/simul/towardMCprod_June26_2017/prod/$mycard .
echo "Production cards available here ...  "
ls -al *mac
echo "================================"
cat $mycard
echo "================================"
echo "ready to run at `date`"
echo "////////////////////////////////////////////////////////////////"
$PADMEMCbin/PADMEMC ./$mycard
echo "////////////////////////////////////////////////////////////////"
echo "run finished at `date` .........."
echo " files produced are:  .........."
ls -al
echo "Creating directory " $jobOutDir
mkdir       $jobOutDir
ls $jobOutDir
cp -v *root $jobOutDir
cp -v *mac  $jobOutDir
echo "output files copied in " $jobOutDir
exit
