within ScalableTranslationStatistics.Utilities;
function SleepVS
  input Integer waitingTime "waiting time in mikroseconds";
  external "C" msleep(waitingTime) annotation(Include="#include <sleep_vs.c>", IncludeDirectory=
        "modelica://ScalableTranslationStatistics/Resources");

  annotation (Documentation(info="<html>
<p>sleeping function defined for visual studio compiler</p>
</html>"));
end SleepVS;
