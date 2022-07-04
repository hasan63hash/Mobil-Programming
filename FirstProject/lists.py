
# Liste tanımlama
friends = ["Kevin", "Jimmy", "Moneo", "John"]
numbers = [10, 5, 3, 2, 10, 2]

# Listeden eleman alma
friends[0]

# Listeden bir parça alma
friends[1:] # 1'inci indexten listenin sonuna kadar olanlar

# [1, 3) aralağını almak için
friends[1:3]

# 2 listeyi birleştirme
friends.extend(numbers)

# Listenin sonuna eleman ekleme
friends.append("Karen")

# Belirli bir indekse eleman ekleme
friends.insert(1, "Kelly")

# İstenen bir elemanı silme
friends.remove("Karen")

# Tüm elemanları silme
friends.clear()

# Sondaki elemanı silme
friends.pop()

# Listede bir elemanın index'ini alma
friends.index("Jimmy")

# Listede bir elemanın kaç defa olduğunu alma
friends.count("Jimmy")

# Listeyi sıralama ascending
friends.sort()

# Listeyi tersine çevirme
friends.reverse()

# Listeyi kopyalama
friends.copy()







