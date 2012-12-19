unitsize(40);

pair branchL = (-1.5,-1);
pair branchR = (1.5,-1);
pair labelDepth = (0,-0.4);

pair rn = (0,0);
pair Pn = rn + branchL;
pair Qn = rn + branchR;
pair Rn = Qn + labelDepth + branchL;
pair Sn = Qn + labelDepth + branchR;

Label("$[\phi_1,\phi_2,\ldots,\phi_n]$",rn,N);
draw("$P$",rn--Pn,NW);
draw("$Q$",rn--Qn,NE);
label("$[\psi_1,\psi_2,\ldots,\psi_n]$",Pn,S);
label("$[\chi_1,\chi_2,\ldots,\chi_n]$",Qn,S);
draw("$R$",Qn+labelDepth--Rn,NW);
draw("$S$",Qn+labelDepth--Sn,NE);
label("$[\alpha_1,\alpha_2,\ldots,\alpha_n]$",Rn,S);
label("$[\beta_1,\beta_2,\ldots,\beta_n]$",Sn,S);

shipout(format="pdf");
