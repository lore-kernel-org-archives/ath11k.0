Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBGz2-0002DC-Oe
 for ath11k@lists.infradead.org; Thu, 27 Aug 2020 12:26:26 +0000
Message-ID: <61219c725630447e832839196e20eb433723ed49.camel@sipsolutions.net>
Subject: Re: [PATCH V5 4/5] mac80211: add support for BSS coloring
From: Johannes Berg <johannes@sipsolutions.net>
Date: Thu, 27 Aug 2020 14:26:18 +0200
In-Reply-To: <20200826055650.1101224-4-john@phrozen.org>
 (sfid-20200826_075710_318035_1DE9E6C8)
References: <20200826055650.1101224-1-john@phrozen.org>
 <20200826055650.1101224-4-john@phrozen.org>
 (sfid-20200826_075710_318035_1DE9E6C8)
MIME-Version: 1.0
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: John Crispin <john@phrozen.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org


> + * @color_change_active: marks whether a color change is going on. Internally it is
> + *	write-protected by sdata_lock and local->mtx so holding either is fine
> + *	for read access.
> 

I started fixing up things like that but then I got annoyed and gave up
...

Just because checkpatch no longer warns on >80 columns that doesn't mean
it's suddenly completely acceptable to write very long lines. In flowed
text like this, it's much nicer to have shorter lines, and long lines
are just arbitrary.

That's actually in quite a few places in this patch - comments, function
arguments, etc.

Nothing against going over 80 where that makes the code more readable,
but long lines for flowed text are *less* readable.

johannes


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
