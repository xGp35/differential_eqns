import numpy as np
import matplotlib.pyplot as plt
from scipy.integrate import solve_ivp

# Define the PDE as a system of ODEs based on the method of characteristics
def pde_system(t, u, x, y):
    z, p, q = u
    dzdx = p
    dzdy = q
    dpdx = (x * (y**2 + z) - (x**2 - y**2) * z) / (y**2 + z)
    dqdy = (y * (x**2 + z) - (x**2 - y**2) * z) / (x**2 + z)
    return [dzdx, dpdx, dqdy]

# Initial conditions (passing through x + y = 0, z = 1)
x_vals = np.linspace(-5, 5, 100)  # x range
y_vals = -x_vals  # y = -x
z_initial = 1     # z value along the line
initial_conditions = [z_initial, 0, 0]  # z = 1, p = 0, q = 0

# Solve the system for the line x + y = 0
sol = solve_ivp(pde_system, [0, 10], initial_conditions, args=(x_vals, y_vals), t_eval=np.linspace(0, 10, 100))

# Extract the solution (z values)
z_solution = sol.y[0]

# Plot the solution
plt.figure(figsize=(10, 6))
plt.contourf(x_vals, y_vals, z_solution.reshape(len(x_vals), -1), cmap="viridis")
plt.title("Integral Surface of the PDE")
plt.xlabel("x")
plt.ylabel("y")
plt.colorbar(label="z")
plt.grid(True)
plt.show()
