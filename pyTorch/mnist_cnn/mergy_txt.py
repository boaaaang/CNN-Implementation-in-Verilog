import glob
import os

#path = os.path.dirname(os.path.realpath(__file__))
#os.chdir(path)

#if os.path.exists("100_0.txt"):
#  print("The file is found")
#else:
#  print("The file does not exist")
    
read_files = glob.glob("*.txt")
print(read_files)

with open("1000.txt", "wb") as outfile:
  for f in read_files:
    with open(f) as file:
      for line in file:
        line = line + '\n'
        outfile.write(line.encode('utf-8'))