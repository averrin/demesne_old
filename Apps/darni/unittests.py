import unittest
import sys

sys.path.append('Garden')
sys.path.append('../../Garden')
from winterstone.snowflake import CWD

sys.path.append(CWD)

from base import *

class TestSets(unittest.TestCase):
    def setUp(self):
        self.hero = Hero('Great Hero')
        self.hero.Speed = 5
        self.hero.Agility = 5
        self.hero.Strength = 10
        self.helm = Wearable('Helm', 'Head')

        self.effect1 = Modifier('Speed', 'Speed', 5)
        self.effect2 = Modifier('Agility', 'Agility', 5)
        self.enchant1 = Enchant('Test')
        self.enchant2 = Enchant('Test', [self.effect1, self.effect2])

        self.goldRing = Wearable('Gold Ring', 'Ring')
        self.silverRing = Wearable('Silver Ring', 'Ring')

        self.set1 = Set('Test set', [self.helm, self.goldRing], self.enchant2)

    def tearDown(self):
        del self.helm
        del self.hero
        del self.effect1
        del self.effect2
        del self.enchant1
        del self.enchant2
        del self.goldRing
        del self.silverRing
        del self.set1

    def test_set(self):
        self.hero.inventory.add(self.set1.getItem(self.hero))
        self.hero.inventory.add(self.set1.getItem(self.hero))
        self.assertIn(self.helm, self.hero.inventory.items)
        self.assertIn(self.goldRing, self.hero.inventory.items)

        self.helm.equip()
        self.goldRing.equip()
        self.assertEqual(self.hero.Speed, 10)
        self.assertEqual(self.hero.Agility, 10)
        self.goldRing.unequip()
        self.assertEqual(self.hero.Speed, 5)
        self.assertEqual(self.hero.Agility, 5)
        self.helm.unequip()
        self.assertEqual(self.hero.Speed, 5)
        self.assertEqual(self.hero.Agility, 5)


class TestEffects(unittest.TestCase):
    def setUp(self):
        self.hero = Hero('Great Hero')
        self.hero.Speed = 5
        self.hero.Agility = 5
        self.hero.Strength = 10
        self.helm = Wearable('Helm', 'Head')

        self.effect1 = Modifier('Speed', 'Speed', 5)
        self.effect2 = Modifier('Agility', 'Agility', 5)
        self.enchant1 = Enchant('Test')
        self.enchant2 = Enchant('Test', [self.effect1, self.effect2])

        def act():
            self.effect3.target['Speed'] *= 3

        def deact():
            self.effect3.target['Speed'] /= 3

        self.effect3 = Effect('Multi', act, deact)

    def tearDown(self):
        del self.helm
        del self.hero
        del self.effect1
        del self.effect2
        del self.enchant1
        del self.enchant2
        del self.effect3

    def test_custom_effect(self):
        self.effect3.activate(self.hero)
        self.assertEqual(self.hero.Speed, 15)

        self.effect3.deactivate()
        self.assertEqual(self.hero.Speed, 5)

        with self.assertRaises(AlreadyDeactivatedException):
            self.effect3.deactivate()
        self.assertEqual(self.hero.Speed, 5)

    def test_enchant(self):
        self.enchant2.activate(self.hero)
        self.assertEqual(self.hero.Speed, 10)
        self.assertEqual(self.hero.Agility, 10)

        self.enchant2.deactivate()
        self.assertEqual(self.hero.Speed, 5)
        self.assertEqual(self.hero.Agility, 5)

        with self.assertRaises(AlreadyDeactivatedException):
            self.enchant2.deactivate()
        self.assertEqual(self.hero.Speed, 5)
        self.assertEqual(self.hero.Agility, 5)

        self.enchant1.activate(self.hero)
        self.assertEqual(self.hero.Speed, 5)
        self.assertEqual(self.hero.Agility, 5)

        self.enchant1.deactivate()
        self.assertEqual(self.hero.Speed, 5)
        self.assertEqual(self.hero.Agility, 5)

        with self.assertRaises(TypeError):
            Enchant('With error', 'String instead list')

    def test_item_enchant(self):
        self.helm.enchant = self.enchant2
        self.hero.inventory.add(self.helm)
        self.helm.equip()
        self.assertEqual(self.hero.Speed, 10)
        self.assertEqual(self.hero.Agility, 10)
        self.helm.unequip()
        self.assertEqual(self.hero.Speed, 5)
        self.assertEqual(self.hero.Agility, 5)

    def test_modifier(self):
        self.effect1.activate(self.hero)
        self.assertEqual(self.hero.Speed, 10)

        self.effect1.deactivate()
        self.assertEqual(self.hero.Speed, 5)

        with self.assertRaises(CantActivateException):
            self.effect1.activate(None)

        with self.assertRaises(AlreadyDeactivatedException):
            self.effect1.deactivate()
        self.assertEqual(self.hero.Speed, 5)


