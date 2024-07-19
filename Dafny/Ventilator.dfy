module Ventilator {
  // Define states of the ventilator
  datatype State =
    | PowerOff
    | PowerOn
    | Ventilating
    | Alarm
 
  // Define the ventilator system
  class VentilatorSystem {
    var currentState: State
    var alarmTriggered: bool
 
    // Constructor to initialize the state
    constructor Init()
      ensures currentState == State.PowerOff
      ensures !alarmTriggered
    {
      currentState := State.PowerOff;
      alarmTriggered := false;
    }
 
    // Method to power on the ventilator
    method PowerOnVentilator()
      modifies this
      requires currentState == State.PowerOff
      ensures currentState == State.PowerOn
    {
      currentState := State.PowerOn;
    }
 
    // Method to start ventilation
    method StartVentilation()
      modifies this
      requires currentState == State.PowerOn
      ensures currentState == State.Ventilating
    {
      currentState := State.Ventilating;
    }
 
    // Method to stop ventilation
    method StopVentilation()
      modifies this
      requires currentState == State.Ventilating
      ensures currentState == State.PowerOn
    {
      currentState := State.PowerOn;
    }
 
    // Method to trigger an alarm
    method TriggerAlarm()
      modifies this
      requires currentState == State.Ventilating
      ensures currentState == State.Alarm
      ensures alarmTriggered
    {
      currentState := State.Alarm;
      alarmTriggered := true;
    }
 
    // Method to reset an alarm
    method ResetAlarm()
      modifies this
      requires currentState == State.Alarm
      ensures currentState == State.PowerOn
      ensures !alarmTriggered
    {
      currentState := State.PowerOn;
      alarmTriggered := false;
    }
  }
 
  // Example usage of the ventilator system
  method Main() {
    var ventilatorSystem := new VentilatorSystem.Init();
   
    // Example sequence of operations
    ventilatorSystem.PowerOnVentilator();
    ventilatorSystem.StartVentilation();
    ventilatorSystem.TriggerAlarm();
   
    assert ventilatorSystem.currentState == State.Alarm;
    assert ventilatorSystem.alarmTriggered;
  }
}