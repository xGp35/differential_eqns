import numpy as np
import matplotlib.pyplot as plt

# Parameters
l = 10.0          # Length of the string
T = 5.0           # Total time
Nx = 100          # Number of spatial points
Nt = 200          # Number of time steps
dx = l / (Nx - 1) # Spatial step size
dt = T / Nt       # Time step size
c = 1.0           # Wave speed (assumed)

# Discretized spatial and time grids
x = np.linspace(0, l, Nx)
t = np.linspace(0, T, Nt)

# Initial conditions
g = lambda x: np.sin(np.pi * x / l)  # Initial displacement
v = lambda x: 0.0                    # Initial velocity

# Initialize the solution array u(x,t)
u = np.zeros((Nx, Nt))

# Apply initial conditions at t = 0
u[:, 0] = g(x)        # Initial displacement
u[:, 1] = u[:, 0] + v(x) * dt  # Initial velocity condition

# Time-stepping loop (Finite Difference Method)
for n in range(1, Nt - 1):
    for i in range(1, Nx - 1):
        u[i, n + 1] = 2 * (1 - (c * dt / dx)**2) * u[i, n] - u[i, n - 1] + (c * dt / dx)**2 * (u[i + 1, n] + u[i - 1, n])

# Plot the solution at different times
plt.figure(figsize=(10, 6))

# Choose some time steps to plot
times_to_plot = [0, int(Nt / 4), int(Nt / 2), int(3 * Nt / 4), Nt - 1]
for n in times_to_plot:
    plt.plot(x, u[:, n], label=f't = {t[n]:.2f}s')

plt.title('Wave Equation Solution')
plt.xlabel('Position (x)')
plt.ylabel('Displacement (u)')
plt.legend()
plt.grid(True)
plt.show()
