import os
import subprocess

def get_ogg_duration(filepath):
    """Returns the duration of an ogg file in seconds (float)."""
    result = subprocess.run(
        [
            "ffprobe", "-v", "error", "-show_entries",
            "format=duration", "-of",
            "default=noprint_wrappers=1:nokey=1", filepath
        ],
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        text=True
    )
    try:
        return float(result.stdout.strip())
    except ValueError:
        return 0.0

def sanitize_classname(filename):
    """Sanitize filename to a valid Arma class name (remove extension, replace spaces)."""
    return os.path.splitext(filename)[0].replace(" ", "_")

def main(directory):
    print("class CfgSounds {")
    for fname in os.listdir(directory):
        if fname.lower().endswith(".ogg"):
            classname = sanitize_classname(fname)
            duration = get_ogg_duration(os.path.join(directory, fname))
            print(f"    class {classname} {{")
            print(f"        name = \"{classname}\";")
            print(f"        titles[] = {{}};")
            print(f"        sound[] = {{")
            print(f"            \"{fname}\",")
            print(f"            5,")
            print(f"            1")
            print(f"        }};")
            print(f"        duration = {duration:.2f};")
            print(f"    }};")
    print("};")

if __name__ == "__main__":
    import sys
    if len(sys.argv) != 2:
        print("Usage: python generate_cfgsounds.py /path/to/ogg/files")
    else:
        main(sys.argv[1])
