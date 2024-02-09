import { createApi, fetchBaseQuery } from "@reduxjs/toolkit/query/react";

const baseQuery = fetchBaseQuery({
  baseUrl: url,
  credentials: "include",
  prepareHeaders(headers, { getState }) {
    let token = getState().auth.token;

    if (token) {
      headers.set("authorization", `Bearer ${token}`);
    }

    return headers;
  },
});

const apiSlice = createApi({
  baseQuery: fetchBaseQuery({ baseUrl: url }),
  endpoints: () => ({}),
});

export default apiSlice;
