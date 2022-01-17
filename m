Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F41AC433F5
	for <ath11k@archiver.kernel.org>; Mon, 17 Jan 2022 12:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0MUSOV/c86RpjEhj0iaoDb1zf1gW1drxjTxg3wCcv5w=; b=eU8Sifx/CwN3IJ
	j4I/T+NLwCBZoflrjtwn4sVlNVql1PY5zdaLacd2VXNcQ4isQucaqg0w6QAwEQDegaWPVE6UAL9VZ
	2pxtFn766xW8E/aAySWMDOqJ0My9W8Oh9FREIB5qi/o39kQQSUcm1SVvFmnqwXKfrUrq0MeXvVngo
	TDbxJfu/R404w7Ja4IIOQN7ZiUxBy9S/LW2YBPgkrBhH5R5ZBXF5ToiBX2IIhyt+LiL/LwQEvU6pg
	6LeX3G0O8UlsDm9DO1ba06T5grxWCikaXaw+mB7HmWTl58ErRbjuSdTCxh9qwCTWUJIZRxWJLE65W
	L2jN76WwXHFgWEMTXXRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9RCN-00EuoC-Jl; Mon, 17 Jan 2022 12:33:23 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9RCI-00Eun6-Pq
 for ath11k@lists.infradead.org; Mon, 17 Jan 2022 12:33:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 757D0B80C85;
 Mon, 17 Jan 2022 12:33:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C4E1C36AE3;
 Mon, 17 Jan 2022 12:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642422795;
 bh=bBKUMaLnO1ekU7Qi1502Up9LSB+to416XCMt4LwKiNs=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=Hz+wK+WymJ5UN1XJ1VvmHzQ6DQuyts4vxILETzn6ZRWLhIWpQ8rrLxqhMn3PIuP/E
 QR7EeDPox/KfO34w+01b/psfi7T4PQHwij1UBO8JazShqIs8J090+Qpes9sYtTdhgG
 LNOubds/7JnLRkS/SW4Q0lLH7AnAaG8sBolHfqrMJH33XQ6Bze6lSyorbrEswf6mev
 w2IKJulX45T4W8FdpOaCX3jW7CeQ3Sli3hC6GAP5+ilZ7AyH905VQ04P51k29Jn7AL
 0IPtQFkKNLfvul4L8I0eoCtgw07uPLfbJDTindyvzD63ipedG8YWwO/pxUAEpRU3WV
 /zNsw0Ea8XFfw==
From: Kalle Valo <kvalo@kernel.org>
To: Seevalamuthu Mariappan <quic_seevalam@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH] ath11k: Add support for dynamic vlan
References: <1641786090-10232-1-git-send-email-quic_seevalam@quicinc.com>
Date: Mon, 17 Jan 2022 14:33:10 +0200
In-Reply-To: <1641786090-10232-1-git-send-email-quic_seevalam@quicinc.com>
 (Seevalamuthu Mariappan's message of "Mon, 10 Jan 2022 09:11:30
 +0530")
Message-ID: <87bl0asfsp.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_043319_000683_DF836EC4 
X-CRM114-Status: GOOD (  18.50  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
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
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Seevalamuthu Mariappan <quic_seevalam@quicinc.com> writes:

> Advertise AP-VLAN interface type for vlan support in driver.
> Metadata information in dp_tx is added to notify firmware
> that multicast/broadcast packets are encrypted in software.
>
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.5.0.1-01073-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: Seevalamuthu Mariappan <quic_seevalam@quicinc.com>

[...]

> --- a/drivers/net/wireless/ath/ath11k/dp_tx.c
> +++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
> @@ -78,6 +78,44 @@ enum hal_encrypt_type ath11k_dp_tx_get_encrypt_type(u32 cipher)
>  	}
>  }
>  
> +#define HTT_META_DATA_ALIGNMENT    0x8
> +
> +static int ath11k_dp_metadata_align_skb(struct sk_buff *skb, u8 align_len)
> +{
> +	if (unlikely(skb_cow_head(skb, align_len)))
> +		return -ENOMEM;
> +
> +	skb_push(skb, align_len);
> +	memset(skb->data, 0, align_len);
> +	return 0;
> +}

[...]

> @@ -211,15 +250,42 @@ int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
>  		goto fail_remove_idr;
>  	}
>  
> +	/* Add metadata for sw encrypted vlan group traffic */
> +	if (!test_bit(ATH11K_FLAG_HW_CRYPTO_DISABLED, &ar->ab->dev_flags) &&
> +	    !(info->flags & IEEE80211_TX_CTL_HW_80211_ENCAP) &&
> +	    !info->control.hw_key &&
> +	    ieee80211_has_protected(hdr->frame_control)) {
> +		/* HW requirement is that metadata should always point to a
> +		 * 8-byte aligned address. So we add alignment pad to start of
> +		 * buffer. HTT Metadata should be ensured to be multiple of 8-bytes
> +		 *  to get 8-byte aligned start address along with align_pad added
> +		 */
> +		align_pad = ((unsigned long)skb->data) & (HTT_META_DATA_ALIGNMENT - 1);
> +		ret = ath11k_dp_metadata_align_skb(skb, align_pad);
> +		if (unlikely(ret))
> +			goto fail_remove_idr;

If you push the skb like that shouldn't you also reserve the room for it
in struct ieee80211_hw::extra_tx_headroom?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
