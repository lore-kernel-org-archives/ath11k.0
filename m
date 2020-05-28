Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeGzi-0004K0-2S
 for ath11k@lists.infradead.org; Thu, 28 May 2020 11:46:43 +0000
Message-ID: <8dc7ace01aba3243ff99da5554c6e7f5fbc59c52.camel@sipsolutions.net>
Subject: Re: [PATCH v3 10/11] mac80211: determine chantype from HE operation
 in 6 GHz
From: Johannes Berg <johannes@sipsolutions.net>
Date: Thu, 28 May 2020 13:46:35 +0200
In-Reply-To: <650d683aeabd94a69bad64ae2a0af45c2fe25cd1.camel@sipsolutions.net>
 (sfid-20200528_114159_324068_E483B6CC)
References: <1589399105-25472-1-git-send-email-rmanohar@codeaurora.org>
 <1589399105-25472-10-git-send-email-rmanohar@codeaurora.org>
 <74232fe9a140a15306c04f0509e6c615b8e329de.camel@sipsolutions.net>
 (sfid-20200527_164156_614875_57253EF5)
 <650d683aeabd94a69bad64ae2a0af45c2fe25cd1.camel@sipsolutions.net>
 (sfid-20200528_114159_324068_E483B6CC)
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
To: Rajkumar Manoharan <rmanohar@codeaurora.org>, kvalo@codeaurora.org
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

On Thu, 2020-05-28 at 11:41 +0200, Johannes Berg wrote:
> 
> I actually kinda like this better than what I did, because what I did
> required all kinds of contortions with DISABLE_HT/VHT/HE ...

Actually, that's orthogonal. You had some of that, but not fully ...

This patch is doing almost the same thing we did, except you're taking
the capabilities into account immediately.

I'll go combine them and factor in the STA_DISABLE_BITS you had too, if
needed.

johannes


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
