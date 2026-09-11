class Category:
    def __init__(self, name):
        self.name = name
        self.ledger = []

    def deposit(self, amount, description=""):
        self.ledger.append({'amount': amount, 'description': description})

    def withdraw(self, amount, description=""):
        if self.check_funds(amount):
            self.ledger.append({'amount': -amount, 'description': description})
            return True
        return False

    def get_balance(self):
        return sum(item['amount'] for item in self.ledger)

    def check_funds(self, amount):
        return amount <= self.get_balance()

    def transfer(self, amount, destination_category):
        if self.check_funds(amount):
            self.withdraw(amount, f"Transfer to {destination_category.name}")
            destination_category.deposit(amount, f"Transfer from {self.name}")
            return True
        return False

    def __str__(self):
        title = f"{self.name:*^30}\n"
        items = ""
        for entry in self.ledger:
            description = entry['description'][:23]
            amount = entry['amount']
            items += f"{description:<23}{amount:>7.2f}\n"
        output = title + items + f"Total: {self.get_balance():.2f}"
        return output


def create_spend_chart(categories):
    spent_amounts = []
    for category in categories:
        spent = 0
        for item in category.ledger:
            if item['amount'] < 0:
                spent += abs(item['amount'])
        spent_amounts.append(spent)

    total_spent = sum(spent_amounts)
    spent_percentages = [round((amount / total_spent) * 100) for amount in spent_amounts]

    chart = "Percentage spent by category\n"

    for level in reversed(range(0, 101, 10)):
        chart += str(level).rjust(3) + "| "
        for percentage in spent_percentages:
            chart += "o  " if percentage >= level else "   "
        chart += "\n"

    chart += "    " + "-" * (3 * len(categories) + 1) + "\n"

   
    max_name_length = max(len(category.name) for category in categories)
    padded_names = [category.name.ljust(max_name_length) for category in categories]

    for i in range(max_name_length):
        chart += "     "
        for name in padded_names:
            chart += name[i] + "  "
        if i != max_name_length - 1:
            chart += "\n"

    return chart
