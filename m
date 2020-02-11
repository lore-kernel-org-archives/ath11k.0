Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1VIy-00050P-AU
 for ath11k@lists.infradead.org; Tue, 11 Feb 2020 13:10:21 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [RESEND V2 3/4] ath11k: switch to using ieee80211_tx_status_ext()
References: <20200204151135.25302-1-john@phrozen.org>
 <20200204151135.25302-3-john@phrozen.org>
Date: Tue, 11 Feb 2020 15:10:04 +0200
In-Reply-To: <20200204151135.25302-3-john@phrozen.org> (John Crispin's message
 of "Tue, 4 Feb 2020 16:11:34 +0100")
Message-ID: <87h7zxxob7.fsf@kamboji.qca.qualcomm.com>
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

John Crispin <john@phrozen.org> writes:

> This allows us to pass HE rates down into the stack.
>
> Signed-off-by: John Crispin <john@phrozen.org>
> ---
>  drivers/net/wireless/ath/ath11k/dp_tx.c | 24 +++++++++++++++++++-----
>  1 file changed, 19 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
> index 7b532bf9acd8..66a6cfd54ad9 100644
> --- a/drivers/net/wireless/ath/ath11k/dp_tx.c
> +++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
> @@ -357,9 +357,12 @@ static void ath11k_dp_tx_complete_msdu(struct ath11k *ar,
>  				       struct sk_buff *msdu,
>  				       struct hal_tx_status *ts)
>  {
> +	struct ieee80211_tx_status status = { 0 };

This adds a sparse warning:

drivers/net/wireless/ath/ath11k/dp_tx.c:350:47: warning: Using plain integer as NULL pointer

Seems like a false warning, no? But not sure how to shut up the warning,
using '{ NULL }' would do that but just feels wrong. Any opinions?

There was also a trivial checkpatch warning:

drivers/net/wireless/ath/ath11k/dp_tx.c:419: Please don't use multiple blank lines

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
