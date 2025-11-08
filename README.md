# B22-Capstone

Abstract:
Sex bias in preclinical research has historically favored male mice, based on the assumption that female physiology introduces greater variability due to hormonal cycles. This bias has led to the underrepresentation of females, potentially obscuring sex-specific drug responses and limiting the generalizability of findings. Evidence from multiple studies has challenged this assumption, suggesting that females may not be inherently more variable than males. In this study we examined the physiological variability between male and female mice by analyzing a continuous time series of temperature and activity recordings taking place over eight days at a one minute resolution. Using signal processing techniques including: variance analysis, Dynamic Time Warping (DTW), Continuous Wavelet Transformations(CWT), Empirical Mode Decomposition(EMD), and change point detection we quantified fluctuations in circadian and ultradian rhythms during the light and dark cycles of the mice. Contrary to prevailing assumptions, we found that female mice did not show consistently higher variability; in some measures, males exhibited greater variance at certain time scales.


Variance analysis - Combined DTW and CWT.ipynb: 
The distribution of per-mouse mean DTW distances for each light condition between male and female mice for core body temperature and activity metrics processed using CWT.


CWTexplore.ipynb: 
Demonstrates the average spectral power across all mice in each group when lights are on or off. Hotter regions mean higher activity rates.


DTW.ipynb: DTW distances between mice of the same sex to show variability within sex.
