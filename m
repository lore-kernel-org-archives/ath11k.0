Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hW0o7-0008Fb-B8
 for ath11k@lists.infradead.org; Wed, 29 May 2019 15:48:04 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH V6 03/11] ath11k: move phymode selection from function to
 array lookup
References: <20190528064803.24419-1-john@phrozen.org>
 <20190528064803.24419-4-john@phrozen.org>
Date: Wed, 29 May 2019 18:47:56 +0300
In-Reply-To: <20190528064803.24419-4-john@phrozen.org> (John Crispin's message
 of "Tue, 28 May 2019 08:47:55 +0200")
Message-ID: <87pno11cur.fsf@kamboji.qca.qualcomm.com>
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
Cc: ath11k@lists.infradead.org, Shashidhar Lakkavalli <slakkavalli@datto.com>

John Crispin <john@phrozen.org> writes:

> With HE support getting added, the approach of using functions will quickly
> get convoluted. Change the code to use an array lookup function instead.
>
> Signed-off-by: Shashidhar Lakkavalli <slakkavalli@datto.com>
> Signed-off-by: John Crispin <john@phrozen.org>
> ---
>  drivers/net/wireless/ath/ath11k/mac.c | 117 ++++++++++++--------------
>  include/uapi/linux/nl80211.h          |   4 +
>  2 files changed, 57 insertions(+), 64 deletions(-)
>

[...]

> diff --git a/include/uapi/linux/nl80211.h b/include/uapi/linux/nl80211.h
> index dd4f86ee286e..b6e29161ec8b 100644
> --- a/include/uapi/linux/nl80211.h
> +++ b/include/uapi/linux/nl80211.h
> @@ -4162,6 +4162,10 @@ enum nl80211_chan_width {
>  	NL80211_CHAN_WIDTH_160,
>  	NL80211_CHAN_WIDTH_5,
>  	NL80211_CHAN_WIDTH_10,
> +
> +	/* keep last */
> +	__NL80211_CHAN_WIDTH_NUM,
> +	NL80211_CHAN_WIDTH_MAX = __NL80211_CHAN_WIDTH_NUM - 1,

I was wondering why this patchset was giving warnings on ath10k and then
I found this. In an ath11k patch you can't change anything outside of
ath11k. So you have to send this to upstream as a separate patch. Or
maybe modify the ath11k part so that no changes in nl80211.h is needed.

And then you change nl80211 do make sure that you compile testing all
drivers.

-- 
Kalle Valo

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
