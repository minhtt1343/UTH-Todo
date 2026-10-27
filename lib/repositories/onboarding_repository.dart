import '../models/onboarding_model.dart';

class OnboardingRepository {
  List<OnboardingModel> getOnboardingSteps() {
    return [
      OnboardingModel(
        title: "Mọi việc, gọn trong một chỗ",
        description: "Ghi lại bài tập, việc nhà, lịch hẹn. Không còn quên việc nữa.",
      ),
      OnboardingModel(
        title: "Chia theo Học tập và Cuộc sống",
        description: "Mỗi việc có nhóm riêng, nhìn là biết hôm nay cần làm gì.",
      ),
      OnboardingModel(
        title: "Nhắc đúng lúc",
        description: "Bật thông báo để UTH Todo nhắc bạn trước hạn chót.",
      ),
    ];
  }
}
