import unittest
import re
from rand import app
class BasicTestCase(unittest.TestCase):
  def test_get_random(self):
        tester = app.test_client(self)
        response = tester.get('/', content_type='html/text')
        self.assertEqual(response.status_code, 200)
        result_text=response.data
        random_number=re.search(r'[0-9]+',result_text).group()
        print 'random number is : '+random_number
        self.assertTrue(int(random_number) >= 0 and int(random_number) <= 200)
if __name__ == '__main__':
    unittest.main()