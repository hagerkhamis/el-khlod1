part of 'sites_type_cubit.dart';

abstract class SitesTypeState {
  const SitesTypeState();
  List<Object> get props => [];
}

class SitesTypeInitial extends SitesTypeState {}

class SitesTypeLoading extends SitesTypeState {
  const SitesTypeLoading();
}

class SitesTypeSuccessful extends SitesTypeState {
  final AllSitesList data;

  const SitesTypeSuccessful(this.data);
}

class SitesTypeFailed extends SitesTypeState {
  final String message;
  const SitesTypeFailed(this.message);
}
