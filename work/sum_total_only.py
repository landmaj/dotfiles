# sum_total_only.py
# Sums all values in total_only.tsv (comma as decimal separator)

def sum_totals(file_path):
    total = 0.0
    with open(file_path, 'r', encoding='utf-8') as f:
        for line in f:
            line = line.strip()
            if not line:
                continue
            # Replace comma with dot for float conversion
            value = float(line.replace(',', '.'))
            total += value
    return total

if __name__ == "__main__":
    file_path = "total_only.tsv"
    result = sum_totals(file_path)
    print(f"Sum: €{result:.2f}")
