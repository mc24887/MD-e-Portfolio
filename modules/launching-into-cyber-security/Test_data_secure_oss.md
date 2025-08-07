class SecureOSS:
    def __init__(self, key):
        self.key = key
        self.cipher = AES.new(self.key, AES.MODE_EAX)

    def encrypt(self, data):
        nonce = self.cipher.nonce
        ciphertext, tag = self.cipher.encrypt_and_digest(data.encode('utf-8'))
        return base64.b64encode(nonce + ciphertext).decode('utf-8')
    
    def decrypt(self, enc_data):
        enc_data = base64.b64decode(enc_data.encode('utf-8'))
        nonce = enc_data[:16]
        ciphertext = enc_data[16:]
        cipher = AES.new(self.key, AES.MODE_EAX, nonce=nonce)
        return cipher.decrypt(ciphertext).decode('utf-8')

# Example usage
key = get_random_bytes(16)  # AES-128
secure_oss = SecureOSS(key)
encrypted_data = secure_oss.encrypt("Sensitive Information")
print(f"Encrypted Data: {encrypted_data}")

decrypted_data = secure_oss.decrypt(encrypted_data)
print(f"Decrypted Data: {decrypted_data}")
