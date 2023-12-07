// // ignore_for_file: deprecated_member_use

// import 'dart:core';

// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/basic.dart' as listen;
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:nimisar_tourism/model/place_common_model.dart';
// import 'package:nimisar_tourism/model/recrate_model.dart';

// final dragWidthProvider = StateNotifierProvider<DragWidthNotifier, double>(
//     (ref) => DragWidthNotifier());

// class DragWidthNotifier extends StateNotifier<double> {
//   DragWidthNotifier() : super(0);

//   void change(double newWidth) => state = newWidth;

//   double getWidth() => state;
// }

// class PersonalizedPlaceCard extends ConsumerStatefulWidget {
//   final PlaceModel model;

//   final bool? targetUser, isProfile;
//   final bool ignoreGesture;
//   final String? targetUserId;
//   final String? targetName;
//   final Function(bool)? onBookmarkTapped;
//   final bool? isOnDeck;
//   final bool? hideAddToOnDeck;
//   final bool? hideAddToMyArchive;

//   factory PersonalizedPlaceCard.green({
//     required PlaceModel model,
//     String? targetUserName,
//     String? targetId,
//     bool? targetUser,
//     required bool isProfile,
//     bool? isOnDeck,
//   }) {
//     return PersonalizedPlaceCard(
//       model: model,
//       isOnDeck: isOnDeck,
//       targetName: targetUserName,
//       targetUser: targetUser,
//       targetUserId: targetId,
//       isProfile: isProfile,
//     );
//   }

//   PersonalizedPlaceCard({
//     required this.model,
//     this.targetUser = false,
//     this.isProfile = false,
//     this.isOnDeck = false,
//     this.targetUserId,
//     this.targetName,
//     this.onBookmarkTapped,
//     this.ignoreGesture = false,
//     this.hideAddToMyArchive,
//     this.hideAddToOnDeck,
//   }) : super(key: ValueKey(model.id));

//   @override
//   _PersonalizedRestaurantCardState createState() =>
//       _PersonalizedRestaurantCardState();
// }

// class _PersonalizedRestaurantCardState
//     extends ConsumerState<PersonalizedPlaceCard> {
//   bool liked = false;

//   String _getTextOnState(double state) {
//     if (state.abs() < 100) return '';
//     bool negativeDirection = (state < 0);
//     if (state.abs() < 200) {
//       return negativeDirection
//           ? convertToString(Rating.MEH)
//           : convertToString(Rating.LIKED_IT);
//     }
//     return negativeDirection
//         ? convertToString(Rating.HATED_IT)
//         : convertToString(Rating.LOVED_IT);
//   }

//   @override
//   Widget build(BuildContext context) {
//     double startingDragPointX = 0.0;

//     return Padding(
//       padding: EdgeInsets.only(bottom: widget.targetUser! ? 10 : 0.0),
//       child: (widget.targetUser! || widget.ignoreGesture)
//           ? GestureDetector(
//               onTap: () {
//                 //TODO: Implement Place Details
//                 // PlacesDetailsPage.show(
//                 //     context,
//                 //     widget.model.id,
//                 //     widget.model.type,
//                 //     widget.model,
//                 //     0,
//                 //     widget.targetUser,
//                 //     widget.targetUserId,
//                 //     widget.targetName);
//               },
//               child: _buildPlaceCard(true))
//           : listen.Listener(
//               onPointerMove: (event) {
//                 final double d = (event.position.dx - startingDragPointX);
//                 ref.read(dragWidthProvider.notifier).change(d);
//               },
//               onPointerDown: (event) {
//                 startingDragPointX = event.position.dx;
//               },
//               child: GestureDetector(
//                 onTap: () {
//                   //TODO: Implement Place Details
//                   // PlacesDetailsPage.show(
//                   //     context,
//                   //     widget.model.id,
//                   //     widget.model.type,
//                   //     widget.model,
//                   //     0,
//                   //     widget.targetUser,
//                   //     widget.targetUserId,
//                   //     widget.targetName);
//                 },
//                 child: Padding(
//                   padding: const EdgeInsets.only(bottom: 20.0),
//                   child: _buildPlaceCard(false),
//                 ),
//               ),
//             ),
//     );
//   }

