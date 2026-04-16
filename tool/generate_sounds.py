"""
Generate all sound effects for Chess Quest as WAV files.
Uses only Python stdlib (wave, struct, math). No external dependencies.

Each sound is synthesized from sine waves, noise, and envelopes
to create pleasant, kid-friendly audio cues.
"""
import wave
import struct
import math
import random
import os

SAMPLE_RATE = 44100
OUTPUT_DIR = os.path.join(os.path.dirname(os.path.dirname(__file__)), "assets", "audio")


def make_wav(filename, samples, sample_rate=SAMPLE_RATE):
    """Write 16-bit mono WAV."""
    path = os.path.join(OUTPUT_DIR, filename)
    with wave.open(path, "w") as f:
        f.setnchannels(1)
        f.setsampwidth(2)
        f.setframerate(sample_rate)
        for s in samples:
            clamped = max(-1.0, min(1.0, s))
            f.writeframes(struct.pack("<h", int(clamped * 32767)))
    print(f"  Created {filename} ({len(samples)} samples, {len(samples)/sample_rate:.2f}s)")


def sine(freq, duration, volume=0.5):
    """Pure sine wave."""
    n = int(SAMPLE_RATE * duration)
    return [volume * math.sin(2 * math.pi * freq * i / SAMPLE_RATE) for i in range(n)]


def fade_in(samples, duration=0.01):
    n = int(SAMPLE_RATE * duration)
    for i in range(min(n, len(samples))):
        samples[i] *= i / n
    return samples


def fade_out(samples, duration=0.05):
    n = int(SAMPLE_RATE * duration)
    length = len(samples)
    for i in range(min(n, length)):
        samples[length - 1 - i] *= i / n
    return samples


def envelope(samples, attack=0.01, decay=0.05, sustain=0.7, release=0.1):
    """ADSR envelope."""
    total = len(samples)
    a = int(SAMPLE_RATE * attack)
    d = int(SAMPLE_RATE * decay)
    r = int(SAMPLE_RATE * release)
    s_end = total - r

    for i in range(total):
        if i < a:
            samples[i] *= i / max(a, 1)
        elif i < a + d:
            t = (i - a) / max(d, 1)
            samples[i] *= 1.0 - t * (1.0 - sustain)
        elif i < s_end:
            samples[i] *= sustain
        else:
            t = (i - s_end) / max(r, 1)
            samples[i] *= sustain * (1.0 - t)
    return samples


def mix(*layers):
    """Mix multiple sample lists together."""
    length = max(len(l) for l in layers)
    result = [0.0] * length
    for layer in layers:
        for i, s in enumerate(layer):
            result[i] += s
    # Normalize to prevent clipping
    peak = max(abs(s) for s in result) or 1.0
    if peak > 0.95:
        result = [s / peak * 0.9 for s in result]
    return result


def noise(duration, volume=0.1):
    """White noise."""
    n = int(SAMPLE_RATE * duration)
    return [volume * (random.random() * 2 - 1) for _ in range(n)]


def concat(*parts):
    """Concatenate sample lists."""
    result = []
    for p in parts:
        result.extend(p)
    return result


def silence(duration):
    return [0.0] * int(SAMPLE_RATE * duration)


# ── Sound Generators ──────────────────────────────────────

def gen_move():
    """Wood tap - short percussive click."""
    click = noise(0.04, 0.8)
    tone = sine(800, 0.04, 0.3)
    s = mix(click, tone)
    s = envelope(s, attack=0.001, decay=0.03, sustain=0.0, release=0.01)
    return fade_out(s, 0.02)


def gen_capture():
    """Stronger wood knock - deeper thud."""
    click = noise(0.06, 0.9)
    tone1 = sine(400, 0.06, 0.4)
    tone2 = sine(200, 0.08, 0.3)
    s = mix(click, tone1, tone2)
    s = envelope(s, attack=0.001, decay=0.05, sustain=0.1, release=0.03)
    return fade_out(s, 0.03)


def gen_check():
    """Alert chime - two quick ascending tones."""
    t1 = envelope(sine(880, 0.12, 0.5), attack=0.005, decay=0.03, sustain=0.4, release=0.04)
    t2 = envelope(sine(1320, 0.12, 0.5), attack=0.005, decay=0.03, sustain=0.4, release=0.04)
    return concat(t1, silence(0.02), t2)


def gen_checkmate():
    """Victory fanfare - ascending chord."""
    t1 = envelope(sine(523, 0.2, 0.4), attack=0.01, decay=0.05, sustain=0.3, release=0.1)
    t2 = envelope(sine(659, 0.2, 0.4), attack=0.01, decay=0.05, sustain=0.3, release=0.1)
    t3 = envelope(sine(784, 0.3, 0.4), attack=0.01, decay=0.05, sustain=0.3, release=0.15)
    t4 = envelope(sine(1047, 0.5, 0.5), attack=0.01, decay=0.1, sustain=0.3, release=0.2)
    return concat(t1, silence(0.02), t2, silence(0.02), t3, silence(0.02), t4)


