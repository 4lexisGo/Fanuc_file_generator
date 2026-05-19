path = "TEST_INIT/SOURCE/SAB01_20.LS"

with open(path, "r", encoding="cp1252") as f:
    output_lines = f.readlines()

liste = []
for line in output_lines:
    liste.append(line.strip())

with open("tests/test.LS", "w", encoding="cp1252") as f:
    for i, line in enumerate(liste):
        f.writelines(f"{(i):>4}:{line}+\n")

