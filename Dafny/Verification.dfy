include "Ventilator.dfy"
 
module VerificationModule {
  import Ventilator
 
  method ValidateSafety() {
    var ventilator := new Ventilator.VentilatorSystem.Init();
   
    // Test starting ventilation
    ventilator.currentState := Ventilator.State.PowerOn;
    ventilator.StartVentilation();
    assert ventilator.currentState == Ventilator.State.Ventilating;
 
    // Test stopping ventilation
    ventilator.StopVentilation();
    assert ventilator.currentState == Ventilator.State.PowerOn;
 
    // Test triggering an alarm
    ventilator.StartVentilation();
    ventilator.TriggerAlarm();
    assert ventilator.currentState == Ventilator.State.Alarm;
 
    // Test resetting an alarm
    ventilator.ResetAlarm();
    assert ventilator.currentState == Ventilator.State.PowerOn;
  }
 
  method ValidateReliability() {
    var ventilator := new Ventilator.VentilatorSystem.Init();
   
    // Test alarm reliability
    ventilator.currentState := Ventilator.State.PowerOn;
    ventilator.StartVentilation();
    ventilator.TriggerAlarm();
    assert ventilator.alarmTriggered == true;
    assert ventilator.currentState == Ventilator.State.Alarm;
 
    ventilator.ResetAlarm();
    assert ventilator.alarmTriggered == false;
    assert ventilator.currentState == Ventilator.State.PowerOn;
  }
 
  method ValidateAdditionalSafety() {
    var ventilator := new Ventilator.VentilatorSystem.Init();
 
    // Test that ventilator does not transition from PowerOff to Ventilating directly
    ventilator.currentState := Ventilator.State.PowerOff;
    assert ventilator.currentState != Ventilator.State.Ventilating;
 
    // Test alarm reset safety
    ventilator.currentState := Ventilator.State.PowerOn;
    ventilator.StartVentilation();
    ventilator.TriggerAlarm();
    assert ventilator.alarmTriggered == true;
    ventilator.ResetAlarm();
    assert ventilator.alarmTriggered == false;
    assert ventilator.currentState == Ventilator.State.PowerOn;
  }
}