Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8QkH-0004lL-K4
 for ath11k@lists.infradead.org; Wed, 19 Aug 2020 16:15:27 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH V6 2/2] ath11k: add more HE fields into radiotap header
References: <20200803145444.473810-1-john@phrozen.org>
 <20200803145444.473810-2-john@phrozen.org>
Date: Wed, 19 Aug 2020 19:14:58 +0300
In-Reply-To: <20200803145444.473810-2-john@phrozen.org> (John Crispin's
 message of "Mon, 3 Aug 2020 16:54:44 +0200")
Message-ID: <87lfiaipdp.fsf@codeaurora.org>
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
Cc: Miles Hu <milehu@codeaurora.org>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

John Crispin <john@phrozen.org> writes:

> From: Miles Hu <milehu@codeaurora.org>
>
> This patch adds code to parse HE fields inside ppdu TLVs. Then it adds the
> populates the additional info into the ratiotap header. Also fix missing
> QoS tag in native wifi mode. Finally rssi and tsf are also added.
>
> Signed-off-by: Miles Hu <milehu@codeaurora.org>
> Signed-off-by: John Crispin <john@phrozen.org>

[...]

> @@ -4522,11 +4522,14 @@ ath11k_dp_rx_mon_merg_msdus(struct ath11k *ar,
>  			    struct ieee80211_rx_status *rxs)
>  {
>  	struct sk_buff *msdu, *mpdu_buf, *prev_buf;
> -	u32 decap_format, wifi_hdr_len;
> +	u32 decap_format;
>  	struct hal_rx_desc *rx_desc;
>  	char *hdr_desc;
>  	u8 *dest;
>  	struct ieee80211_hdr_3addr *wh;
> +	static u32 pkt_type;
> +
> +	pkt_type++;

We cannot use static non-const variables in ath11k, that would be racy.
As this seems to be an unused variable I have just removed it in the
pending branch.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
