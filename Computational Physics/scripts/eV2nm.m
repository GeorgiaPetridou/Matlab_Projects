prompt = 'Do you want conversion from eV to nm  OR  from nm to eV? (type eV or nm)';
str = input(prompt,'s');
if strcmp(str,'eV')
    prompt = 'What is the energy gap in [eV]?';
    energy = input(prompt);
    wavelength = 1240.8/energy;
    disp('the wavelength is ')
    disp(wavelength)
    disp(' nm')
else
    prompt = 'What is the wavelength in [nm]?';
    wavelength = input(prompt);
    energy = 1240.8/wavelength;
    disp('the energy is ')
    disp(energy)
    disp(' eV')
end
