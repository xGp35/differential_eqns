import numpy as np
import matplotlib.pyplot as plt
from scipy.integrate import solve_ivp

# Define the system of ODEs
def odesystem(t, y):
    # y[0] represents x(t), y[1] represents y(t)
    dxdt = 4 * y[0] - y[1] + 2 * t + 7
    dydt = 2 * y[0] + y[1] + t + 8
    return [dxdt, dydt]

# Initial conditions
t0 = 0  # Initial time
y0 = [1, 2]  # Initial values: x(0) = 1, y(0) = 2

# Time span for the solution
t_span = (0, 5)  # Solve from t = 0 to t = 5
t_eval = np.linspace(t_span[0], t_span[1], 100)  # Points where the solution is computed

# Solve the ODE system
solution = solve_ivp(odesystem, t_span, y0, t_eval=t_eval)

# Extract the solution
t = solution.t
x = solution.y[0]  # x(t)
y = solution.y[1]  # y(t)

# Plot the solutions
plt.figure(figsize=(10, 6))
plt.plot(t, x, 'r-', label='x(t)', linewidth=1.5)
plt.plot(t, y, 'b-', label='y(t)', linewidth=1.5)
plt.xlabel('Time t')
plt.ylabel('Solutions x(t) and y(t)')
plt.legend()
plt.title('Solution of the System of ODEs')
plt.grid()
plt.show()

# Display results
print("Time points:")
print(t)
print("Solutions [x(t), y(t)]:")
print(np.vstack((x, y)).T)
