export interface RestaurantReview {
  id: number
  restaurantId: number
  userId: number
  userName: string
  rating: number
  review: string
  reviewDate: string
}

export interface RestaurantReviewsResponse {
  restaurantId: number
  averageRating: number
  totalReviews: number
  reviews: RestaurantReview[]
}
