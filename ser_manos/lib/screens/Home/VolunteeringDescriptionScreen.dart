import 'package:beamer/beamer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ser_manos/design_system/atoms/icons/icons.dart';
import 'package:ser_manos/design_system/molecules/buttons/Cta_button.dart';
import 'package:ser_manos/design_system/molecules/components/vacancies.dart';
import 'package:ser_manos/design_system/tokens/SerManosError.dart';
import 'package:ser_manos/design_system/tokens/SerManosLoading.dart';
import 'package:ser_manos/design_system/tokens/colours/colours.dart';
import 'package:ser_manos/design_system/tokens/font/font.dart';
import 'package:ser_manos/design_system/tokens/shimmer/PictureShimmer.dart';
import 'package:ser_manos/model/User.dart';
import 'package:ser_manos/model/Volunteering.dart';
import 'package:ser_manos/providers/Future/volunteering/VolunteeringProvider.dart';
import 'package:ser_manos/providers/Notifier/Authentication/UserProvider.dart';
import 'package:ser_manos/providers/Notifier/Volunteering/Postulation.dart';
import 'package:ser_manos/providers/Providers/Providers.dart';

import '../../model/VolunteeringPostulation.dart';

class VolunteeringDescriptionScreen extends ConsumerWidget {
  final String volunteeringId;

