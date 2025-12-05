# B22-Capstone: Mouse Physiological Variability Analysis

## Abstract

Sex bias in preclinical research has historically favored male mice, based on the assumption that female physiology introduces greater variability due to hormonal cycles. This bias has led to the underrepresentation of females, potentially obscuring sex-specific drug responses and limiting the generalizability of findings. Evidence from multiple studies has challenged this assumption, suggesting that females may not be inherently more variable than males.

In this study we examined the physiological variability between male and female mice by analyzing a continuous time series of temperature and activity recordings taking place over eight days at a one minute resolution. Using signal processing techniques including: variance analysis, Dynamic Time Warping (DTW), Continuous Wavelet Transformations (CWT), Empirical Mode Decomposition (EMD), and change point detection we quantified fluctuations in circadian and ultradian rhythms during the light and dark cycles of the mice. Contrary to prevailing assumptions, we found that female mice did not show consistently higher variability; in some measures, males exhibited greater variance at certain time scales.

## File Structure

```
B22-Capstone/
├── data/                          # Raw data files
│   ├── mice_data.xlsx            # Excel file with all data sheets
│   ├── mice data.xlsx - FemTemp.csv
│   ├── mice data.xlsx - FemAct.csv
│   ├── mice data.xlsx - MaleTemp.csv
│   └── mice data.xlsx - MaleAct.csv
├── notebooks/                     # Jupyter notebooks for analysis
│   ├── DTW.ipynb
│   ├── CWT.ipynb
│   ├── CWTexplore.ipynb
│   ├── ChangePoint.ipynb
│   ├── EMD.ipynb
│   ├── circular_cp.ipynb
│   └── variance_analysis.ipynb
├── Dockerfile                     # Docker configuration
├── .dockerignore
├── requirements.txt               # Python dependencies
└── README.md
```

## Prerequisites

- **Python 3.10+** (3.11 recommended)
- **Docker** (optional, for containerized environment)

## Setup Instructions

### Option 1: Local Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/Michaelvasandani/B22-Capstone.git
   cd B22-Capstone
   ```

2. **Create a virtual environment (recommended)**
   ```bash
   python3 -m venv venv
   source venv/bin/activate  # On Windows: venv\Scripts\activate
   ```

3. **Install dependencies**
   ```bash
   pip install -r requirements.txt
   ```

4. **Launch Jupyter Lab**
   ```bash
   jupyter lab
   ```
   Navigate to the `notebooks/` directory and open any notebook.

### Option 2: Docker Setup

1. **Build the Docker image**
   ```bash
   docker build -t b22-capstone .
   ```

2. **Run the container**
   ```bash
   docker run -p 8888:8888 -v $(pwd):/workspace b22-capstone
   ```

3. **Access Jupyter Lab**
   Open your browser and navigate to: `http://localhost:8888`

## Data Description

The dataset contains continuous physiological recordings from mice over 8 days at 1-minute resolution:

- **Temperature data**: Core body temperature (°C) for 14 female and 6 male mice
- **Activity data**: Movement/activity counts for the same mice
- **Sampling**: 11,520 timepoints per mouse (8 days × 1,440 minutes/day)
- **Light cycles**: Alternating 12-hour light/dark periods

### Data Files

- `mice_data.xlsx`: Combined Excel file with separate sheets for each metric/sex combination
- Individual CSV files extracted from Excel for convenience:
  - `mice data.xlsx - FemTemp.csv`: Female temperature data
  - `mice data.xlsx - MaleTemp.csv`: Male temperature data
  - `mice data.xlsx - FemAct.csv`: Female activity data
  - `mice data.xlsx - MaleAct.csv`: Male activity data

## Analysis Notebooks

Execute notebooks in any order based on your analysis interests. Each notebook is self-contained:

### 1. **DTW.ipynb** - Dynamic Time Warping
Computes DTW distances between consecutive days for each mouse to quantify day-to-day similarity in physiological rhythms. Demonstrates that female mice show more consistent daily patterns (lower DTW distances) compared to males.

**Key outputs:**
- Raw and corrected DTW distances for temperature and activity
- Visualization of within-individual variability

### 2. **CWT.ipynb** - Continuous Wavelet Transform
Performs wavelet analysis to decompose temperature and activity signals into time-frequency components, revealing circadian (~24h) and ultradian (<24h) rhythms.

**Key outputs:**
- Wavelet power spectrograms
- Circadian vs. ultradian power fractions over time

### 3. **CWTexplore.ipynb** - CWT Exploration
Demonstrates average spectral power across all mice in each group during light-on and light-off conditions.

**Key outputs:**
- Heatmaps showing rhythmic activity patterns by sex and light condition

### 4. **ChangePoint.ipynb** - Change Point Detection
Uses the PELT algorithm to identify abrupt changes in temperature signals, revealing synchronized transitions between light and dark cycles.

**Key outputs:**
- Change point locations across multiple days
- Aggregated change point distributions by sex

### 5. **EMD.ipynb** - Empirical Mode Decomposition
Decomposes signals into intrinsic mode functions (IMFs) at different timescales and measures variance contributions under light vs. dark conditions.

**Key outputs:**
- IMF variance by light condition and sex
- Identification of dominant timescales for each sex

### 6. **circular_cp.ipynb** - Circular Change Point Analysis
Advanced change point detection incorporating circular statistics for periodic signals.

### 7. **variance_analysis.ipynb** - Combined DTW and CWT Variance Analysis
Integrates DTW distances with CWT-processed signals to compare variability between sexes across different light conditions.

**Key outputs:**
- Distribution of per-mouse mean DTW distances
- Statistical comparisons between males and females

## Usage Guide

### Running Individual Notebooks

Each notebook can be run independently. Simply:

1. Open Jupyter Lab: `jupyter lab`
2. Navigate to `notebooks/` directory
3. Open desired notebook
4. Run cells sequentially (Shift+Enter) or use "Run All" from the menu

## Results Summary

Our analysis reveals:

- **Female mice do NOT exhibit higher variability** in temperature or activity compared to males
- **Males show greater variance** at certain timescales, particularly in raw DTW distances
- **Circadian rhythms** (~24h) are prominent in both sexes
- **Ultradian rhythms** (1-6h) vary differently between light and dark phases
- **Change point synchronization** differs between sexes during light-dark transitions

These findings challenge the traditional assumption of greater female variability in preclinical research.