class TestInv(unittest.TestCase):
    def setUp(self):
        self.helm = Wearable('Helm', 'Head')
        self.hat = Wearable('Hat', 'Head')
        self.hero = Hero('Great Hero')
        self.hero.Speed = 5
        self.hero.Agility = 5
        self.hero.Strength = 10

        self.goldRing = Wearable('Gold Ring', 'Ring')
        self.silverRing = Wearable('Silver Ring', 'Ring')

        self.cursedRing = Wearable('Cursed Ring', 'Ring')

        def canGet(owner):
            return False

        self.cursedRing.canGet = canGet


    def tearDown(self):
        del self.helm
        del self.hat
        del self.hero
        del self.goldRing
        del self.silverRing
        del self.cursedRing

    def test_item_custom_canget(self):
        self.hero.inventory.add(self.cursedRing)
        self.assertNotIn(self.cursedRing, self.hero.inventory.items)

    def test_inventory_add(self):
        self.hero.inventory.add(self.helm)
        self.assertIn(self.helm, self.hero.inventory.items)

    def test_inventory_remove(self):
        self.hero.inventory.add(self.helm)
        self.assertIn(self.helm, self.hero.inventory.items)
        self.hero.inventory.remove(self.helm)
        self.assertNotIn(self.helm, self.hero.inventory.items)

    def test_inventory_add_too_weight(self):
        self.hero.inventory.capacity = 10
        self.helm.weight = 10
        self.hat.weight = 10
        self.hero.inventory.add(self.hat)
        self.hero.inventory.add(self.helm)
        self.assertNotIn(self.helm, self.hero.inventory.items)

    def test_slot_wear(self):
        self.hero.doll.Head.wear(self.helm)
        self.assertTrue(self.helm.equipped)
        self.assertEqual(self.hero.doll.Head.item, self.helm)

    def test_slot_clear(self):
        self.hero.doll.Head.clear()
        self.assertFalse(self.helm.equipped)
        self.assertIsNone(self.hero.doll.Head.item)

    def test_item_equip(self):
        with self.assertRaises(CantEquipException):
            self.helm.equip()
        self.assertFalse(self.helm.equipped)
        self.hero.inventory.add(self.helm)
        self.helm.equip()
        self.assertTrue(self.helm.equipped)
        self.assertIs(self.hero.doll.Head.item, self.helm)

    def test_item_unequip(self):
        with self.assertRaises(CantEquipException):
            self.helm.equip()
        with self.assertRaises(CantUnEquipException):
            self.helm.unequip()
        self.assertFalse(self.helm.equipped)
        self.assertIsNone(self.hero.doll.Head.item)

    def test_item_equip2(self):
        self.hero.inventory.add(self.helm)
        self.hero.inventory.add(self.hat)
        self.helm.equip()
        self.hat.equip()
        self.assertFalse(self.helm.equipped)
        self.assertTrue(self.hat.equipped)
        self.assertIs(self.hero.doll.Head.item, self.hat)

    def test_item_equip3(self):
        self.hero.inventory.add(self.goldRing)
        self.hero.inventory.add(self.silverRing)
        self.goldRing.equip()
        self.silverRing.equip()
        self.assertTrue(self.goldRing.equipped)
        self.assertTrue(self.silverRing.equipped)

    def test_item_cant_wear(self):
        with self.assertRaises(CantWearException):
            self.hero.doll.Head.wear(self.goldRing)


if __name__ == "__main__":
    unittest.main()