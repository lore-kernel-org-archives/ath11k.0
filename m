Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hnMKZ-0005hb-Q5
 for ath11k@lists.infradead.org; Tue, 16 Jul 2019 12:13:17 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath11k: Add probe response throttling logic
References: <1561595753-11351-1-git-send-email-srirrama@codeaurora.org>
Date: Tue, 16 Jul 2019 15:13:10 +0300
In-Reply-To: <1561595753-11351-1-git-send-email-srirrama@codeaurora.org>
 (Sriram R.'s message of "Thu, 27 Jun 2019 06:05:53 +0530")
Message-ID: <87muhe89ex.fsf@kamboji.qca.qualcomm.com>
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
To: Sriram R <srirrama@codeaurora.org>
Cc: ath11k@lists.infradead.org

Sriram R <srirrama@codeaurora.org> writes:

> Drop probe response packets when the pending management tx
> count has reached a certain threshold, so as to prioritize
> other mgmt packets like auth and assoc to be sent on time
> for establishing successful connections.
> This might be required in dense networks, multi-vap scenarios
> or due to emulated probe requests (DoS attack),
> which could lead to association failures due to failure to
> send auth/assoc packets as high probe response traffic occupies the
> limited target mgmt transmit queue.
> Currently the threshold is set to 3/4th of the target management
> tx queue.
>
> Signed-off-by: Sriram R <srirrama@codeaurora.org>

[...]

> --- a/drivers/net/wireless/ath/ath11k/wmi.c
> +++ b/drivers/net/wireless/ath/ath11k/wmi.c
> @@ -3366,6 +3366,9 @@ static int wmi_process_mgmt_tx_comp(struct ath11k *ar, u32 desc_id,
>  
>  	ieee80211_tx_status_irqsafe(ar->hw, msdu);
>  
> +	WARN_ON(atomic_read(&ar->num_pending_mgmt_tx) == 0);

In the pending branch I changed this to WARN_ON_ONCE() so that we don't
excessively spam the logs:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending-ath11k&id=02d5ce6ef5feff4bbc80afd800586bd15879b714

-- 
Kalle Valo

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
