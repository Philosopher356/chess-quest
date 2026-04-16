import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_typography.dart';
import '../../../../core/utils/sound_manager.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late bool _soundEnabled;
  late bool _musicEnabled;

  @override
  void initState() {
    super.initState();
    _soundEnabled = SoundManager().soundEnabled;
    _musicEnabled = SoundManager().musicEnabled;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _SettingsSection(
            title: 'Sound',
            children: [
              _SettingsToggle(
                title: 'Sound Effects',
                subtitle: 'Move sounds, captures, and more',
                value: _soundEnabled,
                onChanged: (v) {
                  setState(() => _soundEnabled = v);
                  SoundManager().setSoundEnabled(v);
                },
              ),
              _SettingsToggle(
                title: 'Background Music',
                subtitle: 'Medieval ambient music',
                value: _musicEnabled,
                onChanged: (v) {
                  setState(() => _musicEnabled = v);
                  SoundManager().setMusicEnabled(v);
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
          _SettingsSection(
            title: 'Board',
            children: [
              _SettingsToggle(
                title: 'Show Coordinates',
                subtitle: 'Display rank and file labels',
                value: true,
                onChanged: (v) {
                  // TODO: Implement setting
                },
              ),
              _SettingsToggle(
                title: 'Show Legal Moves',
                subtitle: 'Highlight valid moves when selecting a piece',
                value: true,
                onChanged: (v) {
                  // TODO: Implement setting
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
          _SettingsSection(
            title: 'Notifications',
            children: [
              _SettingsToggle(
                title: 'Daily Reminder',
                subtitle: 'Remind to complete daily challenge',
                value: false,
                onChanged: (v) {
                  // TODO: Implement setting
                },
              ),
              _SettingsToggle(
                title: 'Streak Warning',
                subtitle: "Alert when you're about to lose your streak",
                value: true,
                onChanged: (v) {
                  // TODO: Implement setting
                },
              ),
            ],
          ),
          const SizedBox(height: 24),
          Center(
            child: Text(
              'ChessQuest v1.0.0',
              style: AppTypography.caption,
            ),
          ),
        ],
      ),
    );
  }
}

class _SettingsSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _SettingsSection({required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 8),
          child: Text(title, style: AppTypography.heading3),
        ),
        Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Column(children: children),
        ),
      ],
    );
  }
}

class _SettingsToggle extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  const _SettingsToggle({
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(title, style: AppTypography.body),
      subtitle: Text(subtitle, style: AppTypography.caption),
      value: value,
      activeTrackColor: AppColors.primary,
      onChanged: onChanged,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    );
  }
}