//   Widget _buildPlaceCard(bool ignoreGestures) {
//     return Stack(
//       children: [
//         Positioned(
//           top: 0,
//           bottom: 0,
//           left: 0,
//           right: 0,
//           child: Container(
//             decoration: BoxDecoration(
//               border: Border.all(color: Colors.transparent),
//               borderRadius: BorderRadius.circular(9),
//             ),
//           ),
//         ),
//         const SizedBox(),
//         Column(
//           children: [
//             widget.model.sharedBys!.isNotEmpty
//                 ? Container(
//                     height: 29,
//                     padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
//                     margin: const EdgeInsets.only(bottom: 4),
//                     width: MediaQuery.of(context).size.width,
//                     decoration: const BoxDecoration(
//                       borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(8.0),
//                           topRight: Radius.circular(8.0)),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Expanded(
//                           child: Text(
//                             "Recommended by ${widget.model.sharedBys![0].username}${widget.model.sharedBys!.length > 1 ? " and ${widget.model.sharedBys!.length - 1} others" : ""}",
//                           ),
//                         ),
//                       ],
//                     ),
//                   )
//                 : const SizedBox(height: 10),
//             CardHeaderWidget(
//                 isOnDeck: widget.isOnDeck,
//                 ratingTextColor: widget.ratingTextColor,
//                 bubbleRatingColor: widget.bubbleRatingBackgroundColor,
//                 model: widget.model,
//                 titleColor: widget.titleColor,
//                 subtitleColor: widget.subtitleColor,
//                 iconContainerColor: widget.iconContainerColor,
//                 iconColor: widget.iconColor,
//                 userId: widget.targetUserId,
//                 isTarget: widget.targetUser,
//                 targetUserId: widget.targetUserId,
//                 targetUsername: widget.targetName,
//                 onBookmarkTapped: widget.onBookmarkTapped,
//                 onMoreTap: widget.onMoreTap ??
//                     () {
//                       TargetUserMoreAction.show(
//                           context: context,
//                           hideAddToMyArchive: widget.hideAddToMyArchive,
//                           hideAddToOnDeck: widget.hideAddToOnDeck,
//                           item: RecommendableInput(
//                             itemID: widget.model.id,
//                             typeOf: widget.model.type,
//                           ),
//                           onTapRateOrReview: () {
//                             CreateReviewScreen.show(
//                               context,
//                               input: RecommendableInput(
//                                 itemID: widget.model.id,
//                                 typeOf: widget.model.type,
//                               ),
//                               posterImageUrl: widget.model.imageUrl,
//                               posterTitle: widget.model.title,
//                               autofocus: true,
//                             ).then(
//                               (value) {
//                                 ref.invalidate(recsProvider);
//                                 ref.invalidate(totalRecCountProvider);
//                                 ref.invalidate(
//                                     generalRatingProvider(widget.model.id!));
//                                 ref.invalidate(
//                                     getRecByIdProvider(widget.model.id!));
//                               },
//                             );
//                           });
//                     }),
//             if (widget.targetUser!)
//               const SizedBox(height: 20)
//             else ...[
//               Container(
//                 margin: const EdgeInsets.only(top: 16),
//                 height: 1,
//                 color: AppColors.accent0,
//               ),
//               IgnorePointer(
//                 ignoring: ignoreGestures,
//                 child: CardHeartsRow(
//                   model: widget.model,
//                 ),
//               ),
//             ]
//           ],
//         ),
//       ],
//     );
//   }
// }

// class CardHeaderWidget extends ConsumerStatefulWidget {
//   final PlaceModel model;

//   final Color titleColor;
//   final Color subtitleColor;
//   final Color iconContainerColor;
//   final Color iconColor;
//   final ActionTapped? onMoreTap;
//   final Color bubbleRatingColor;
//   final Color ratingTextColor;
//   final String? userId;
//   final String? targetUsername;
//   final String? targetUserId;
//   final bool? isTarget;
//   final Function(bool)? onBookmarkTapped;
//   final bool? isOnDeck;

//   const CardHeaderWidget({
//     super.key,
//     required this.bubbleRatingColor,
//     required this.model,
//     required this.titleColor,
//     required this.subtitleColor,
//     required this.iconContainerColor,
//     required this.iconColor,
//     required this.onMoreTap,
//     required this.ratingTextColor,
//     required this.userId,
//     this.targetUserId,
//     this.targetUsername,
//     required this.onBookmarkTapped,
//     this.isTarget = false,
//     this.isOnDeck,
//   });

