// This GUI file is generated by guibuilder version 4.2.1
//////////
f=figure('figure_position',[332,50],'figure_size',[985,480],'auto_resize','on','background',[33],'figure_name','Graphic window number %d','dockable','off','infobar_visible','off','toolbar_visible','off','menubar_visible','off','default_axes','on','visible','off');
//////////
handles.dummy = 0;
handles.Input=uicontrol(f,'unit','normalized','BackgroundColor',[-1,-1,-1],'Enable','on','FontAngle','normal','FontName','Ubuntu','FontSize',[12],'FontUnits','points','FontWeight','normal','ForegroundColor',[-1,-1,-1],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'Position',[0.021875,0.92,0.1815625,0.0466667],'Relief','default','SliderStep',[0.01,0.1],'String','Upload Image','Style','pushbutton','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','Input','Callback','Input_callback(handles)')
handles.Save=uicontrol(f,'unit','normalized','BackgroundColor',[-1,-1,-1],'Enable','on','FontAngle','normal','FontName','Ubuntu','FontSize',[12],'FontUnits','points','FontWeight','normal','ForegroundColor',[-1,-1,-1],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'Position',[0.2146875,0.9211111,0.2,0.0455556],'Relief','default','SliderStep',[0.01,0.1],'String','Save Image','Style','pushbutton','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','Save','Callback','Save_callback(handles)')
handles.imShow= newaxes();handles.imShow.margins = [ 0 0 0 0];handles.imShow.axes_bounds = [0.459375,0.0333333,0.525,0.9177778];
handles.Respond=uicontrol(f,'unit','normalized','BackgroundColor',[-1,-1,-1],'Enable','on','FontAngle','normal','FontName','Ubuntu','FontSize',[12],'FontUnits','points','FontWeight','normal','ForegroundColor',[-1,-1,-1],'HorizontalAlignment','left','ListboxTop',[],'Max',[1],'Min',[0],'Position',[0.043125,0.6177778,0.3615625,0.2044444],'Relief','default','SliderStep',[0.01,0.1],'String','','Style','text','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','Respond','Callback','')
handles.Info=uicontrol(f,'unit','normalized','BackgroundColor',[-1,-1,-1],'Enable','on','FontAngle','normal','FontName','Ubuntu','FontSize',[12],'FontUnits','points','FontWeight','normal','ForegroundColor',[-1,-1,-1],'HorizontalAlignment','left','ListboxTop',[],'Max',[1],'Min',[0],'Position',[0.070122,0.1622222,0.3050813,0.0644444],'Relief','default','SliderStep',[0.01,0.1],'String','Facial Recognition Système','Style','text','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','Info','Callback','')


f.visible = "on";


//////////
// Callbacks are defined as below. Please do not delete the comments as it will be used in coming version
//////////

function Input_callback(handles)
    File = uigetfile('*');
    img_test = imread(File);
    imshow(img_test);
    handles.Respond.String = "This personne is not autorize to enter in the systeme.";

endfunction


function Save_callback(handles)
    File = uigetfile('*');
    img_save = imread(File);
    f= findfiles('../base_de_donnee','*.png');
    image = strcat(["/base_de_donee/subjet" string(size(f)) ".png"]);
    imwrite(img_save, image);
endfunction

exec("main.sce",1);

