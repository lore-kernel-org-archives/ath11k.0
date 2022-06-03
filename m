Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87329C43334
	for <ath11k@archiver.kernel.org>; Fri,  3 Jun 2022 08:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aVgWtm380UqDaYHNAT+V9z4KXMn7H2t/Lrd1hyVcqO8=; b=R/40FlRmi4pqZ1
	SAnhAeydKO9bWuf7HYeKI2889v6yWdTFnaw3Gq0YDYlMVmBIoq07N/AoFzkrR90mgULqoAhRnJIqQ
	WVUMBJf5/WW+powDY+MnkJLEuUcq9BT3KXESkkvyIh69VEQHTSf9/jFqyfKL+QvLd0YcUuw/8UEWh
	2l/ElVRFLc5bh2krI7BWvDi119eUqlYEfq76ra0J54ifEr32n+CEJYma3xwXnSeCvRfYGLUul03yA
	+BgKJmoQDTk8kuc0Qz3rVlnGZ8bDlT/0/8VFRyK9tkQtl6svR9umb44XIsmpc5yfFDZrXPYkItp/F
	P7h6R2HqHcI77pU+U0Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx2hA-006fFD-5W; Fri, 03 Jun 2022 08:30:12 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx2h7-006fDW-44
	for ath11k@lists.infradead.org; Fri, 03 Jun 2022 08:30:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 71E7FB8225F;
	Fri,  3 Jun 2022 08:30:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52F4CC385A9;
	Fri,  3 Jun 2022 08:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654245006;
	bh=F/yFt7FSuieqmGZcdFXJ/QAp5UbHxQNdjguj42ZfMKs=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=l9Trv2/0e54zgnhcipilEBUHH91W+U2KV095lz3v+uSLRDXroqEpFvIHVLsFfpUml
	 UO0ONcecM7gmGGpGfiwjlPg6woetdqSdpsXK4KU48ncssUc9etAz+BvwfJHpyM0pXz
	 BLHBCckhuKizo9ORaH8mpaoYoUzb1Y3I2Ai6pE6X6D7Z4mPvIHe4utGVT6acytSq+O
	 WVUZD++VvICqIFdBimodOCgeefkel9sMIeol5ZgHXUdvhvdGb4z6CnGOKzfeN6gPYd
	 b5onSwg0Tgbze2sepdlrUWZ13ZA+VeeRM5fLKHYGfDdThIbcSQVkV+C1NGVGUModMc
	 clqGIWCYcAqvw==
From: Kalle Valo <kvalo@kernel.org>
To: "Seevalamuthu M \(QUIC\)" <quic_seevalam@quicinc.com>
Cc: "ath11k\@lists.infradead.org" <ath11k@lists.infradead.org>,  "linux-wireless\@vger.kernel.org" <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH] ath11k: Add support for dynamic vlan
References: <1641786090-10232-1-git-send-email-quic_seevalam@quicinc.com>
	<87bl0asfsp.fsf@kernel.org>
	<DM8PR02MB8199EBB0A4ACC6F64F8C92FFF62D9@DM8PR02MB8199.namprd02.prod.outlook.com>
Date: Fri, 03 Jun 2022 11:30:03 +0300
In-Reply-To: <DM8PR02MB8199EBB0A4ACC6F64F8C92FFF62D9@DM8PR02MB8199.namprd02.prod.outlook.com>
	(Seevalamuthu M.'s message of "Tue, 8 Feb 2022 05:30:07 +0000")
Message-ID: <878rqeno8k.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220603_013009_507087_D56E9CE2 
X-CRM114-Status: GOOD (  19.59  )
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

"Seevalamuthu M (QUIC)" <quic_seevalam@quicinc.com> writes:

> Hi Kalle,
>
>> -----Original Message-----
>> From: Kalle Valo <kvalo@kernel.org>
>> Sent: Monday, January 17, 2022 6:03 PM
>> To: Seevalamuthu M (QUIC) <quic_seevalam@quicinc.com>
>> Cc: ath11k@lists.infradead.org; linux-wireless@vger.kernel.org
>> Subject: Re: [PATCH] ath11k: Add support for dynamic vlan
>> 
>> Seevalamuthu Mariappan <quic_seevalam@quicinc.com> writes:
>> 
>> > Advertise AP-VLAN interface type for vlan support in driver.
>> > Metadata information in dp_tx is added to notify firmware that
>> > multicast/broadcast packets are encrypted in software.
>> >
>> > Tested-on: IPQ8074 hw2.0 AHB
>> > WLAN.HK.2.5.0.1-01073-QCAHKSWPL_SILICONZ-1
>> >
>> > Signed-off-by: Seevalamuthu Mariappan <quic_seevalam@quicinc.com>
>> 
>> [...]
>> 
>> > --- a/drivers/net/wireless/ath/ath11k/dp_tx.c
>> > +++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
>> > @@ -78,6 +78,44 @@ enum hal_encrypt_type
>> ath11k_dp_tx_get_encrypt_type(u32 cipher)
>> >  	}
>> >  }
>> >
>> > +#define HTT_META_DATA_ALIGNMENT    0x8
>> > +
>> > +static int ath11k_dp_metadata_align_skb(struct sk_buff *skb, u8
>> > +align_len) {
>> > +	if (unlikely(skb_cow_head(skb, align_len)))
>> > +		return -ENOMEM;
>> > +
>> > +	skb_push(skb, align_len);
>> > +	memset(skb->data, 0, align_len);
>> > +	return 0;
>> > +}
>> 
>> [...]
>> 
>> > @@ -211,15 +250,42 @@ int ath11k_dp_tx(struct ath11k *ar, struct
>> ath11k_vif *arvif,
>> >  		goto fail_remove_idr;
>> >  	}
>> >
>> > +	/* Add metadata for sw encrypted vlan group traffic */
>> > +	if (!test_bit(ATH11K_FLAG_HW_CRYPTO_DISABLED, &ar->ab-
>> >dev_flags) &&
>> > +	    !(info->flags & IEEE80211_TX_CTL_HW_80211_ENCAP) &&
>> > +	    !info->control.hw_key &&
>> > +	    ieee80211_has_protected(hdr->frame_control)) {
>> > +		/* HW requirement is that metadata should always point to a
>> > +		 * 8-byte aligned address. So we add alignment pad to start
>> of
>> > +		 * buffer. HTT Metadata should be ensured to be multiple of
>> 8-bytes
>> > +		 *  to get 8-byte aligned start address along with align_pad
>> added
>> > +		 */
>> > +		align_pad = ((unsigned long)skb->data) &
>> (HTT_META_DATA_ALIGNMENT - 1);
>> > +		ret = ath11k_dp_metadata_align_skb(skb, align_pad);
>> > +		if (unlikely(ret))
>> > +			goto fail_remove_idr;
>> 
>> If you push the skb like that shouldn't you also reserve the room for it in
>> struct ieee80211_hw::extra_tx_headroom?
>
> [seevalam] : already this is handled using skb_cow_head() in
> ath11k_dp_metadata_align_skb().

Indeed, I missed that.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
