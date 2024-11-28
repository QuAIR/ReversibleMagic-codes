# ReverisbleMagic-Codes Documentation

Source code for Figure 2 in the paper [Physical Implementability for Reversible Magic State Manipulation](https://arxiv.org/abs/2405.17356).

Magic states are essential for achieving universal quantum computations and they can be characterized in the framework of a resource theory. The present study introduces a definition of physical implementability and explores its consequences for specific operations of state manipulations, thereby helping to understand their cost.

Figure 2 shows the numerical experiments for the physical implementability of magic state transformations among states

```math
\begin{align*}
\ket{\mathbb{S}} &= (\ket{1} - \ket{2})/\sqrt{2} \\
\ket{\mathbb{N}} &= (-\ket{0} + 2\ket{1} - \ket{2})/\sqrt{6} \\
\ket{\mathbb{T}} &= (e^{2\pi i / 9}\ket{0} + \ket{1} + e^{-2\pi i / 9}\ket{2})/\sqrt{3} \\
\ket{\mathbb{H}} &\textrm{ is the eigenstate of } \operatorname{QFT}_3 \textrm{ w.r.t. eigenvalue} +\!1
\end{align*}
```

The main file is the MATLAB script `code/figure2data.m` that generates the plot data `data.mat` for Figure 2. In particular, the script runs SDPs to compute the physical implementability among six magic state transformations under different allowable transformation error. The derivation of the SDPs can be found in the Supplementary Note 3.

## How to run this MATLAB script?

We run this file using MATLAB 2023a or later on Windows 11. No specific hardware is required.

Additional Packages include [CVX 2.1](https://cvxr.com/cvx/) and [QETLAB 0.9](https://qetlab.com/) are additional required. We have included them in the `packages` folder (CVX package is for Windows only). We recommend to save the path of installed packages globally. The detailed installation instructions for these two packages are available on their respective websites.
