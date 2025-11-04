import 'package:flutter/material.dart';

void main() {
  runApp(const SMSApp());
}

class SMSApp extends StatelessWidget {
  const SMSApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: const Color(0xFFF7FCF9),
      ),
      home: const SMSScreen(),
    );
  }
}

class SMSScreen extends StatefulWidget {
  const SMSScreen({super.key});

  @override
  State<SMSScreen> createState() => _SMSScreenState();
}

class _SMSScreenState extends State<SMSScreen> {
  final TextEditingController _messageController = TextEditingController();
  bool _isHindiEnabled = false;
  bool _isSendNowSelected = true;
  bool _isSendLaterEnabled = false;
  bool _isSendDailySelected = false;
  bool _isTestModeEnabled = false;
  
  final List<Map<String, dynamic>> _recipients = [
    {'name': 'Rajesh Sharma', 'selected': false},
    {'name': 'Priya Verma', 'selected': false},
    {'name': 'Amit Patel', 'selected': false},
    {'name': 'Sunita Kapoor', 'selected': false},
  ];

  int get _characterCount => _messageController.text.length;

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void _addWarning() {
    _messageController.text += ' ⚠️ Warning: ';
    setState(() {});
  }

  void _addMedicine() {
    _messageController.text += ' 💊 Medicine: ';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7FCF9),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: ListView(
                children: [
                  _buildInfoBanner(),
                  _buildPhonePreview(),
                  _buildMessageEditor(),
                  _buildCharacterCount(),
                  _buildQuickAddButtons(),
                  _buildLanguageToggle(),
                  _buildRecipientSection(),
                  _buildSMSCostInfo(),
                  _buildTemplateOption(),
                  _buildSendOptions(),
                  _buildBottomButtons(),
                ],
              ),
            ),
            _buildNavigationBar(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 8),
      decoration: const BoxDecoration(color: Color(0xFFF7FCF9)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back, color: Color(0xFF0C1C11), size: 24),
          ),
          const Expanded(
            child: Text(
              'Send SMS to Family',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF0C1C11),
                fontSize: 18,
                fontFamily: 'Plus Jakarta Sans',
                fontWeight: FontWeight.w700,
                height: 1.28,
              ),
            ),
          ),
          const SizedBox(width: 48),
        ],
      ),
    );
  }

  Widget _buildInfoBanner() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(color: Color(0xFFF7FCF9)),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: ShapeDecoration(
              color: const Color(0xFFE8F2ED),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            child: const Icon(Icons.info_outline, color: Color(0xFF4C996B), size: 24),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Text(
              'This SMS will be sent to all selected recipients.',
              style: TextStyle(
                color: Color(0xFF0C1C11),
                fontSize: 16,
                fontFamily: 'Plus Jakarta Sans',
                fontWeight: FontWeight.w400,
                height: 1.50,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPhonePreview() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(color: Color(0xFFF7FCF9)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Phone Preview',
            style: TextStyle(
              color: Color(0xFF0C1C11),
              fontSize: 16,
              fontFamily: 'Plus Jakarta Sans',
              fontWeight: FontWeight.w400,
              height: 1.50,
            ),
          ),
          Icon(Icons.smartphone, color: const Color(0xFF4C996B), size: 24),
        ],
      ),
    );
  }

  Widget _buildMessageEditor() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 8),
            child: Text(
              'Edit Message',
              style: TextStyle(
                color: Color(0xFF0C1C11),
                fontSize: 16,
                fontFamily: 'Plus Jakarta Sans',
                fontWeight: FontWeight.w500,
                height: 1.50,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            constraints: const BoxConstraints(minHeight: 144),
            padding: const EdgeInsets.all(15),
            decoration: ShapeDecoration(
              color: const Color(0xFFF7FCF9),
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1, color: Color(0xFFCEE8D8)),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: TextField(
              controller: _messageController,
              maxLines: 6,
              maxLength: 160,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Type your message here...',
                hintStyle: TextStyle(color: Color(0xFF4C996B)),
                counterText: '',
              ),
              style: const TextStyle(
                color: Color(0xFF0C1C11),
                fontSize: 14,
                fontFamily: 'Plus Jakarta Sans',
              ),
              onChanged: (_) => setState(() {}),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCharacterCount() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 12),
      child: Text(
        '$_characterCount/160 characters',
        style: const TextStyle(
          color: Color(0xFF4C996B),
          fontSize: 14,
          fontFamily: 'Plus Jakarta Sans',
          fontWeight: FontWeight.w400,
          height: 1.50,
        ),
      ),
    );
  }

  Widget _buildQuickAddButtons() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          _quickAddButton('⚠️ Add Warning', _addWarning),
          const SizedBox(width: 12),
          _quickAddButton('💊 Add Medicine', _addMedicine),
        ],
      ),
    );
  }

  Widget _quickAddButton(String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 32,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: ShapeDecoration(
          color: const Color(0xFFE8F2ED),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              color: Color(0xFF0C1C11),
              fontSize: 14,
              fontFamily: 'Plus Jakarta Sans',
              fontWeight: FontWeight.w500,
              height: 1.50,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLanguageToggle() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Hindi / English',
            style: TextStyle(
              color: Color(0xFF0C1C11),
              fontSize: 16,
              fontFamily: 'Plus Jakarta Sans',
              fontWeight: FontWeight.w400,
              height: 1.50,
            ),
          ),
          _buildToggleSwitch(_isHindiEnabled, (value) {
            setState(() => _isHindiEnabled = value);
          }),
        ],
      ),
    );
  }

  Widget _buildRecipientSection() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 8),
          child: const Text(
            'Send to whom?',
            style: TextStyle(
              color: Color(0xFF0C1C11),
              fontSize: 18,
              fontFamily: 'Plus Jakarta Sans',
              fontWeight: FontWeight.w700,
              height: 1.28,
            ),
          ),
        ),
        ..._recipients.map((recipient) => _buildRecipientItem(recipient)).toList(),
      ],
    );
  }

  Widget _buildRecipientItem(Map<String, dynamic> recipient) {
    return Container(
      width: double.infinity,
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(color: Color(0xFFF7FCF9)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            recipient['name'],
            style: const TextStyle(
              color: Color(0xFF0C1C11),
              fontSize: 16,
              fontFamily: 'Plus Jakarta Sans',
              fontWeight: FontWeight.w400,
              height: 1.50,
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                recipient['selected'] = !recipient['selected'];
              });
            },
            child: Container(
              width: 20,
              height: 20,
              decoration: ShapeDecoration(
                color: recipient['selected'] ? const Color(0xFF11ED6B) : Colors.transparent,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 2,
                    color: recipient['selected'] ? const Color(0xFF11ED6B) : const Color(0xFFCEE8D8),
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              child: recipient['selected']
                  ? const Icon(Icons.check, size: 14, color: Colors.white)
                  : null,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSMSCostInfo() {
    return Container(
      width: double.infinity,
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'SMS Cost: Free',
            style: TextStyle(
              color: Color(0xFF0C1C11),
              fontSize: 16,
              fontFamily: 'Plus Jakarta Sans',
              fontWeight: FontWeight.w400,
              height: 1.50,
            ),
          ),
          const Icon(Icons.check_circle, color: Color(0xFF11ED6B), size: 24),
        ],
      ),
    );
  }

  Widget _buildTemplateOption() {
    return Container(
      width: double.infinity,
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Template Options',
            style: TextStyle(
              color: Color(0xFF0C1C11),
              fontSize: 16,
              fontFamily: 'Plus Jakarta Sans',
              fontWeight: FontWeight.w400,
              height: 1.50,
            ),
          ),
          const Icon(Icons.chevron_right, color: Color(0xFF4C996B), size: 24),
        ],
      ),
    );
  }

  Widget _buildSendOptions() {
    return Column(
      children: [
        _buildOptionWithCheckbox('Send Now', _isSendNowSelected, (value) {
          setState(() => _isSendNowSelected = value);
        }),
        _buildOptionWithToggle('Send Later', _isSendLaterEnabled, (value) {
          setState(() => _isSendLaterEnabled = value);
        }),
        _buildOptionWithCheckbox('Send Daily', _isSendDailySelected, (value) {
          setState(() => _isSendDailySelected = value);
        }),
        _buildOptionWithToggle('Test Mode', _isTestModeEnabled, (value) {
          setState(() => _isTestModeEnabled = value);
        }),
      ],
    );
  }

  Widget _buildOptionWithCheckbox(String label, bool value, Function(bool) onChanged) {
    return Container(
      width: double.infinity,
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Color(0xFF0C1C11),
              fontSize: 16,
              fontFamily: 'Plus Jakarta Sans',
              fontWeight: FontWeight.w400,
              height: 1.50,
            ),
          ),
          InkWell(
            onTap: () => onChanged(!value),
            child: Container(
              width: 20,
              height: 20,
              decoration: ShapeDecoration(
                color: value ? const Color(0xFF11ED6B) : Colors.transparent,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 2,
                    color: value ? const Color(0xFF11ED6B) : const Color(0xFFCEE8D8),
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              child: value ? const Icon(Icons.check, size: 14, color: Colors.white) : null,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOptionWithToggle(String label, bool value, Function(bool) onChanged) {
    return Container(
      width: double.infinity,
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Color(0xFF0C1C11),
              fontSize: 16,
              fontFamily: 'Plus Jakarta Sans',
              fontWeight: FontWeight.w400,
              height: 1.50,
            ),
          ),
          _buildToggleSwitch(value, onChanged),
        ],
      ),
    );
  }

  Widget _buildToggleSwitch(bool value, Function(bool) onChanged) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: Container(
        width: 51,
        height: 31,
        padding: const EdgeInsets.all(2),
        decoration: ShapeDecoration(
          color: const Color(0xFFE8F2ED),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.50)),
        ),
        child: AnimatedAlign(
          alignment: value ? Alignment.centerRight : Alignment.centerLeft,
          duration: const Duration(milliseconds: 200),
          child: Container(
            width: 27,
            height: double.infinity,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13.50)),
              shadows: const [
                BoxShadow(
                  color: Color(0x26000000),
                  blurRadius: 8,
                  offset: Offset(0, 3),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomButtons() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Expanded(
            child: _buildActionButton('Send Message', const Color(0xFF11ED6B), () {
              final selectedRecipients = _recipients.where((r) => r['selected']).toList();
              if (selectedRecipients.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Please select at least one recipient')),
                );
                return;
              }
              if (_messageController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Please enter a message')),
                );
                return;
              }
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('SMS sent to ${selectedRecipients.length} recipient(s)'),
                  backgroundColor: Colors.green,
                ),
              );
            }),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _buildActionButton('Save Draft', const Color(0xFFE8F2ED), () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Draft saved successfully')),
              );
            }, textColor: const Color(0xFF0C1C11)),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(String label, Color color, VoidCallback onTap, {Color? textColor}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 48,
        decoration: ShapeDecoration(
          color: color,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        ),
        child: Center(
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColor ?? const Color(0xFF0C1C11),
              fontSize: 16,
              fontFamily: 'Plus Jakarta Sans',
              fontWeight: FontWeight.w700,
              height: 1.50,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavigationBar() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const ShapeDecoration(
        color: Color(0xFFF7FCF9),
        shape: Border(top: BorderSide(width: 1, color: Color(0xFFE8F2ED))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _navItem(Icons.home, 'Home', true),
          _navItem(Icons.history, 'History', false),
          _navItem(Icons.notifications, 'Alerts', false),
          _navItem(Icons.person, 'Profile', false),
        ],
      ),
    );
  }

  Widget _navItem(IconData icon, String label, bool isActive) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: isActive ? const Color(0xFF0C1C11) : const Color(0xFF4C996B),
          size: 24,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: isActive ? const Color(0xFF0C1C11) : const Color(0xFF4C996B),
            fontSize: 12,
            fontFamily: 'Plus Jakarta Sans',
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}