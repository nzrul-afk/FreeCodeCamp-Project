class HashTable:
    def __init__(self):
        self.collection = {}

    def hash(self, key):
        total = 0
        for huruf in key:
            total += ord(huruf)
        return total

    def add(self, key, value):
        hashed = self.hash(key)
        if hashed not in self.collection:
            self.collection[hashed] = {}
        self.collection[hashed][key] = value

    def remove(self, key):
        hashed = self.hash(key)
        if hashed in self.collection and key in self.collection[hashed]:
            del self.collection[hashed][key]

    def lookup(self, key):
        hashed = self.hash(key)
        return self.collection.get(hashed, {}).get(key)