  const VolunteeringDescriptionScreen(
      {super.key, required this.volunteeringId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final service = ref.watch(getVolunteeringByIdProvider(id: volunteeringId));
    final VolunteeringPostulation? postulation = ref.watch(postulationProvider);
    final ApplicationUser? user = ref.watch(currentUserProvider);

    return Scaffold(
        body: service.when(
            data: (volunteeringInformation) {
              if (volunteeringInformation == null) {
                return const Text("No volunteering fetched");
              }
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ColoredBox(
                      color: SermanosColors.neutral200,
                      child: SafeArea(
                        top: true,
                        bottom: false,
                        left: false,
                        right: false,
                        child: Stack(
                          children: [
                            CachedNetworkImage(
                              imageUrl: volunteeringInformation.imageUrl,
                              height: 243,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              errorWidget:
                                  (BuildContext context, String s, dynamic) {
                                return ColoredBox(
                                  color: SermanosColors.neutral0,
                                  child: Image.asset(
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                    "assets/images/notFound.png",
                                    height: 243,
                                  ),
                                );
                              },
                              placeholder: (BuildContext context, String url) {
                                return const PictureShimmer(rounded: false);
                              },
                            ),
                            Positioned.fill(
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: SermanosColors.neutral0,
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      SermanosColors.neutral200,
                                      Colors.transparent,
                                    ],
                                    stops: [0.0, 0.3555],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 0,
                              left: 0,
                              child: IconButton(
                                padding: const EdgeInsets.all(16),
                                onPressed: () => context.beamBack(),
                                icon: SermanosIcons.back(
                                    status: SermanosIconStatus.back),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 24, 16, 32),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                volunteeringInformation.category.toUpperCase(),
                                style: const SermanosTypography.overline(
                                  color: SermanosColors.neutral75,
                                ),
                              ),
                              Text(volunteeringInformation.name,
                                  style: const SermanosTypography.headline01()),
                              const SizedBox(height: 16),
                              Text(
                                volunteeringInformation.description,
                                style: const SermanosTypography.subtitle01(
                                  color: SermanosColors.secondary200,
                                ),
                              ),
                              const SizedBox(height: 24),
                              const Text(
                                "Sobre la actividad",
                                style: SermanosTypography.headline02(
                                  color: SermanosColors.neutral100,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                volunteeringInformation.about,
                                style: const SermanosTypography.body01(),
                              ),
                              const SizedBox(height: 24),
                              const Text(
                                "Participar del voluntariado",
                                style: SermanosTypography.headline02(
                                  color: SermanosColors.neutral100,
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                "Requisitos",
                                style: SermanosTypography.subtitle01(),
                              ),
                              const SizedBox(height: 8),
                              ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount:
                                    volunteeringInformation.requirements.length,
                                itemBuilder: (context, index) {
                                  return Row(
                                    children: [
                                      const Icon(
                                        Icons.circle,
                                        color: SermanosColors.neutral100,
                                        size: 5,
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        volunteeringInformation
                                            .requirements[index],
                                        style:
                                            const SermanosTypography.body01(),
                                      ),
                                    ],
                                  );
                                },
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                "Disponibilidad",
                                style: SermanosTypography.subtitle01(),
                              ),
                              const SizedBox(height: 8),
                              ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount:
                                    volunteeringInformation.availability.length,
                                itemBuilder: (context, index) {
                                  return Row(
                                    children: [
                                      const Icon(
                                        Icons.circle,
                                        color: SermanosColors.neutral100,
                                        size: 5,
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        volunteeringInformation
                                            .availability[index],
                                        style:
                                            const SermanosTypography.body01(),
                                      ),
                                    ],
                                  );
                                },
                              ),
                              const SizedBox(height: 8),
                              Vacancies(
                                vacancy: volunteeringInformation.capacity -
                                    volunteeringInformation.volunteerQuantity,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Column(
                            children: [
                              !user!.isProfileFilled()
                                  ? Column(children: [
                                      const Text(
                                        "Para postularte, debes completar tu perfil.",
                                        style: SermanosTypography.body01(
                                          color: SermanosColors.neutral100,
                                        ),
                                      ),
                                      CtaButton(
                                          text: "Completar perfil",
                                          onPressed: () => context
                                              .beamToNamed("/profile/edit"),
                                          filled: true)
                                    ])
                                  : volunteeringInformation.isFull()
                                      ? const FullVolunteering()
                                      : postulation == null
                                          ? CtaButton(
                                              text: "Postularme",
                                              onPressed: () async {
                                                ref
                                                    .read(postulationProvider
                                                        .notifier)
                                                    .addPostulation(
                                                        volunteeringInformation
                                                            .id);

                                                await ref
                                                    .read(analyticsProvider)
                                                    .logEvent(
                                                  name: "add_user_postulation",
                                                  parameters: {
                                                    "voluteering_id":
                                                        volunteeringInformation
                                                            .id,
                                                  },
                                                );
                                              },
                                              filled: true)
                                          : postulation.volunteeringId ==
                                                  int.parse(volunteeringId)
                                              ? QuitPostulation(
                                                  volunteering:
                                                      volunteeringInformation)
                                              : QuitOtherPostulation(
                                                  otherVolunteeringId:
                                                      postulation
                                                          .volunteeringId,
                                                )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
            error: (_, s) => const SerManosError(),
            loading: () => const SerManosLoading()));
  }
}

class QuitPostulation extends ConsumerWidget {
  final Volunteering volunteering;
  const QuitPostulation({
    super.key,
    required this.volunteering,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Te has postulado",
          style: SermanosTypography.headline02(
            color: SermanosColors.neutral100,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          "Pronto la organización se pondrá en contacto contigo y te inscribirá como participante.",
          style: SermanosTypography.body01(),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        CtaButton(
          text: 'Retirar postulación',
          onPressed: () async {
            ref
                .read(postulationProvider.notifier)
                .removePostulation(volunteering.id);

            await ref.read(analyticsProvider).logEvent(
              name: "remove_user_postulation",
              parameters: {
                "voluteering_id": volunteering.id,
              },
            );
          },
          textColor: SermanosColors.primary100,
          filled: false,
        ),
      ],
    );
  }
}

class QuitOtherPostulation extends ConsumerWidget {
  const QuitOtherPostulation({
    super.key,
    required this.otherVolunteeringId,
  });

  final int otherVolunteeringId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Ya estas participando en otro voluntariado, debes abandonarlo primero para postularte a este.",
          style: SermanosTypography.body01(),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        CtaButton(
          text: "Abandonar voluntariado actual",
          onPressed: () =>
              context.beamToNamed('/volunteering/$otherVolunteeringId'),
          textColor: SermanosColors.primary100,
          filled: false,
        ),
      ],
    );
  }
}

class FullVolunteering extends StatelessWidget {
  const FullVolunteering({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          "No hay vacantes disponibles para postularse",
          style: SermanosTypography.body01(),
        ),
        const SizedBox(height: 24),
        CtaButton(
          text: 'Postularme',
          enabled: false,
          filled: true,
          onPressed: () {},
        ),
      ],
    );
  }
}
