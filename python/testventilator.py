import unittest
from Ventilator import VentilatorSystem

class TestVentilatorSystem(unittest.TestCase):

    def test_start_ventilation(self):
        ventilator = VentilatorSystem()
        ventilator.current_state = 'PowerOn'
        ventilator.start_ventilation()
        self.assertEqual(ventilator.current_state, 'Ventilating')

    def test_stop_ventilation(self):
        ventilator = VentilatorSystem()
        ventilator.current_state = 'Ventilating'
        ventilator.stop_ventilation()
        self.assertEqual(ventilator.current_state, 'PowerOn')

    def test_trigger_alarm(self):
        ventilator = VentilatorSystem()
        ventilator.current_state = 'Ventilating'
        ventilator.trigger_alarm()
        self.assertEqual(ventilator.current_state, 'Alarm')
        self.assertTrue(ventilator.alarm_triggered)

    def test_reset_alarm(self):
        ventilator = VentilatorSystem()
        ventilator.current_state = 'Alarm'
        ventilator.reset_alarm()
        self.assertEqual(ventilator.current_state, 'PowerOn')
        self.assertFalse(ventilator.alarm_triggered)

    def test_invalid_transition(self):
        ventilator = VentilatorSystem()
        ventilator.current_state = 'PowerOff'
        with self.assertRaises(AssertionError):
            ventilator.start_ventilation()

if __name__ == '__main__':
    unittest.main()
