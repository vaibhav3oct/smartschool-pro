import 'package:flutter/material.dart';

class SuperAdminDashboard extends StatelessWidget {
  const SuperAdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Super Admin Dashboard'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'SmartSchool Pro Overview',
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 20),
              GridView.count(
                shrinkWrap: true,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                crossAxisCount: 4,
                childAspectRatio: 1.7,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  _StatCard(
                    title: 'Schools',
                    value: '42',
                    color: Color(0xFF2EC4B6),
                  ),
                  _StatCard(
                    title: 'Students',
                    value: '24.8K',
                    color: Color(0xFF5B8DEF),
                  ),
                  _StatCard(
                    title: 'Teachers',
                    value: '1.9K',
                    color: Color(0xFF7A5CFA),
                  ),
                  _StatCard(
                    title: 'Revenue',
                    value: '₹12.4L',
                    color: Color(0xFFFC9F5B),
                  ),
                ],
              ),
              const SizedBox(height: 28),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Latest school onboarding',
                              style: theme.textTheme.titleLarge,
                            ),
                            const SizedBox(height: 16),
                            _buildTable(),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'System health',
                              style: theme.textTheme.titleLarge,
                            ),
                            const SizedBox(height: 16),
                            const _HealthMetric(label: 'Firebase', value: '99.9%'),
                            const _HealthMetric(label: 'API latency', value: '210ms'),
                            const _HealthMetric(label: 'Crash-free', value: '99.4%'),
                            const _HealthMetric(label: 'Active schools', value: '91%'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTable() {
    final rows = [
      ['Apex Academy', 'Delhi', 'Active', '₹24,500'],
      ['Green Valley', 'Pune', 'Trials', '₹12,900'],
      ['City Prep', 'Bengaluru', 'Active', '₹38,400'],
      ['Riverside', 'Jaipur', 'Pending', '₹0'],
    ];

    return Table(
      columnWidths: const {
        0: FlexColumnWidth(2.2),
        1: FlexColumnWidth(1.5),
        2: FlexColumnWidth(1.2),
        3: FlexColumnWidth(1.5),
      },
      border: TableBorder.all(color: Colors.grey.shade200),
      children: [
        const TableRow(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'School',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'Location',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'Status',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'MRR',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
        ...rows.map(
          (row) => TableRow(
            children: row
                .map(
                  (cell) => Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(cell),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.title,
    required this.value,
    required this.color,
  });

  final String title;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color.withOpacity(0.08),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              value,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HealthMetric extends StatelessWidget {
  const _HealthMetric({
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
