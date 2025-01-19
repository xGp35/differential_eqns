import numpy as np
import matplotlib.pyplot as plt
from scipy.integrate import solve_ivp

# Define parameters
c = 1.0  # wave speed
L = 10.0  # length of the domain
N = 100  # number of spatial points
x = np.linspace(0, L, N)  # spatial grid

# Initial conditions
def g(x): 
    return np.sin(np.pi * x / L)  # initial displacement

def v(x):
    return np.zeros_like(x)  # initial velocity

# Define the second order wave equation as a system of first-order ODEs
def wave_eq(t, u_and_v):
    u = u_and_v[:N]  # displacement
    v = u_and_v[N:]  # velocity
    du_dt = v
    dv_dt = c**2 * np.roll(u, -1) - 2 * u + np.roll(u, 1)  # finite difference approximation for second derivative
    dv_dt[0] = dv_dt[-1] = 0  # boundary conditions (no flux at boundaries)
    return np.concatenate([du_dt, dv_dt])

# Initial state: [initial displacement, initial velocity]
u0 = g(x)
v0 = v(x)
initial_conditions = np.concatenate([u0, v0])

# Time span for the solution
t_span = (0, 10)
t_eval = np.linspace(0, 10, 200)

# Solve the system
sol = solve_ivp(wave_eq, t_span, initial_conditions, t_eval=t_eval, method='RK45')

# Plot the solution at different time points
plt.figure(figsize=(10, 6))
for i, t in enumerate([0, 2, 4, 6, 8]):  # Plot at selected times
    plt.plot(x, sol.y[:N, t//2], label=f't = {t}')

plt.title('Solution of the Wave Equation Over Time')
plt.xlabel('x')
plt.ylabel('u(x,t)')
plt.legend()
plt.grid(True)
plt.show()