def gen_success():
    """Bright ding - pleasant confirmation."""
    t1 = sine(1047, 0.15, 0.4)  # C5
    t2 = sine(2093, 0.15, 0.2)  # C6 overtone
    s = mix(t1, t2)
    s = envelope(s, attack=0.005, decay=0.05, sustain=0.3, release=0.08)
    return s


def gen_error():
    """Gentle buzz - low soft rejection."""
    t1 = sine(220, 0.15, 0.3)
    t2 = sine(185, 0.15, 0.3)
    s = mix(t1, t2)  # Slightly dissonant
    s = envelope(s, attack=0.005, decay=0.05, sustain=0.3, release=0.08)
    return s


def gen_level_up():
    """Ascending sparkle sequence."""
    notes = [523, 659, 784, 1047, 1319]  # C E G C' E'
    parts = []
    for freq in notes:
        t = envelope(sine(freq, 0.12, 0.4), attack=0.005, decay=0.03, sustain=0.3, release=0.05)
        # Add sparkle overtone
        t2 = envelope(sine(freq * 3, 0.08, 0.15), attack=0.002, decay=0.02, sustain=0.1, release=0.03)
        parts.append(mix(t, t2))
        parts.append(silence(0.03))
    return concat(*parts)


def gen_achievement():
    """Magical sparkle - bright arpeggiated chord with shimmer."""
    notes = [784, 988, 1175, 1568]  # G B D' G'
    parts = []
    for i, freq in enumerate(notes):
        t = envelope(sine(freq, 0.15, 0.35), attack=0.005, decay=0.04, sustain=0.3, release=0.08)
        sparkle = envelope(sine(freq * 2.5, 0.1, 0.15), attack=0.002, decay=0.03, sustain=0.1, release=0.04)
        parts.append(mix(t, sparkle))
        parts.append(silence(0.02))
    # Final sustained chord
    chord = mix(
        envelope(sine(784, 0.4, 0.3), attack=0.01, decay=0.1, sustain=0.2, release=0.2),
        envelope(sine(988, 0.4, 0.25), attack=0.01, decay=0.1, sustain=0.2, release=0.2),
        envelope(sine(1175, 0.4, 0.2), attack=0.01, decay=0.1, sustain=0.2, release=0.2),
        envelope(sine(1568, 0.4, 0.2), attack=0.01, decay=0.1, sustain=0.2, release=0.2),
    )
    parts.append(chord)
    return concat(*parts)


def gen_star():
    """Star ting - bright metallic ping."""
    t1 = sine(2637, 0.1, 0.4)  # E7
    t2 = sine(3951, 0.08, 0.2)  # B7 overtone
    n = noise(0.02, 0.15)
    s = mix(t1, t2, n + [0.0] * (len(t1) - len(n)))
    s = envelope(s, attack=0.002, decay=0.03, sustain=0.2, release=0.06)
    return s


def gen_tap():
    """Soft UI click."""
    click = noise(0.015, 0.4)
    tone = sine(1200, 0.015, 0.2)
    s = mix(click, tone)
    s = envelope(s, attack=0.001, decay=0.01, sustain=0.0, release=0.005)
    return s


def gen_coin():
    """Coin jingle - two metallic pings."""
    t1 = envelope(sine(1760, 0.08, 0.4), attack=0.002, decay=0.02, sustain=0.2, release=0.04)
    t2 = envelope(sine(2217, 0.08, 0.4), attack=0.002, decay=0.02, sustain=0.2, release=0.04)
    n1 = envelope(noise(0.03, 0.15), attack=0.001, decay=0.01, sustain=0.05, release=0.01)
    p1 = mix(t1, n1 + [0.0] * (len(t1) - len(n1)))
    p2 = mix(t2, n1 + [0.0] * (len(t2) - len(n1)))
    return concat(p1, silence(0.04), p2)


def gen_xp():
    """Quick whoosh - ascending sweep."""
    n = int(SAMPLE_RATE * 0.2)
    samples = []
    for i in range(n):
        t = i / n
        freq = 400 + t * 1600  # Sweep from 400 to 2000 Hz
        vol = 0.3 * math.sin(math.pi * t)  # Bell curve volume
        samples.append(vol * math.sin(2 * math.pi * freq * i / SAMPLE_RATE))
    # Add a bit of noise for texture
    n_noise = noise(0.2, 0.08)
    return mix(samples, n_noise)


# ── Main ──────────────────────────────────────────────────

def main():
    os.makedirs(OUTPUT_DIR, exist_ok=True)
    print("Generating Chess Quest sound effects...")
    print()

    sounds = {
        "move.wav": gen_move,
        "capture.wav": gen_capture,
        "check.wav": gen_check,
        "checkmate.wav": gen_checkmate,
        "success.wav": gen_success,
        "error.wav": gen_error,
        "level_up.wav": gen_level_up,
        "achievement.wav": gen_achievement,
        "star.wav": gen_star,
        "tap.wav": gen_tap,
        "coin.wav": gen_coin,
        "xp.wav": gen_xp,
    }

    for filename, generator in sounds.items():
        samples = generator()
        make_wav(filename, samples)

    print()
    print(f"Done! {len(sounds)} sound files generated in {OUTPUT_DIR}")


if __name__ == "__main__":
    main()