//   @override
//   _CardHeaderWidgetState createState() => _CardHeaderWidgetState();
// }

// class _CardHeaderWidgetState extends ConsumerState<CardHeaderWidget> {
//   @override
//   Widget build(BuildContext context) {
//     final contentData = ref.watch(
//       placeProvider(
//         RecommendableInput(
//           itemID: widget.model.id,
//           typeOf: widget.model.type,
//         ),
//       ),
//     );
//     return Padding(
//       padding: const EdgeInsets.only(
//         left: 16.0,
//         right: 10,
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(
//             width: 80,
//             height: 120,
//             child: Stack(
//               clipBehavior: Clip.none,
//               children: [
//                 MoviePoster(
//                   url: widget.model.imageUrl,
//                   borderWidth: 1.5,
//                 ),
//                 Positioned(
//                   bottom: -10,
//                   child: GestureDetector(
//                     onTap: () async {
//                       if (await canLaunch(
//                           Uri.encodeFull(widget.model.googleMapUrl!))) {
//                         await launch(
//                             Uri.encodeFull(widget.model.googleMapUrl!));
//                       } else {
//                         Snackbars.showInfoSnackBar(
//                             context, "Failed to launch map.");
//                       }
//                     },
//                     child: CircleAvatar(
//                       backgroundColor: widget.iconContainerColor,
//                       child: Icon(Icons.location_on, color: widget.iconColor),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.only(left: 10),
//               child: Column(
//                 children: [
//                   SizedBox(height: widget.isTarget! ? 40 : 15),
//                   Align(
//                     alignment: Alignment.centerLeft,
//                     child: Text(
//                       widget.model.title?.toUpperCase() ?? "",
//                       style: AppTextStyles.movieCardTitle.copyWith(
//                         color: widget.titleColor,
//                       ),
//                     ),
//                   ),
//                   Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text(widget.model.address?.addressLine1 ?? '',
//                           style: AppTextStyles.discoverCardRatings.copyWith(
//                             color: widget.subtitleColor,
//                           ))),
//                   Spacing.vertical(15),
//                   Align(
//                     alignment: Alignment.centerLeft,
//                     child: FittedBox(
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           RecSpotRating(
//                               isTarget: widget.isTarget,
//                               input: RecommendableInput(
//                                   itemID: widget.model.id,
//                                   typeOf: widget.model.type),
//                               bgColor: widget.bubbleRatingColor,
//                               textColor: widget.ratingTextColor,
//                               targetUserId: widget.targetUserId,
//                               targetUserName: widget.targetUsername),
//                           const SizedBox(width: 10),
//                           Container(
//                             height: 28,
//                             padding: const EdgeInsets.symmetric(horizontal: 10),
//                             decoration: BoxDecoration(
//                                 color: widget.bubbleRatingColor,
//                                 borderRadius: BorderRadius.circular(6.0)),
//                             child: Center(
//                               child: contentData.when(
//                                   data: (content) => Text(
//                                       "Google  ${content.googleMapRating!.toStringAsPrecision(2)}",
//                                       style: TextStyle(
//                                           color: widget.ratingTextColor,
//                                           fontFamily: "Syne")),
//                                   error: (_, __) => Text('0',
//                                       style: TextStyle(
//                                           color: widget.ratingTextColor,
//                                           fontFamily: "Syne")),
//                                   loading: () => Text('0',
//                                       style: TextStyle(
//                                           color: widget.ratingTextColor,
//                                           fontFamily: "Syne"))),
//                             ),
//                           ),
//                           const SizedBox(width: 10),
//                           InkWell(
//                             onTap: () async {
//                               if (await canLaunch(
//                                   Uri.encodeFull(widget.model.website!))) {
//                                 await launch(
//                                     Uri.encodeFull(widget.model.website!));
//                               } else {
//                                 Snackbars.showInfoSnackBar(
//                                     context, "Failed to launch website url.");
//                               }
//                             },
//                             child: Container(
//                               height: 28,
//                               padding:
//                                   const EdgeInsets.symmetric(horizontal: 10),
//                               decoration: BoxDecoration(
//                                   color: widget.bubbleRatingColor,
//                                   borderRadius: BorderRadius.circular(6.0)),
//                               child: Center(
//                                 child: Text(
//                                   "Website",
//                                   style: TextStyle(
//                                     color: widget.ratingTextColor,
//                                     fontFamily: "Syne",
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Column(
//             children: [
//               SizedBox(height: widget.isTarget! ? 30 : 5),
//               Row(
//                 children: [
//                   if (!widget.isTarget!)
//                     ShareButton(
//                       place: widget.model,
//                     ),
//                   const SizedBox(width: 5),
//                   if (!widget.isTarget!)
//                     SizedBox(
//                       width: 30,
//                       height: 30,
//                       child: MovieBookmark(
//                         input: RecommendableInput(
//                           itemID: widget.model.id,
//                           typeOf: widget.model.type,
//                         ),
//                         hasUserBookmarked: widget.model.hasUserBookmarked,
//                         onBookmarkTapped: widget.onBookmarkTapped,
//                       ),
//                     ),
//                   SizedBox(
//                     width: 30,
//                     height: 30,
//                     child: RotatedBox(
//                       quarterTurns: !widget.isTarget! ? 0 : 1,
//                       child: PlacesMoreButton(
//                         model: widget.model,
//                         onMoreTap: widget.onMoreTap,
//                         isOnDeck: widget.isOnDeck,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// class PlacesMoreButton extends StatelessWidget {
//   final ActionTapped? onMoreTap;
//   final PlaceModel? model;
//   final bool? isOnDeck;

//   const PlacesMoreButton({Key? key, this.onMoreTap, this.model, this.isOnDeck})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
//         padding: const EdgeInsets.all(0),
//         icon: SvgPicture.asset('assets/more.svg',
//             color: AppColors.accent4, width: 15),
//         onPressed: () {
//           if (onMoreTap == null) {
//             PlacesMoreActions.show(
//               context: context,
//               title: model!.title,
//               imageUrl: model!.imageUrl,
//               isOnDeck: isOnDeck,
//               input: RecommendableInput(
//                 itemID: model!.id,
//                 typeOf: model!.type,
//               ),
//             );
//           } else {
//             onMoreTap!.call();
//           }
//         });
//   }
// }

// class CardHeartsRow extends ConsumerWidget {
//   const CardHeartsRow({Key? key, required this.model, this.targetUserId})
//       : super(key: key);

//   final PlaceModel model;
//   final String? targetUserId;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final AsyncValue<Rating> p = ref.watch(getRecByIdProvider(model.id!));
//     SvgPicture leftHeart = negativeRatingIcon;
//     SvgPicture rightHeart = positiveRatingIcon;
//     String liked =
//         model.friendsLikedCount == 0 ? "" : model.friendsLikedCount.toString();
//     String disliked = model.friendsDislikedCount == 0
//         ? ""
//         : model.friendsDislikedCount.toString();
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 8.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           InkWell(
//             onTap: () {
//               final userId = api!.session!.userId;
//               makeRec(
//                 userID: userId,
//                 itemID: model.id,
//                 rate: RecRateModel(rating: Rating.MEH),
//                 type: model.type!,
//               ).then((value) {
//                 ref.invalidate(generalRatingProvider(model.id!));
//                 ref.invalidate(getRecByIdProvider(model.id!));
//               });
//             },
//             child: SizedBox(
//               width: 30,
//               height: 28,
//               child: p.when(
//                   loading: () => leftHeart,
//                   error: (er, st) => leftHeart,
//                   data: (value) {
//                     if (value == Rating.MEH || value == Rating.HATED_IT) {
//                       leftHeart = negativeRatingFullIcon;
//                     }
//                     return leftHeart;
//                   }),
//             ),
//           ),
//           Text(disliked,
//               style:
//                   AppTextStyles.likesDesc.copyWith(color: AppColors.accent4)),
//           Spacing.horizontal(20),
//           SizedBox(
//             width: 45,
//             height: 65,
//             child: Stack(
//               alignment: Alignment.center,
//               clipBehavior: Clip.none,
//               children: model.mostRecentFriendsDisliked!.map(
//                 (e) {
//                   return Positioned(
//                     right: 14 *
//                         model.mostRecentFriendsDisliked!.indexOf(e).toDouble(),
//                     top: 0,
//                     bottom: 0,
//                     child: UserPicture(
//                       userImage: e.avatarImageUrl,
//                       radius: 18,
//                     ),
//                   );
//                 },
//               ).toList(),
//             ),
//           ),
//           Center(
//             child: Container(width: 1, height: 38, color: AppColors.accent2),
//           ),
//           SizedBox(
//             width: 45,
//             height: 65,
//             child: Stack(
//                 alignment: Alignment.center,
//                 clipBehavior: Clip.none,
//                 children: model.mostRecentFriendsLiked!.map(
//                   (e) {
//                     return Positioned(
//                       left: 14 *
//                           model.mostRecentFriendsLiked!.indexOf(e).toDouble(),
//                       top: 0,
//                       bottom: 0,
//                       child: UserPicture(
//                         userImage: e.avatarImageUrl,
//                         radius: 18,
//                       ),
//                     );
//                   },
//                 ).toList()),
//           ),
//           Spacing.horizontal(25),
//           Text(liked,
//               style:
//                   AppTextStyles.likesDesc.copyWith(color: AppColors.accent4)),
//           InkWell(
//             onTap: () {
//               final userId = api!.session!.userId;
//               makeRec(
//                       userID: userId,
//                       itemID: model.id,
//                       rate: RecRateModel(rating: Rating.LIKED_IT),
//                       type: model.type!)
//                   .then((value) {
//                 ref.invalidate(generalRatingProvider(model.id!));
//                 ref.invalidate(getRecByIdProvider(model.id!));
//               });
//             },
//             child: Container(
//               child: p.when(
//                   loading: () => rightHeart,
//                   error: (er, st) => rightHeart,
//                   data: (value) {
//                     if (value == Rating.LIKED_IT || value == Rating.LOVED_IT) {
//                       rightHeart = positiveRatingFullIcon;
//                     }

//                     return rightHeart;
//                   }),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class RatingInfo extends StatelessWidget {
//   final Widget image;
//   final String text;

//   const RatingInfo({Key? key, required this.image, required this.text})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 25,
//       width: 70,
//       decoration: BoxDecoration(
//         color: AppColors.movieCardInfoRottenTomato,
//         border: Border.all(
//           color: AppColors.movieCardInfoRottenTomato,
//         ),
//         borderRadius: const BorderRadius.all(Radius.circular(6)),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(4.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             image,
//             const SizedBox(width: 7),
//             Text(
//               text,
//               style: AppTextStyles.discoverCardRatings,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class TargetUserRatingBar extends StatelessWidget {
//   final String? targetName;
//   final String? targetId;
//   final bool isTarget;
//   final String? movieId;
//   final Color? backgroundColor;

//   const TargetUserRatingBar(
//       {Key? key,
//       this.targetName,
//       this.targetId,
//       this.movieId,
//       this.isTarget = false,
//       this.backgroundColor})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 40,
//       decoration: BoxDecoration(
//         color: backgroundColor ?? const Color(0xff105039),
//         borderRadius: const BorderRadius.only(
//           topLeft: Radius.circular(9),
//           topRight: Radius.circular(9),
//         ),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           Text(
//             "$targetName's rating: ",
//             style: const TextStyle(color: Colors.white, fontSize: 12),
//           ),
//           GetUserRating(
//             targetId,
//             movieId,
//             isReclist: false,
//           ),
//           const SizedBox(width: 20)
//         ],
//       ),
//     );
//   }
// }

// class GetUserRating extends ConsumerWidget {
//   final String? targetUserId;
//   final String? movieId;

//   final bool isReclist;

//   const GetUserRating(
//     this.targetUserId,
//     this.movieId, {
//     super.key,
//     this.isReclist = false,
//   });

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final AsyncValue<Rating> p = ref.watch(getRecByTargetIdProvider(
//         IdMap(userId: targetUserId, contentId: movieId)));
//     return p.when(
//       data: (value) {
//         return Text(
//           convertToString(value),
//           style: TextStyle(
//             color: isReclist ? Colors.black : Colors.white,
//             fontSize: 12,
//           ),
//         );
//       },
//       loading: () => Text(
//         "NOT RATED",
//         style: TextStyle(color: isReclist ? Colors.black : Colors.white),
//       ),
//       error: (_, __) => Text(
//         "NOT RATED",
//         style: TextStyle(color: isReclist ? Colors.black : Colors.white),
//       ),
//     );
//   }
// }
