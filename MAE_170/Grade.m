hw_labs = [0 100 78 92.5 94 92.5 96 88.5 100];
midterms = [77]
final = [80]
participation = []

WHw = .3
Wmidterm = .3
Wfinal = .4
Wpart = 0

grade = (sum(hw_labs)/(length(hw_labs)*100) * WHw) + (midterms/100)*Wmidterm + Wfinal*(final/100)