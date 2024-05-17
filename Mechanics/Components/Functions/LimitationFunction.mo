within ScalableTranslationStatistics.Mechanics.Components.Functions;
function LimitationFunction
  input Real x "signal that should be limited";
  input Real limit "limitation value: x must between -limit and +limit";
  output Real y "returns x, if inside limits, raises error otherwise";
algorithm
  assert(x<limit,"upper limitation exceeded");

  assert(x>(-1)*limit,"lower limitation exceeded");
  y:=x;
  annotation (Documentation(info="<html>
Function to limit an input signal to the range -limit &lt; x &lt; +limit 
</html>"));
end LimitationFunction;
