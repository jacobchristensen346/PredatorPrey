%% Predator-Prey System

%system of first order differentials, x(t) denotes the population
%of the prey species, y(t) denotes the population of predator species

%a,c,alpha,gamma,r -> all positive constants

clear;close all;
%solving numerically with ode45
tstart=0;tfinal=50;
global a; a=1.1; %growth rate of prey population
global alpha; alpha=.4; %predation rate on prey population
global c; c=.4; %death rate of predator population
global gamma; gamma=.1; %growth rate of predator population
global r; r=0; %modifies the prey equation -> logistic growth expression
u0=zeros(2,1); %create u0 columns
u0(1)=10; u0(2)=10; %set up initial conditions for x(0) and y(0);

options=odeset('RelTol',1e-8);

[t,u]=ode45(@rhsPPS,[tstart,tfinal],u0,options); %solve for values
x1=u(:,1);y1=u(:,2); %get values for x and y

%now plot x and y as functions of t
plot(t,x1)
xlabel('time')
ylabel('population')
title('Predator-Prey Populations Over Time')
hold on
plot(t,y1)
legend('prey population','predator population')