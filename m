Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-188.smtp-out.us-west-2.amazonses.com ([54.240.27.188])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iY6GT-0000o0-BR
 for ath11k@lists.infradead.org; Fri, 22 Nov 2019 10:34:15 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath11k: fix kernel panic by freeing the msdu received
 with invalid length
References: <1573024463-9066-1-git-send-email-tamizhr@codeaurora.org>
Date: Fri, 22 Nov 2019 10:34:09 +0000
In-Reply-To: <1573024463-9066-1-git-send-email-tamizhr@codeaurora.org> (Tamizh
 chelvam's message of "Wed, 6 Nov 2019 12:44:23 +0530")
Message-ID: <0101016e92ad1e94-69a164c4-92b8-42a6-977e-ac61c146647f-000000@us-west-2.amazonses.com>
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
To: Tamizh chelvam <tamizhr@codeaurora.org>
Cc: ath11k@lists.infradead.org

Tamizh chelvam <tamizhr@codeaurora.org> writes:

> In certain scenario host receives the packets with invalid
> length which causes below kernel panic. Free up those msdus to avoid this
> kernel panic. And printed packet information for debugging purpose.
>
>  2270.028121:   <6> task: ffffffc0008306d0 ti: ffffffc0008306d0 task.ti: ffffffc0008306d0
>  2270.035247:   <2> PC is at skb_panic+0x40/0x44
>  2270.042784:   <2> LR is at skb_panic+0x40/0x44
>  2270.521775:   <2> [<ffffffc0004a06e0>] skb_panic+0x40/0x44
>  2270.524039:   <2> [<ffffffc0004a1278>] skb_put+0x54/0x5c
>  2270.529264:   <2> [<ffffffbffcc373a8>] ath11k_dp_process_rx_err+0x320/0x5b0 [ath11k]
>  2270.533860:   <2> [<ffffffbffcc30b68>] ath11k_dp_service_srng+0x80/0x268 [ath11k]
>  2270.541063:   <2> [<ffffffbffcc1d554>] ath11k_hal_rx_reo_ent_buf_paddr_get+0x200/0xb64 [ath11k]
>  2270.547917:   <2> [<ffffffc0004b1f74>] net_rx_action+0xf8/0x274
>  2270.556247:   <2> [<ffffffc000099df4>] __do_softirq+0x128/0x228
>  2270.561625:   <2> [<ffffffc00009a130>] irq_exit+0x84/0xcc
>  2270.567008:   <2> [<ffffffc0000cfb28>] __handle_domain_irq+0x8c/0xb0
>  2270.571695:   <2> [<ffffffc000082484>] gic_handle_irq+0x6c/0xbc
>
> Signed-off-by: Tamizh chelvam <tamizhr@codeaurora.org>

Is your lastname uncapitalised on purpose? Looks odd.

> --- a/drivers/net/wireless/ath/ath11k/dp_rx.c
> +++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
> @@ -1440,6 +1440,35 @@ static struct sk_buff *ath11k_dp_rx_get_msdu_last_buf(struct sk_buff_head *msdu_
>  	return NULL;
>  }
>  
> +static void ath11k_dp_rx_msdu_info(struct ath11k *ar,
> +				   struct hal_rx_desc *rx_desc,
> +				   struct ath11k_skb_rxcb *rxcb)
> +{
> +	enum hal_encrypt_type enctype;
> +	bool is_decrypted;
> +	bool mpdu_len_err;
> +	u32 decap_format;
> +	u8 *hdr_status;
> +	u16 msdu_len;
> +
> +	hdr_status = ath11k_dp_rx_h_80211_hdr(rx_desc);
> +	msdu_len = ath11k_dp_rx_h_msdu_start_msdu_len(rx_desc);
> +	rxcb->is_first_msdu = ath11k_dp_rx_h_msdu_end_first_msdu(rx_desc);
> +	rxcb->is_last_msdu = ath11k_dp_rx_h_msdu_end_last_msdu(rx_desc);
> +
> +	decap_format = ath11k_dp_rxdesc_get_decap_format(rx_desc);
> +	mpdu_len_err = !!ath11k_dp_rxdesc_get_mpdulen_err(rx_desc);
> +
> +	is_decrypted = ath11k_dp_rx_h_attn_is_decrypted(rx_desc);
> +	enctype = ath11k_dp_rx_h_mpdu_start_enctype(rx_desc);
> +
> +	ath11k_warn(ar->ab, "frame rx with invalid msdu len %u first msdu %d last msdu %d decap format %u mpdu_len_err %d decrypted %d encryption type %u\n",
> +		    msdu_len, rxcb->is_first_msdu, rxcb->is_last_msdu,
> +		    decap_format, mpdu_len_err, is_decrypted, enctype);
> +	ath11k_dbg_dump(ar->ab, ATH11K_DBG_DATA, NULL, "", hdr_status,
> +			sizeof(struct ieee80211_hdr));
> +}

This function feels quite excessive. The warning messages are supposed
to be concise and printing 7 different values is far from that. So I
would prefer to drop this function altogether.

>  static int ath11k_dp_rx_retrieve_amsdu(struct ath11k *ar,
>  				       struct sk_buff_head *msdu_list,
>  				       struct sk_buff_head *amsdu_list)
> @@ -1492,6 +1521,12 @@ static int ath11k_dp_rx_retrieve_amsdu(struct ath11k *ar,
>  		l3_pad_bytes = ath11k_dp_rx_h_msdu_end_l3pad(lrx_desc);
>  
>  		if (!rxcb->is_continuation) {
> +			if ((msdu_len + HAL_RX_DESC_SIZE) > DP_RX_BUFFER_SIZE) {
> +				ath11k_dbg_dump(ar->ab, ATH11K_DBG_DATA, NULL, "", rx_desc,
> +						sizeof(struct hal_rx_desc));
> +				ath11k_dp_rx_msdu_info(ar, rx_desc, rxcb);
> +				goto free_out;
> +			}

So instead I would just print a warning like this:

"dropping received amsdu frame with invalid msdu length %u"

And also call ath11k_dbg_dump() here.

>  			skb_put(msdu, HAL_RX_DESC_SIZE + l3_pad_bytes + msdu_len);
>  			skb_pull(msdu, HAL_RX_DESC_SIZE + l3_pad_bytes);
>  		} else {
> @@ -2764,6 +2799,14 @@ static void ath11k_dp_rx_frag_h_mpdu(struct ath11k *ar,
>  
>  	rx_desc = (struct hal_rx_desc *)msdu->data;
>  	msdu_len = ath11k_dp_rx_h_msdu_start_msdu_len(rx_desc);
> +	if ((msdu_len + HAL_RX_DESC_SIZE) > DP_RX_BUFFER_SIZE) {
> +		ath11k_dbg_dump(ar->ab, ATH11K_DBG_DATA, NULL, "", rx_desc,
> +				sizeof(struct hal_rx_desc));
> +		ath11k_dp_rx_msdu_info(ar, rx_desc, rxcb);
> +		dev_kfree_skb_any(msdu);
> +		goto exit;
> +	}

And the same here, but change the message a bit to make it unique to
make it easier to find when reading logs:

"dropping received fragmented frame with invalid msdu length %u"

I just made up terms "amsdu" and "fragmented" from function names,
please do come up with more appropriate terms if they are not correct.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
