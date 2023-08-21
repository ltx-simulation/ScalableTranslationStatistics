within ScalableTranslationStatistics.Components.Partial;
partial model PartialSleepySpring_alternative
  extends Modelica.Mechanics.Translational.Interfaces.PartialTwoFlanges;

  parameter Modelica.Units.SI.TranslationalSpringConstant c = 1 "stiffness of the spring; The real stiffness is alternating between this stiffness and 10% of this value";
  parameter Modelica.Units.SI.Position s_unstreched = 0 "unstreched length of the spring";
  parameter Integer compiler_type = 1 "1=visual studio, 2=gcc";
  parameter Real waiting_time = 50 "waiting time in milliseconds";
protected
  function WaitingVS = Functions.SleepVS "waiting function for Visual Studio Compiler";
  function WaitingGCC =Functions.SleepGCC "waiting function for gcc Compiler";
equation
  if waiting_time>0 then
    if compiler_type==1 then
      WaitingVS(waiting_time*1000);
    else
      WaitingGCC(waiting_time*1000);
    end if;
  end if;

  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Line(points={{-60,-90},{20,-90}}, color={95,127,95}),
        Polygon(
          points={{50,-90},{20,-80},{20,-100},{50,-90}},
          lineColor={95,127,95},
          fillColor={95,127,95},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-150,90},{150,50}},
          textString="%name",
          textColor={0,0,255}),
        Line(points={{-98,0},{-60,0},{-44,-30},{-16,30},{14,-30},{44,30},{60,0},
              {100,0}},       color={0,127,0}),
        Text(
          extent={{-36,8},{-2,-42}},
          textColor={0,0,0},
          textString="Z"),
        Text(
          extent={{-10,20},{18,-22}},
          textColor={0,0,0},
          textString="Z"),
        Text(
          extent={{16,28},{30,-4}},
          textColor={0,0,0},
          textString="Z")}),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p> partial model which extends <a href=modelica://Modelica.Mechanics.Translational.Interfaces.PartialTwoFlanges>Modelica.Mechanics.Translational.Interfaces.PartialTwoFlanges</a> by adding a waiting / sleeping time to imitate longer simulation times.
The waiting time is realized by an external c-function, which is implemented once for the visual studio compiler and once for the gcc compiler</p>
</html>"));
end PartialSleepySpring_alternative;
