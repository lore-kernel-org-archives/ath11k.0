Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail25.static.mailgun.info ([104.130.122.25])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iiJ1p-0003Jz-FX
 for ath11k@lists.infradead.org; Fri, 20 Dec 2019 14:13:19 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH qca6390-bringup] ath11k: fix ZERO address in probe request
References: <1576830666-30661-1-git-send-email-cjhuang@codeaurora.org>
Date: Fri, 20 Dec 2019 16:13:06 +0200
In-Reply-To: <1576830666-30661-1-git-send-email-cjhuang@codeaurora.org> (Carl
 Huang's message of "Fri, 20 Dec 2019 16:31:06 +0800")
Message-ID: <87woar13wt.fsf@kamboji.qca.qualcomm.com>
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
To: Carl Huang <cjhuang@codeaurora.org>
Cc: ath11k@lists.infradead.org

Carl Huang <cjhuang@codeaurora.org> writes:

> Host needs to pass at least on bssid with all 0xff to firmware in
> WMI_START_SCAN_CMDID, otherwise the bssid and receiver address
> in probe requeste are all ZEROs.
>
> This also fixed some hidden AP connection issue because some AP
> doesn't respond to probe request which receiver address are all
> ZEROs.
>
> Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
> ---
>  drivers/net/wireless/ath/ath11k/wmi.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
> index 4375e59..1a78002 100644
> --- a/drivers/net/wireless/ath/ath11k/wmi.c
> +++ b/drivers/net/wireless/ath/ath11k/wmi.c
> @@ -1842,6 +1842,9 @@ void ath11k_wmi_start_scan_init(struct ath11k *ar,
>  				  WMI_SCAN_EVENT_DEQUEUED;
>  	arg->scan_flags |= WMI_SCAN_CHAN_STAT_EVENT;
>  	arg->num_bssid = 1;
> +	/* fill bssid_list[0] with 0xff */
> +	ether_addr_copy(arg->bssid_list[0].addr, "\xFF\xFF\xFF\xFF\xFF\xFF");

The comment should explain _why_ you are doing that. It's clear from
looking at the code that we are filling the address with 0xff but the
reason for this unclear just from looking at the code.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
