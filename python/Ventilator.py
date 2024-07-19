class VentilatorSystem:
    def _init_(self):
        self.current_state = 'PowerOff'
        self.alarm_triggered = False

    def start_ventilation(self):
        assert self.current_state == 'PowerOn'
        self.current_state = 'Ventilating'

    def stop_ventilation(self):
        assert self.current_state == 'Ventilating'
        self.current_state = 'PowerOn'

    def trigger_alarm(self):
        assert self.current_state == 'Ventilating'
        self.current_state = 'Alarm'
        self.alarm_triggered = True

    def reset_alarm(self):
        assert self.current_state == 'Alarm'
        self.current_state = 'PowerOn'
        self.alarm_triggered = False