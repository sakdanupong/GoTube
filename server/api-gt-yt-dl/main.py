#!/usr/bin/env python
#
# Copyright 2007 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
import webapp2
import sys
import os
import pafy
import json

class MainHandler(webapp2.RequestHandler):
    def get(self):
        self.response.write('Hello world!')
        #  solution 1
        # url = "http://www.youtube.com/watch?v=b64L7SY624k"
        # video = pafy.new(url)
        # best = video.getbest()
        # print(best.url)

class GetDownloadUrl(webapp2.RequestHandler):
    def get(self):
        url = self.request.get("url")
        #  solution 1
        video = pafy.new(url)
        best = video.getbest()
        self.response.headers['Content-Type'] = "application/json"

        dict = {
        	"data":best.url
        }

        self.response.out.write(json.dumps(dict))

app = webapp2.WSGIApplication([
    ('/', MainHandler),
    ('/get_download_url', GetDownloadUrl)
], debug=True)
