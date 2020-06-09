Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jiXtF-0006OF-Do
 for ath11k@lists.infradead.org; Tue, 09 Jun 2020 06:37:43 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v5 7/8] ath11k: Send multiple scan_chan_list messages if
 required
References: <20200603001724.12161-1-pradeepc@codeaurora.org>
 <20200603001724.12161-8-pradeepc@codeaurora.org>
Date: Tue, 09 Jun 2020 09:37:35 +0300
In-Reply-To: <20200603001724.12161-8-pradeepc@codeaurora.org> (Pradeep Kumar
 Chitrapu's message of "Tue, 2 Jun 2020 17:17:23 -0700")
Message-ID: <87ftb4zqvk.fsf@codeaurora.org>
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
To: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Pradeep Kumar Chitrapu <pradeepc@codeaurora.org> writes:

> With addition of 6Ghz channels, it is possible that wmi buffer size can
> exceed the maximum wmi buffer size. So iterate over the channel list,
> and send multiple messages till channel list is empty.
> Also mark PSC channel flag for 6GHz channels accordingly.
>
> Signed-off-by: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
> ---
>  drivers/net/wireless/ath/ath11k/wmi.c | 170 ++++++++++++++------------
>  drivers/net/wireless/ath/ath11k/wmi.h |   3 +
>  2 files changed, 98 insertions(+), 75 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
> index 239a336f55f4..ad3a7b68d308 100644
> --- a/drivers/net/wireless/ath/ath11k/wmi.c
> +++ b/drivers/net/wireless/ath/ath11k/wmi.c
> @@ -2194,91 +2194,111 @@ int ath11k_wmi_send_scan_chan_list_cmd(struct ath11k *ar,
>  	struct channel_param *tchan_info;
>  	struct wmi_tlv *tlv;
>  	void *ptr;
> -	int i, ret, len;
> +	int i, ret = 0, len;
> +	u16 num_send_chans, num_sends = 0, max_chan_limit = 0;
>  	u32 *reg1, *reg2;
>  

[...]

> +		ret = ath11k_wmi_cmd_send(wmi, skb, WMI_SCAN_CHAN_LIST_CMDID);
> +		if (ret) {
> +			ath11k_warn(ar->ab, "failed to send WMI_SCAN_CHAN_LIST cmd\n");
> +			dev_kfree_skb(skb);
> +			goto end;
> +		}
> +
> +		num_sends++;
> +	}
> +end:
>  	return ret;
>  }

The end label is useless, I removed that and replaced the goto with
'return ret'. And I replaced the return in the end to 'return 0' which
made it possible to not initialise the ret variable. Please check my
changes in the pending branch (which I will push shortly).

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
