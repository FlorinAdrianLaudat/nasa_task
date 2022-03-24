import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_task/features/news/presentation/pages/news_detail_page.dart';
import '../../../../core/utils/string_utils.dart';
import '../../../../core/widgets/loader.dart';
import '../../domain/entity/news_entity.dart';
import '../bloc/news_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../resources/injection_container.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  late NewsBloc _bloc;
  NewsEntity? _news;
  @override
  void initState() {
    super.initState();
    _bloc = di<NewsBloc>();
    _bloc.add(GetNewsEvent());
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: _bloc,
      listener: (context, state) {
        if (state is DailyNewsLoadedState) {
          _news = state.news;
        } else if (state is ErrorState) {
          _showErrorDialog('Error getting the data');
        } else if (state is NetworkErrorState) {
          _showErrorDialog('No network available');
        }
      },
      builder: (context, state) {
        return Stack(
          children: [
            Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.blueGrey.shade500,
                title: const Text('Daily News from Nasa'),
              ),
              body: _buildNews(),
            ),
            Container(
              child: state is LoadingState ? const LoaderWidget() : null,
            ),
          ],
        );
      },
    );
  }

  _buildNews() {
    if (_news == null) {
      return const SizedBox();
    }
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(_news?.title ?? ''),
          ),
          StringUtils.isNotNullOrEmpty(_news?.mediaType) &&
                  _news?.mediaType == 'image'
              ? Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: CachedNetworkImage(
                    imageUrl: _news?.url ?? '',
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                )
              : const SizedBox(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: TextButton(
                onPressed: _navigateToDetailsPage,
                child: const Text(
                  'Details..',
                ),
                style: TextButton.styleFrom(
                    backgroundColor: Colors.grey,
                    primary: Colors.white,
                    textStyle: const TextStyle(fontSize: 24)),
              ),
            ),
          )
        ],
      ),
    );
  }

  _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  _navigateToDetailsPage() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NewsDetailPage(
          date: _news?.date ?? '',
          explanation: _news?.explanation ?? '',
        ),
      ),
    );
  }
}
