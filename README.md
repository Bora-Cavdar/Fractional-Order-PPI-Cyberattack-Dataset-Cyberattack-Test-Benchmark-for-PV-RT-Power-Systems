## Repository Contents

This repository contains the MATLAB/Simulink files, benchmark scripts, cyberattack scenarios, datasets, and deep learning baseline files developed for the study entitled:

**Cyberattack-Resilient Fractional-Order PPI Control for Frequency Regulation in PV-Integrated Power Systems**

The repository is organized into four main folders:

### 1. PV-RT LFC System Model

This folder contains the MATLAB `.m` files and Simulink `.slx` model files required to simulate the PV-integrated two-area load frequency control (LFC) system. The studied power system consists of a photovoltaic (PV) system in the first area and a reheat thermal power system in the second area.

The folder includes the nominal PV-RT system parameters, controller parameters, and time-domain simulation scripts used in the study. It is provided to present the fundamental system structure and to allow users to reproduce the baseline LFC simulations under the same system configuration.

In addition, the reference time-domain responses obtained using the proposed Fractional-Order Predictive PI (FOPPI) controller are provided. Researchers may use these results to compare the dynamic performance of their own controllers with the reported FOPPI results under the same PV-RT LFC system configuration.

### 2. Benchmark for Comparing Controllers in a PV-Integrated LFC System

This folder contains the cyberattack benchmark platform developed for testing and comparing different controller structures under identical PV-RT LFC cyberattack scenarios.

Researchers can replace the provided PID controller block in the Simulink model with their own controller structure and evaluate its performance under the same random varying load conditions, false data injection (FDI) attacks, and denial-of-service (DoS) attacks.

The benchmark scripts generate ITAE-based performance results and allow the tested controller to be compared with the proposed FOPPI controller and the classical PPI controller reported in the related study.

### 3. Dataset for Deep or Machine Learning Research in LFC Cyberattack Detection

This folder contains the cyberattack dataset generated from the FOPPI-controlled PV-RT LFC system. The dataset includes both normal and cyberattack scenarios and is intended for artificial intelligence-based studies, including normal/attack classification, FDI and DoS attack detection, and attack type classification.

The dataset includes time-domain responses of the LFC system under random varying load conditions and cyberattack scenarios. The recorded variables include scenario ID, load change, area frequency deviations, tie-line power deviation, simulation time, and class labels.

The dataset consists of normal scenarios and attacked scenarios generated under different FDI and DoS severities and attack locations. It is shared to support reproducible research and to enable fair comparison of different machine learning and deep learning-based cyberattack detection methods in LFC systems.

## Description

The files in this repository have been developed as part of the academic study described below. The code, simulation data, benchmark files, and deep learning scripts are shared to enable reproducibility of the proposed methods and to support further research by the academic community.

This repository is intended to serve two main purposes. First, it provides a reproducible benchmark environment for comparing different controller structures under the same PV-integrated LFC system and cyberattack scenarios. Second, it provides a labeled cyberattack dataset and a baseline 1D-CNN model for researchers working on artificial intelligence-based cyberattack detection in load frequency control systems.

If you make use of the materials in this repository, you may cite the related publication as follows:

**Citation:**   
🔹 APA   


🔹 BibTeX   


## Paper Information

**Title:**  
Cyberattack-Resilient Fractional-Order PPI Control for Frequency Regulation in PV-Integrated Power Systems

**Authors:**  
Bora Çavdar (boracavdar@ktu.edu.tr), Erdinç Şahin (erdinc.sahin@giresun.edu.tr), Fatih Mehmet Nuroğlu (fmn@ktu.edu.tr)

**DOI:**  


**Journal:**  
CAAI Transactions on Intelligence Technology (Wiley)

**Abstract:**  
Load-frequency control (LFC) comprises a primary process in interconnected electrical power systems, playing a critical role in maintaining the stability and reliability of the electrical grid. It is of paramount importance that the designed controller functions in an optimal manner, particularly with regard to the compression of area frequency and tie-line power deviations within the scheduled limits. In light of these considerations, this study puts forth the inaugural derivative-free and delay-based application of a predictive proportional-integral (PPI) and its fractional-order approach (FOPPI) controllers, to address the LFC challenge in a PV-integrated two-area power system. To attain the most effective controller parameters of the PPI and FOPPI, the artificial rabbits optimization (ARO) methodology is utilized by aiming to minimize the integral of the time-weighted absolute error (ITAE) performance measurement. The effectiveness of the proposed FOPPI controller is evaluated through a comparative analysis of existing controller structures in the literature and the classical PPI controller based on reported ITAE values in the literature. The proposed approach is validated through a series of detailed and systematic performance evaluations, such as time-domain analysis, uncertainty in system parameters, stochastic loading conditions, stability analysis, and cyber attack performance of the proposed controllers. Furthermore, a cyberattack detection index for the controllers is considered together with a statistical analysis, and the dataset and simulation models supporting the study are made available as described in the Data Availability Statement. As evidenced by the outcomes of the performance assessments, the FOPPI controller, as conceptualized in this investigation, displays an augmented capacity for dynamic response and resilience in the face of specified scenarios when contrasted with alternative methodologies, including the PPI controller.

## License and Citation

All materials in this repository may be used for academic and research purposes, provided that the related academic publication is properly cited.

Please cite the related paper if you use the MATLAB/Simulink models, benchmark scripts, cyberattack scenarios, or datasets files provided in this repository.
