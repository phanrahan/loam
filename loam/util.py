def write_file(file_name, extension, code):
    with open("{}.{}".format(file_name, extension), 'w') as file:
        file.write(code)
