Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPpCU-0001sH-QW
 for ath11k@lists.infradead.org; Wed, 30 Oct 2019 14:43:58 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 1/2] nl80211: add Wide Band Scan support
References: <1572349405-4653-1-git-send-email-murugana@codeaurora.org>
 <1572349405-4653-2-git-send-email-murugana@codeaurora.org>
Date: Wed, 30 Oct 2019 16:43:50 +0200
In-Reply-To: <1572349405-4653-2-git-send-email-murugana@codeaurora.org>
 (Sathishkumar Muruganandam's message of "Tue, 29 Oct 2019 17:13:24
 +0530")
Message-ID: <877e4m2t09.fsf@kamboji.qca.qualcomm.com>
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
To: Sathishkumar Muruganandam <murugana@codeaurora.org>
Cc: ath11k@lists.infradead.org

Sathishkumar Muruganandam <murugana@codeaurora.org> writes:

> New nl80211 ext_feature and scan_flag added to support wide band scan which
> allows driver to scan on requested channel with corresponding
> phy mode/bandwidth (40Mhz, 80Mhz).
>
> To handle center frequency of 80Mhz channel, struct cfg80211_chan_def is
> included in cfg80211_scan_request.
>
> Signed-off-by: Sathishkumar Muruganandam <murugana@codeaurora.org>
> ---
>  include/net/cfg80211.h       |  2 ++
>  include/uapi/linux/nl80211.h |  7 +++++
>  net/mac80211/scan.c          |  2 ++
>  net/wireless/nl80211.c       | 68 ++++++++++++++++++++++++++++----------------
>  4 files changed, 55 insertions(+), 24 deletions(-)

I don't apply nl80211 patches. So you need to submit this to
linux-wireless like all other nl80211 patches.

I'll also drop the ath11k patch, please resend once the nl80211 patch is
applied.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
