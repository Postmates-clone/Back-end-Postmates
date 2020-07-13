def get_data(data, fields):
    if len(fields) == 1:
        ret = data.get(fields[0], False)
        if type(ret) == str:
            ret = ret.strip()
        return ret
    if fields and data.get(fields[0], False):
        return get_data(data[fields[0]], fields[1:])