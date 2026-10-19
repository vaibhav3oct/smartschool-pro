import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_constants.dart';
import '../../auth/presentation/screens/login_screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: const LinearGradient(
                  colors: [Color(0xFF102A43), Color(0xFF2D5B8A)],
                ),
              ),
              child: const Center(
                child: Icon(Icons.school_rounded, color: Colors.white),
              ),
            ),
            const SizedBox(width: 12),
            const Text('SmartSchool Pro'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text('Features'),
          ),
          TextButton(
            onPressed: () {},
            child: const Text('AI'),
          ),
          TextButton(
            onPressed: () {},
            child: const Text('Pricing'),
          ),
          TextButton(
            onPressed: () {},
            child: const Text('FAQ'),
          ),
          const SizedBox(width: 12),
          ElevatedButton(
            onPressed: () => context.go('/login'),
            child: const Text('Book Demo'),
          ),
          const SizedBox(width: 12),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF2EC4B6).withOpacity(0.12),
                            borderRadius: BorderRadius.circular(999),
                          ),
                          child: const Text(
                            '14-day free trial available',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF1F6B63),
                            ),
                          ),
                        ),
                        const SizedBox(height: 18),
                        Text(
                          'Run your entire school from one powerful platform.',
                          style: theme.textTheme.displayMedium?.copyWith(
                            fontWeight: FontWeight.w800,
                            height: 1.05,
                          ),
                        ),
                        const SizedBox(height: 18),
                        Text(
                          'SmartSchool Pro helps schools, colleges, and education groups manage admissions, attendance, LMS, exams, fees, communications, and AI-powered insights from a single dashboard.',
                          style: theme.textTheme.bodyLarge?.copyWith(
                            color: Colors.grey.shade700,
                            height: 1.6,
                          ),
                        ),
                        const SizedBox(height: 24),
                        Wrap(
                          spacing: 12,
                          runSpacing: 12,
                          children: [
                            ElevatedButton(
                              onPressed: () => context.go('/login'),
                              child: const Text('Get Started'),
                            ),
                            OutlinedButton(
                              onPressed: () => context.go('/login'),
                              child: const Text('View Demo'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 28),
                        Row(
                          children: const [
                            _TrustMetric(label: '2.5K+', value: 'Schools'),
                            SizedBox(width: 24),
                            _TrustMetric(label: '96.4%', value: 'Retention'),
                            SizedBox(width: 24),
                            _TrustMetric(label: '24/7', value: 'Support'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: Container(
                      height: 560,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(26),
                        gradient: const LinearGradient(
                          colors: [Color(0xFF102A43), Color(0xFF2D5B8A)],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            blurRadius: 30,
                            offset: const Offset(0, 20),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(28),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: const [
                                _StatusPill(label: 'Live analytics'),
                                SizedBox(width: 10),
                                _StatusPill(label: 'AI insights'),
                              ],
                            ),
                            const SizedBox(height: 24),
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.12),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'School Overview',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const SizedBox(height: 22),
                                    Row(
                                      children: const [
                                        _MetricTile(label: 'Students', value: '18,264'),
                                        SizedBox(width: 12),
                                        _MetricTile(label: 'Teachers', value: '1,280'),
                                      ],
                                    ),
                                    const SizedBox(height: 12),
                                    Row(
                                      children: const [
                                        _MetricTile(label: 'Attendance', value: '96.4%'),
                                        SizedBox(width: 12),
                                        _MetricTile(label: 'Fees', value: '₹8.9L'),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.08),
                                          borderRadius: BorderRadius.circular(16),
                                        ),
                                        child: const Center(
                                          child: Icon(
                                            Icons.bar_chart_rounded,
                                            size: 120,
                                            color: Colors.white70,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),
            _SectionTitle(title: 'Everything your school needs'),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 4,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 1.1,
                children: const [
                  _FeatureCard(
                    icon: Icons.groups_rounded,
                    title: 'Admissions',
                    description: 'Track applications, enrollments, and student lifecycles.',
                  ),
                  _FeatureCard(
                    icon: Icons.school_rounded,
                    title: 'Academics',
                    description: 'Classes, timetable, subjects, LMS, and assessments.',
                  ),
                  _FeatureCard(
                    icon: Icons.receipt_long_rounded,
                    title: 'Fees',
                    description: 'Invoices, online payments, reminders, and receipts.',
                  ),
                  _FeatureCard(
                    icon: Icons.smart_toy_rounded,
                    title: 'AI Smart School',
                    description: 'Predict performance, generate reports, and auto-plan.',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 52),
            _SectionTitle(title: 'Role-based access for every stakeholder'),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Wrap(
                spacing: 12,
                runSpacing: 12,
                children: const [
                  _RoleBadge(label: 'Super Admin'),
                  _RoleBadge(label: 'School Admin'),
                  _RoleBadge(label: 'Principal'),
                  _RoleBadge(label: 'Teacher'),
                  _RoleBadge(label: 'Student'),
                  _RoleBadge(label: 'Parent'),
                  _RoleBadge(label: 'Accountant'),
                  _RoleBadge(label: 'Library'),
                  _RoleBadge(label: 'Transport'),
                  _RoleBadge(label: 'Hostel'),
                ],
              ),
            ),

            const SizedBox(height: 52),
            _SectionTitle(title: 'Simple pricing for every growth stage'),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 4,
                crossAxisSpacing: 18,
                mainAxisSpacing: 18,
                childAspectRatio: 0.93,
                children: const [
                  _PricingCard(
                    plan: 'Starter',
                    monthly: '₹999',
                    yearly: '₹9,990',
                    description: 'For small schools and growing teams.',
                    features: ['Up to 250 students', 'Core admin dashboard', 'Attendance + fees', 'Email support'],
                  ),
                  _PricingCard(
                    plan: 'Growth',
                    monthly: '₹2,499',
                    yearly: '₹24,990',
                    description: 'For schools needing deeper automation.',
                    features: ['Everything in Starter', 'LMS + reports', 'Advanced analytics', 'Priority support'],
                    featured: true,
                  ),
                  _PricingCard(
                    plan: 'Premium',
                    monthly: '₹4,999',
                    yearly: '₹49,990',
                    description: 'Full institutional visibility and AI tools.',
                    features: ['Everything in Growth', 'AI automation', 'Custom workflows', 'Dedicated onboarding'],
                  ),
                  _PricingCard(
                    plan: 'Enterprise',
                    monthly: 'Custom',
                    yearly: 'Custom',
                    description: 'Tailored for large multi-campus ecosystems.',
                    features: ['Custom architecture', 'SSO + integrations', 'Data migration', 'SLAs available'],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 52),
            _SectionTitle(title: 'Loved by educators'),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 1.6,
                children: const [
                  _TestimonialCard(
                    name: 'Rhea Kapoor',
                    role: 'Principal, Apex Academy',
                    text: 'SmartSchool Pro saved our staff days every week. The attendance and fee workflows are now almost fully automated.',
                  ),
                  _TestimonialCard(
                    name: 'Nitin Sharma',
                    role: 'School Admin, Green Valley',
                    text: 'The UI feels premium, and the multi-role access is exactly what we needed for a growing school network.',
                  ),
                  _TestimonialCard(
                    name: 'Sana Rizvi',
                    role: 'Academic Director',
                    text: 'The AI insights and LMS module gave our teachers better visibility into student performance and risk alerts.',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 52),
            _SectionTitle(title: 'Frequently asked questions'),
            const SizedBox(height: 24),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: [
                  _FaqItem(
                    question: 'Does SmartSchool Pro support multi-school management?',
                    answer: 'Yes. The platform is designed for multi-tenancy with school-scoped access and role-based permissions.',
                  ),
                  _FaqItem(
                    question: 'Can I use AI features securely?',
                    answer: 'Yes. AI features are routed through secure Firebase Cloud Functions and never directly from the client app.',
                  ),
                  _FaqItem(
                    question: 'Is there a free trial?',
                    answer: 'Yes. Every plan includes a 14-day free trial to help schools evaluate the platform before committing.',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 56),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFF102A43),
                  borderRadius: BorderRadius.circular(24),
                ),
                padding: const EdgeInsets.all(28),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Book a demo with our team',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'See how SmartSchool Pro fits your school operations and digital transformation goals.',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => context.go('/login'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: const Color(0xFF102A43),
                      ),
                      child: const Text('Request Demo'),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 40),
            Container(
              width: double.infinity,
              color: const Color(0xFF0C1220),
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 32),
              child: Column(
                children: [
                  Text(
                    AppConstants.footerBrand,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Code Developed by ${AppConstants.developerName}',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.75),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    AppConstants.copyrightText,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.75),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TrustMetric extends StatelessWidget {
  const _TrustMetric({
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w800,
          ),
        ),
        Text(value),
      ],
    );
  }
}

class _StatusPill extends StatelessWidget {
  const _StatusPill({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.12),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _MetricTile extends StatelessWidget {
  const _MetricTile({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.08),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
        fontWeight: FontWeight.w800,
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  const _FeatureCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  final IconData icon;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: const Color(0xFF2D5B8A).withOpacity(0.12),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(icon, color: const Color(0xFF102A43)),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              description,
              style: TextStyle(
                color: Colors.grey.shade700,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RoleBadge extends StatelessWidget {
  const _RoleBadge({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        color: const Color(0xFF2EC4B6).withOpacity(0.1),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontWeight: FontWeight.w700,
          color: Color(0xFF102A43),
        ),
      ),
    );
  }
}

class _PricingCard extends StatelessWidget {
  const _PricingCard({
    required this.plan,
    required this.monthly,
    required this.yearly,
    required this.description,
    required this.features,
    this.featured = false,
  });

  final String plan;
  final String monthly;
  final String yearly;
  final String description;
  final List<String> features;
  final bool featured;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: featured ? const Color(0xFF102A43) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: featured ? Colors.transparent : Colors.grey.shade200,
        ),
        boxShadow: featured
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ]
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            plan,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: featured ? Colors.white : const Color(0xFF102A43),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            monthly,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w900,
              color: featured ? Colors.white : const Color(0xFF102A43),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '/ month or $yearly / year',
            style: TextStyle(
              color: featured ? Colors.white70 : Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 14),
          Text(
            description,
            style: TextStyle(
              color: featured ? Colors.white70 : Colors.grey.shade700,
            ),
          ),
          const SizedBox(height: 18),
          ...features.map(
            (feature) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  Icon(
                    Icons.check_circle_rounded,
                    size: 18,
                    color: featured ? Colors.white : const Color(0xFF2AA876),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      feature,
                      style: TextStyle(
                        color: featured ? Colors.white : Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TestimonialCard extends StatelessWidget {
  const _TestimonialCard({
    required this.name,
    required this.role,
    required this.text,
  });

  final String name;
  final String role;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.format_quote_rounded, size: 34, color: Color(0xFF2EC4B6)),
            const SizedBox(height: 18),
            Text(text, style: TextStyle(color: Colors.grey.shade700, height: 1.6)),
            const SizedBox(height: 22),
            Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.w800),
            ),
            Text(
              role,
              style: TextStyle(color: Colors.grey.shade600),
            ),
          ],
        ),
      ),
    );
  }
}

class _FaqItem extends StatelessWidget {
  const _FaqItem({required this.question, required this.answer});

  final String question;
  final String answer;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: const TextStyle(fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 8),
          Text(
            answer,
            style: TextStyle(color: Colors.grey.shade700, height: 1.6),
          ),
        ],
      ),
    );
  }
}
