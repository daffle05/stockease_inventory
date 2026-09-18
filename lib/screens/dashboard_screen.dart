import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  static const Color primaryColor = Color(0xFF16A085);
  static const Color darkTeal = Color(0xFF075E54);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Sidebar
          _buildSidebar(),

          // Main content
          Expanded(
            child: Column(
              children: [
                _buildTopBar(),

                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildStatistics(),

                        const SizedBox(height: 25),

                        _buildMainContent(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // =========================
  // SIDEBAR
  // =========================

  Widget _buildSidebar() {
    return Container(
      width: 250,
      color: darkTeal,
      child: Column(
        children: [
          // Logo
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 28,
            ),
            child: const Row(
              children: [
                Icon(
                  Icons.inventory_2_rounded,
                  color: Colors.white,
                  size: 30,
                ),
                SizedBox(width: 12),
                Text(
                  'StockEase',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // Navigation
          _buildNavItem(
            icon: Icons.dashboard_rounded,
            title: 'Dashboard',
            active: true,
          ),

          _buildNavItem(
            icon: Icons.inventory_2_outlined,
            title: 'Products',
          ),

          _buildNavItem(
            icon: Icons.category_outlined,
            title: 'Categories',
          ),

          _buildNavItem(
            icon: Icons.swap_vert_rounded,
            title: 'Stock',
          ),

          _buildNavItem(
            icon: Icons.bar_chart_rounded,
            title: 'Reports',
          ),

          const Spacer(),

          _buildNavItem(
            icon: Icons.settings_outlined,
            title: 'Settings',
          ),

          _buildNavItem(
            icon: Icons.logout_rounded,
            title: 'Logout',
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String title,
    bool active = false,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: active ? primaryColor : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: active ? Colors.white : const Color(0xFFD8EEEB),
        ),
        title: Text(
          title,
          style: TextStyle(
            color: active ? Colors.white : const Color(0xFFD8EEEB),
            fontSize: 14,
            fontWeight: active ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        onTap: () {},
      ),
    );
  }

  // =========================
  // TOP BAR
  // =========================

  Widget _buildTopBar() {
    return Container(
      height: 90,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade200,
          ),
        ),
      ),
      child: Row(
        children: [
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dashboard',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF263238),
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Welcome back! Here is your inventory overview.',
                style: TextStyle(
                  color: Color(0xFF78909C),
                  fontSize: 13,
                ),
              ),
            ],
          ),

          const Spacer(),

          // Notification
          Stack(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications_none_rounded,
                  size: 27,
                  color: Color(0xFF455A64),
                ),
              ),

              Positioned(
                right: 7,
                top: 6,
                child: Container(
                  width: 17,
                  height: 17,
                  decoration: const BoxDecoration(
                    color: Color(0xFFE74C3C),
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Text(
                      '3',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 9,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(width: 12),

          // Avatar
          Container(
            width: 42,
            height: 42,
            decoration: const BoxDecoration(
              color: primaryColor,
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Text(
                'AD',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          const SizedBox(width: 10),

          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Admin',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 3),
              Text(
                'Administrator',
                style: TextStyle(
                  color: Color(0xFF90A4AE),
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // =========================
  // STATISTICS
  // =========================

  Widget _buildStatistics() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        int columns = 4;

        if (width < 1100) {
          columns = 2;
        }

        if (width < 650) {
          columns = 1;
        }

        return GridView.count(
          crossAxisCount: columns,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          childAspectRatio: 2.5,
          children: [
            _buildStatCard(
              title: 'Total Products',
              value: '125',
              icon: Icons.inventory_2_rounded,
              iconColor: const Color(0xFF00897B),
              backgroundColor: const Color(0xFFE0F2F1),
            ),

            _buildStatCard(
              title: 'Total Stock',
              value: '2,450',
              icon: Icons.all_inbox_rounded,
              iconColor: const Color(0xFF43A047),
              backgroundColor: const Color(0xFFE8F5E9),
            ),

            _buildStatCard(
              title: 'Low Stock',
              value: '12',
              icon: Icons.warning_amber_rounded,
              iconColor: const Color(0xFFFB8C00),
              backgroundColor: const Color(0xFFFFF3E0),
            ),

            _buildStatCard(
              title: 'Out of Stock',
              value: '5',
              icon: Icons.cancel_outlined,
              iconColor: const Color(0xFFE53935),
              backgroundColor: const Color(0xFFFFEBEE),
            ),
          ],
        );
      },
    );
  }

  Widget _buildStatCard({
    required String title,
    required String value,
    required IconData icon,
    required Color iconColor,
    required Color backgroundColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 24,
            ),
          ),

          const SizedBox(width: 16),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Color(0xFF78909C),
                  fontSize: 13,
                ),
              ),

              const SizedBox(height: 5),

              Text(
                value,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF263238),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // =========================
  // MAIN CONTENT
  // =========================

  Widget _buildMainContent() {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 900) {
          return Column(
            children: [
              _buildRecentProducts(),
              const SizedBox(height: 20),
              _buildQuickActions(),
            ],
          );
        }

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: _buildRecentProducts(),
            ),

            const SizedBox(width: 20),

            Expanded(
              child: _buildQuickActions(),
            ),
          ],
        );
      },
    );
  }

  // =========================
  // RECENT PRODUCTS
  // =========================

  Widget _buildRecentProducts() {
    final products = [
      {
        'name': 'Wireless Mouse',
        'category': 'Electronics',
        'price': '₱650',
        'stock': '45',
        'status': 'Available',
      },
      {
        'name': 'USB Keyboard',
        'category': 'Electronics',
        'price': '₱850',
        'stock': '8',
        'status': 'Low Stock',
      },
      {
        'name': 'Office Chair',
        'category': 'Furniture',
        'price': '₱3,500',
        'stock': '15',
        'status': 'Available',
      },
      {
        'name': 'Printer Ink',
        'category': 'Supplies',
        'price': '₱1,200',
        'stock': '0',
        'status': 'Out of Stock',
      },
    ];

    return _buildPanel(
      title: 'Recent Products',
      subtitle: 'Recently added inventory items',
      child: Column(
        children: [
          const SizedBox(height: 5),

          // Table header
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 10,
            ),
            color: const Color(0xFFF8FAFA),
            child: const Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    'Product',
                    style: TextStyle(
                      color: Color(0xFF78909C),
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Category',
                    style: TextStyle(
                      color: Color(0xFF78909C),
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Price',
                    style: TextStyle(
                      color: Color(0xFF78909C),
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Stock',
                    style: TextStyle(
                      color: Color(0xFF78909C),
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Status',
                    style: TextStyle(
                      color: Color(0xFF78909C),
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),

          ...products.map(
            (product) => _buildProductRow(product),
          ),
        ],
      ),
    );
  }

  Widget _buildProductRow(Map<String, String> product) {
    Color statusColor;
    Color statusBackground;

    switch (product['status']) {
      case 'Low Stock':
        statusColor = const Color(0xFFEF6C00);
        statusBackground = const Color(0xFFFFF3E0);
        break;

      case 'Out of Stock':
        statusColor = const Color(0xFFC62828);
        statusBackground = const Color(0xFFFFEBEE);
        break;

      default:
        statusColor = const Color(0xFF2E7D32);
        statusBackground = const Color(0xFFE8F5E9);
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade100,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              product['name']!,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          Expanded(
            child: Text(
              product['category']!,
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF607D8B),
              ),
            ),
          ),

          Expanded(
            child: Text(
              product['price']!,
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
          ),

          Expanded(
            child: Text(
              product['stock']!,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: statusBackground,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  product['status']!,
                  style: TextStyle(
                    color: statusColor,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // =========================
  // QUICK ACTIONS
  // =========================

  Widget _buildQuickActions() {
    return _buildPanel(
      title: 'Quick Actions',
      subtitle: 'Manage your inventory',
      child: Column(
        children: [
          const SizedBox(height: 8),

          _buildActionButton(
            icon: Icons.add_box_outlined,
            title: 'Add Product',
          ),

          _buildActionButton(
            icon: Icons.arrow_downward_rounded,
            title: 'Stock In',
          ),

          _buildActionButton(
            icon: Icons.arrow_upward_rounded,
            title: 'Stock Out',
          ),

          _buildActionButton(
            icon: Icons.description_outlined,
            title: 'Generate Report',
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String title,
  }) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 14,
          ),
          alignment: Alignment.centerLeft,
          side: BorderSide(
            color: Colors.grey.shade200,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: primaryColor,
              size: 20,
            ),

            const SizedBox(width: 12),

            Text(
              title,
              style: const TextStyle(
                color: Color(0xFF37474F),
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // =========================
  // PANEL
  // =========================

  Widget _buildPanel({
    required String title,
    required String subtitle,
    required Widget child,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF263238),
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: Color(0xFF90A4AE),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),

              const Spacer(),

              if (title == 'Recent Products')
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'View All',
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
            ],
          ),

          const SizedBox(height: 15),

          child,
        ],
      ),
    );
  }
}