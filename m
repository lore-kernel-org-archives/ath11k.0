Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeQ4D-0002Np-Ue
 for ath11k@lists.infradead.org; Thu, 28 May 2020 21:27:59 +0000
MIME-Version: 1.0
Date: Thu, 28 May 2020 14:27:55 -0700
From: Rajkumar Manoharan <rmanohar@codeaurora.org>
Subject: Re: [PATCH] nl80211: Add HE UL MU fixed rate setting
In-Reply-To: <1590655771-12984-1-git-send-email-msinada@codeaurora.org>
References: <1590655771-12984-1-git-send-email-msinada@codeaurora.org>
Message-ID: <11422f29609c537108c607c67d42e125@codeaurora.org>
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: Muna Sinada <msinada@codeaurora.org>
Cc: ath11k@lists.infradead.org

On 2020-05-28 01:49, Muna Sinada wrote:
> This patch adds nl80211 definitions, policies and parsing code required
> to pass HE UL MU fixed rate settings.
> 
> Signed-off-by: Muna Sinada <msinada@codeaurora.org>
> ---
>  include/net/cfg80211.h       | 1 +
>  include/uapi/linux/nl80211.h | 2 ++
>  net/wireless/nl80211.c       | 9 +++++++++
>  3 files changed, 12 insertions(+)
> 
Please post all cfg80211/mac80211 changes CCd to linux-wireless and 
addressing Johannes.

-Rajkumar

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
