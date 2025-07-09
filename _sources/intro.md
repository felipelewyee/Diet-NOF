# DietGMTKN55-NOF

```{admonition} About
:class: tip
This website benchmarks the PNOF (Piris Natural Orbital Functional) using the DietGMTKN55, a streamlined version of the GMTKN55 designed for rapid evaluation of electronic structure methods.  The original GMTKN55 benchmark comprises 55 datasets with 1500 chemical systems (including reactions, conformational changes, etc.) and uses a numerical indicator to assess method accuracy.

The DietGMTKN55 benchmark approximates this accuracy using significantly fewer systems; particularly it provides four versions with 30, 50, 100, and 150 systems, respectively.  While all DietGMTKN55 versions aim to reproduce the full GMTKN55 benchmark value, using more systems is expected to improve accuracy.

Beyond numerical results, this website provides insights into the performance of various NOFs across chemically similar systems. This allows users to understand the current NOF's strengths and weaknesses, identify areas for improvement, and leverage its capabilities for challenging chemical problems.
```

```{admonition} How to use this page
:class: dropdown
The results can be explored using the bar at the left of the page.

- Results are divied in two parts: i) perfect pairing and ii) extended pairing.
- Each part presents the results of the 030, 050, 100 and 150 systems. (150 for extended pairing is still in process)
- Clicking on a test (030, 050, 100 and 150) display a bar plot that summarizes the absolute deviations for all the NOFs, and a submenu is shown to examine results for each specific functional: PNOF5, PNOF7s, PNOF7, GNOF, GNOFm.
- Placing the pointer over a bar of the plot displays a description of the chemical process involved on that set.
- Each set is formed by several systems with common characteristics. The involved molecules, stechiometry, energy and errors can be explored using the molecular visualizer below the bar plot.
```

```{admonition} Sets of GMTKN55
:class: tip
:class: dropdown
**W4-11**: Total atomisation energies

**G21EA**: Adiabatic electron affinities

**G21IP**: Adiabatic ionisation potentials

**DIPCS10**: Double-ionisation potentials of closed-shell systems

**PA26**: Adiabatic proton affinities (incl. of amino acids)

**SIE4x4**: Self-interaction-error related problems

**ALKBDE10**: Dissociation energies in group-1 and -2 diatomics

**YBDE18**: Bond-dissociation energies in ylides

**AL2X6**: Dimerisation energies of AlX3 compounds

**HEAVYSB11**: Dissociation energies in heavy-element compounds

**NBPRC**: Oligomerisations and H2 fragmentations of NH3/BH3 systems H2 activation reactions with PH3/BH3 systems

**ALK8**: Dissociation and other reactions of alkaline compounds

**RC21**: Fragmentations and rearrangements in radical cations

**G2RC**: Reaction energies of selected G2/97 systems

**BH76RC**: Reaction energies of the BH76 set

**FH51**: Reaction energies in various (in-)organic systems

**TAUT15**: Relative energies in tautomers

**DC13**: 13 difficult cases for DFT methods

**MB16-43**: Decomposition energies of artificial molecules

**DARC**: Reaction energies of Diels–Alder reactions

**RSE43**: Radical-stabilisation energies

**BSR36**: Bond-separation reactions of saturated hydrocarbons

**CDIE20**: Double-bond isomerisation energies in cyclic systems

**ISO34**: Isomerisation energies of small and medium-sized organic molecules

**ISOL24**: Isomerisation energies of large organic molecules

**C60ISO**: Relative energies between C60 isomers

**PArel**: Relative energies in protonated isomers

**BH76**: Barrier heights of hydrogen transfer, heavy atom transfer, nucleophilic substitution, unimolecular and association reactions

**BHPERI**: Barrier heights of pericyclic reactions

**BHDIV10**: Diverse reaction barrier heights

**INV24**: Inversion/racemisation barrier heights

**BHROT27**: Barrier heights for rotation around single bonds

**PX13**: Proton-exchange barriers in H2O, NH3, and HF clusters

**WCPT18**: Proton-transfer barriers in uncatalysed and water-catalysed reactions

**RG18**: Interaction energies in rare-gas complexes

**ADIM6**: Interaction energies of n-alkane dimers

**S22**: Binding energies of noncovalently bound dimers

**S66**: Binding energies of noncovalently bound dimers

**HEAVY28**: Noncovalent interaction energies between heavy element hydrides

**WATER27**: Binding energies in (H2O)n, H+(H2O)n and OH-(H2O)n

**CARBHB12**: Hydrogen-bonded complexes between carbene analogues and H2O, NH3, or HCl

**PNICO23**: Interaction energies in pnicogen-containing dimers

**HAL59**: Binding energies in halogenated dimers (incl. halogen bonds)

**AHB21**: Interaction energies in anion–neutral dimers

**CHB6**: Interaction energies in cation–neutral dimers

**IL16**: Interaction energies in anion–cation dimers

**IDISP**: Intramolecular dispersion interactions

**ICONF**: Relative energies in conformers of inorganic systems

**ACONF**: Relative energies of alkane conformers

**Amino20x4**: Relative energies in amino acid conformers

**PCONF21**: Relative energies in tri- and tetrapeptide conformers

**MCONF**: Relative energies in melatonin conformers

**SCONF**: Relative energies of sugar conformers

**UPU23**: Relative energies between RNA-backbone conformers

**BUT14DIOL**: Relative energies in butane-1,4-diol conformers
```

```{warning}
This page is under construction and the data contained is still subject to change. This warning will be removed in the future when the data becomes trustfull.
```

```{warning}
Current results correspond to the def2-TZVPD basis set, while the original set was reported using def2-QZVP basis set.
```