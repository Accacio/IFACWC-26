classdef vsivia_params < vsivia_parameters
    
    properties
        %%
        % We indicate the kind of problem: _inversion_.
        algorithm = 'inversion';
        %%
        % Then the initial box.
        U0 = 9*[-1 1 ; -1 1] ;
        %%
        % Then the interval image to be inverted.
        Y0 = [-64 64] ;
        %%
        % Then the accuracy parameter. We consider here an absolute epsilon of 0.5,
        % which means that boxes whose larger component is smaller than 0.5
        % will not be bisected.
        epsilon = 1e-1;
        constrained = false;
        maxtime = 60;
        nbisect = 1000;
    end % properties
    %%
    % At last, the function _f_ is defined.
    methods (Static)
        function z = compute(x, y)
            a=1
            b=3
            theta=0
            A=a^2*sin(theta)^2+b^2*cos(theta)^2
            B=2*(b^2-a^2)*sin(theta)*cos(theta)
            C=a^2*cos(theta)^2+b^2*sin(theta)^2
            D=0
            E=0
            F=-a^2*b^2
            z = A*x^2+B*x*y+C*y^2+D*x+E*y+F;
        end
    end
    
end
