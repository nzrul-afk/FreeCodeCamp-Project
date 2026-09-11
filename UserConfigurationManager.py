test_settings = {
    'theme' : 'manuk'
    }

def add_setting(settings_dict,settings_tuple):
    key = str(settings_tuple[0]).lower()
    value = str(settings_tuple[1]).lower()
    if key in settings_dict:
        return f"Setting '{key}' already exists! Cannot add a new setting with this name."

    settings_dict[key] = value
    return f"Setting '{key}' added with value '{value}' successfully!"

def update_setting(settings_dict, settings_tuple):
    key= str(settings_tuple[0]).lower()
    value= str(settings_tuple[1]).lower()
    if key in settings_dict:
        settings_dict[key] = value
        return f"Setting '{key}' updated to '{value}' successfully!"
    return f"Setting '{key}' does not exist! Cannot update a non-existing setting."

def delete_setting(settings_dict, key):
    key = str(key).lower()
    if key in settings_dict:
        del settings_dict[key]
        return f"Setting '{key}' deleted successfully!"
    return f"Setting not found!"
    
def view_settings(settings_dict):
    if not settings_dict:
        return "No settings available."
    output= "Current User Settings:"
    for key, value in settings_dict.items():
        output += f"\n{key.capitalize()}: {value}"
    return output + "\n"
