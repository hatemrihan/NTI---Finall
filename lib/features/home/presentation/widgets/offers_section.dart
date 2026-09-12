import 'package:final_project/core/theme/app_styles.dart';
import 'package:final_project/features/home/data/models/offer_model.dart';
import 'package:final_project/features/home/presentation/products_cubit/products_cubit.dart';
import 'package:final_project/features/home/presentation/products_cubit/products_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OffersSection extends StatelessWidget {
  const OffersSection({super.key});

  // Tag colors based on index for visual variety
  static const List<Color> _tagColors = [
    Color(0xFFE8A889),
    Color(0xFFC5D1C5),
    Color(0xFFD4A8C8),
    Color(0xFFF5D89A),
    Color(0xFFFF9B9B),
    Color(0xFFA8D8EA),
  ];

  static const List<Color> _tagTextColors = [
    Color(0xFF5C2D14),
    Color(0xFF294A3A),
    Color(0xFF4A1942),
    Color(0xFF5C4A1E),
    Color(0xFF7A1F1F),
    Color(0xFF1B4F72),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      buildWhen: (previous, current) =>
          current is GetOffersLoadingState ||
          current is GetOffersSuccessState ||
          current is GetOffersFailureState,
      builder: (context, state) {
        final cubit = context.read<ProductsCubit>();

        if (cubit.isOffersLoading || state is GetOffersLoadingState) {
          return const SizedBox(
            height: 200,
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (state is GetOffersFailureState && cubit.offers.isEmpty) {
          return SizedBox(
            height: 200,
            child: Center(
              child: Text(
                state.error ?? "Failed to load offers",
                style: AppStyles.style14SemiBold.copyWith(color: Colors.red),
              ),
            ),
          );
        }

        final List<OfferModel> offers =
            state is GetOffersSuccessState ? state.offers : cubit.offers;

        if (offers.isEmpty) {
          return const SizedBox(
            height: 200,
            child: Center(child: Text("No offers available")),
          );
        }

        return SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: offers.length,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              final offer = offers[index];
              return _OfferCard(
                offer: offer,
                tagColor: _tagColors[index % _tagColors.length],
                tagTextColor: _tagTextColors[index % _tagTextColors.length],
              );
            },
          ),
        );
      },
    );
  }
}

class _OfferCard extends StatelessWidget {
  const _OfferCard({
    required this.offer,
    required this.tagColor,
    required this.tagTextColor,
  });

  final OfferModel offer;
  final Color tagColor;
  final Color tagTextColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[300],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Background image
            Image.network(
              offer.imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey[400],
                  child: const Center(
                    child: Icon(
                      Icons.image_not_supported_outlined,
                      size: 40,
                      color: Colors.white54,
                    ),
                  ),
                );
              },
            ),
            // Dark gradient overlay for text readability
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.1),
                    Colors.black.withOpacity(0.6),
                  ],
                ),
              ),
            ),
            // Content
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Tag badge
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: tagColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      offer.tag,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: tagTextColor,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                  const Spacer(),
                  // Title
                  Text(
                    offer.title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 4),
                  // Subtitle
                  Text(
                    offer.subtitle,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white.withOpacity(0.85),
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
