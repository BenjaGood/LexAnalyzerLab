#Benjamin Gutierrez Mendoza A01642356
#code_generator.py
import random
import string
import sys

def rand_id():
    return random.choice(string.ascii_lowercase) + ''.join(random.choices(string.ascii_lowercase + string.digits, k=3))

def gen_comment():
    return "// this is a comment"

def gen_float_decl():
    return f"f {rand_id()}"

def gen_int_decl():
    return f"i {rand_id()}"

def gen_assign_int():
    return f"{rand_id()} = {random.randint(0, 999)}"

def gen_assign_float_add():
    return f"{rand_id()} = {rand_id()} + {random.uniform(0,100):.2f}"

def gen_print():
    return f"p {rand_id()}"

generators = [
    gen_comment,
    gen_float_decl,
    gen_int_decl,
    gen_assign_int,
    gen_assign_float_add,
    gen_print
]

def main():
    n = 20
    if len(sys.argv)>1:
        try:
            n = int(sys.argv[1])
        except:
            pass
    for _ in range(n):
        print(random.choice(generators)())

if __name__=="__main__":
    main()
