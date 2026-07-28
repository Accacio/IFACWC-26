close all
vsp = vsivia_params

% vsp = doughnut_parameters
[S, E, N] = vsivia_lite(vsp);
draw_boxes(S,E,N,1,2)
xlim([-4,4])
ylim([-9,9])
set(gcf, 'PaperPosition', 1*[0 0 8 7])
set(gca,'FontSize',18)
set(gcf, 'PaperSize', 1*[8 7])
hx=get(gca,'xlabel');
hy=get(gca,'ylabel');
set(hx,'Interpreter', 'latex','FontSize',18);
set(hy,'Interpreter', 'latex','FontSize',18);

print(gcf, '-dpdf', ['vsivia_initial_example.pdf' ]);
rectangle('Position',[-2.75 -8.5 5.5 17],'LineWidth',5,'LineStyle','-','EdgeColor','g','FaceColor','none')
x2 = [-1    ; -2.75 ; -2.75 ;  -1;     1; 2.75;  2.75; 1];
y2 = [-8.5 ; -4 ; 4  ; 8.5; 8.5; 4; -4; -8.5];
vertices=[x2.';y2.'].'
faces=[1:8]
patch('Faces',faces,'Vertices',vertices,'FaceColor','none','EdgeColor','r','LineWidth',5)
print(gcf, '-dpdf', ['vsivia_initial_example_zonotope.pdf' ]);

