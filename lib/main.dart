import 'package:flutter/material.dart';

void main() {
  runApp(const TravelJournalApp());
}

class JournalEntry {
  final String title;
  final String notes;
  final String imageUrl;

  JournalEntry({
    required this.title,
    required this.notes,
    required this.imageUrl,
  });
}

class TravelJournalApp extends StatelessWidget {
  const TravelJournalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel Journal',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const JournalListScreen(),
    );
  }
}

class JournalListScreen extends StatefulWidget {
  const JournalListScreen({super.key});

  @override
  State<JournalListScreen> createState() => _JournalListScreenState();
}

class _JournalListScreenState extends State<JournalListScreen> {
  final List<JournalEntry> entries = [];

  void _addEntry(JournalEntry entry) {
    setState(() {
      entries.add(entry);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Travels'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: entries.isEmpty
          ? const Center(child: Text('No entries yet. Start exploring!'))
          : ListView.builder(
              itemCount: entries.length,
              itemBuilder: (context, index) {
                final entry = entries[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(12.0),
                    leading: entry.imageUrl.isNotEmpty
                        ? Image.network(
                            entry.imageUrl,
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(Icons.broken_image, size: 50),
                          )
                        : const Icon(Icons.image, size: 50),
                    title: Text(
                      entry.title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(entry.notes),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newEntry = await Navigator.push<JournalEntry>(
            context,
            MaterialPageRoute(builder: (context) => const AddEntryScreen()),
          );
          if (newEntry != null) {
            _addEntry(newEntry);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class AddEntryScreen extends StatefulWidget {
  const AddEntryScreen({super.key});

  @override
  State<AddEntryScreen> createState() => _AddEntryScreenState();
}

class _AddEntryScreenState extends State<AddEntryScreen> {
  final _titleController = TextEditingController();
  final _notesController = TextEditingController();
  final _imageUrlController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _notesController.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Travel Entry')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Location / Title',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _notesController,
              decoration: const InputDecoration(
                labelText: 'Notes',
                border: OutlineInputBorder(),
              ),
              maxLines: 4,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _imageUrlController,
              decoration: const InputDecoration(
                labelText: 'Image URL',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  if (_titleController.text.isNotEmpty) {
                    final entry = JournalEntry(
                      title: _titleController.text,
                      notes: _notesController.text,
                      imageUrl: _imageUrlController.text,
                    );
                    Navigator.pop(context, entry);
                  }
                },
                child: const Text('Save Entry'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
