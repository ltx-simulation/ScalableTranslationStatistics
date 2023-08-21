within ScalableTranslationStatistics.Components.Functions;
function GetOneVariation_idx1
  input Integer x "number of masses that should be connected";
  input Integer k "index of the nonlinear spring chain";
  output Integer idx1 "index of the first mass to be connected";

protected
  Integer n=0 "Internal counting parameter";
algorithm
  for enum1 in (1:x-1) loop
    for enum2 in (1:x-enum1) loop
      n:=n+1;
      if n==k then
        idx1:=enum2;
      end if;
      // combinations[n,1]:=i;
      // combinations[n,2]:=j;
      // print( String(n)+" "+String(i)+" "+String(j));
    end for;
  end for;

  annotation (Documentation(info="<html>
<p>function to get the index of the first mass (idx1) to be connected by a nonlinear spring chain </p>
<p><u>example:</u> assume four masses to be connected: (x=4): </p>
<ul>
<li>the first nonlinear spring chain (k=1) should connect mass[1] (idx1=1) and mass[2] (idx2=2) </li>
<li>the second nonlinear spring chain (k=2) should connect mass[2] (idx1=2) and mass[3] (idx2=3) </li>
<li>the third nonlinear spring chain (k=3) should connect mass[3] (idx1=3) and mass[4] (idx2=4) </li>
<p> now all four masses are connected with their neighboors.
We continue by connecting masses where one mass is inbetween<\\p>
<li>the fourth nonlinear spring chain (k=4) should connect mass[1] (idx1=1) and mass[3] (idx2=3) </li>
<li>the fifth nonlinear spring chain (k=5) should connect mass[2] (idx1=2) and mass[4] (idx2=4) </li>
<p> now also all possibilities to connect masses with one mass inbetween are done.
We continue to connect masses with two masses inbetween. In case of four masses this is only mass1 with mass4. Then all combinations of mass connections are used.<\\p>
<li>the sixth nonlinear spring chain (k=6) should connect mass[1] (idx1=1) and mass[4] (idx2=4) </li>
<ul>
</html>"));
end GetOneVariation_idx1;
