import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoser/models/post.dart';

import '../api/api_service.dart';
import '../models/pagination.dart';


final postsProvider = FutureProvider.family<List<Post>?, PaginationModel>(
        (ref, paginationModel){
      final apiRepository = ref.watch(apiService);
      return apiRepository.getPosts(paginationModel.Category,paginationModel.page, paginationModel.pageSize);

    }
);