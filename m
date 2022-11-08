Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6820C4321E
	for <ath11k@archiver.kernel.org>; Tue,  8 Nov 2022 10:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0UBUf2xbI4Sa24/SiMa8/GZuIxUltMqTGxA3LOkTd/A=; b=dhucW/9JZ8JJP4
	IUstMGH7IDVnBzvAjQMOr+wLGY+p/e4ijAnsDBGfEqVQUIFUatGEVNxb+TLF3PHe41c/FRxyeF0bU
	fDsCalcXFG96KheYwZ0AVyzlQ3juc6WNybJR/HwPEHfyCaQkxARQ+XNN4/dsAjX5lR0fD5JYc+6Am
	GSsJkeW88QkznCMplOyzFe6USnMKfccN6JOjUKdQTq6uQHIV2yb35JNi1vdqaY94p2eaHHgf/q3yS
	29fiBaQOMXkB582spzECHzfOE+WxDnohZZoC+0OhmEn2AXtHX9mRKpzrR6O754fz00kSbg7Q9Ql3W
	OKkskVCCrwnVSeCxyQ6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osLiT-004QyB-My; Tue, 08 Nov 2022 10:20:25 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osLiQ-004QxK-Oc
	for ath11k@lists.infradead.org; Tue, 08 Nov 2022 10:20:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 49A3BB819B8;
	Tue,  8 Nov 2022 10:20:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30151C433D6;
	Tue,  8 Nov 2022 10:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667902818;
	bh=fj3GSjuI/xSDQX1HQai9knNPR5hppsvev38xKxYNPFo=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=mvd7sFW2tY2oJMAVWF+GerRLIYEGXDYfBWpg2MDXULNdZ65+Y/frPtDmLOHI6sbLO
	 ehrOIt8jprA0eKOybe2KuEqxKyMnjpsn9OjofYKUcygwKtGqi4gjJpRVBLWHCkSejB
	 l7xELMzZoJfnUc0XwXz3Y7avH0EwD7kzGozS8jZhMg3Je314OWs/4K6N3g9evji4t7
	 /KWUiiLXHGLKwbfh0OwiD1hA+ZnODdcWhIp10Jp5wcwPsuIPCW2zriDsxH8fCCTZrU
	 kbrQJZ60d/fPJ7C1jG6scAncdDC3GaTT1uaLwEWUHH6LDx+W8bE9L3eZw5QTTT5R4D
	 5OBgDCJvZCIKg==
From: Kalle Valo <kvalo@kernel.org>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] wifi: ath11k: reduce the timeout value back for hw scan from 10 seconds to 1 second
References: <20221011072408.23731-1-quic_wgong@quicinc.com>
	<20221011072408.23731-3-quic_wgong@quicinc.com>
Date: Tue, 08 Nov 2022 12:20:14 +0200
In-Reply-To: <20221011072408.23731-3-quic_wgong@quicinc.com> (Wen Gong's
	message of "Tue, 11 Oct 2022 03:24:08 -0400")
Message-ID: <8735atg335.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_022023_105344_E3051975 
X-CRM114-Status: GOOD (  20.35  )
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

Wen Gong <quic_wgong@quicinc.com> writes:

> For 11d scan, commit 9dcf6808b253 ("ath11k: add 11d scan offload support")
> increased the timeout from one second to max 10 seconds when 11d scan
> offload enabled and 6 GHz enabled, it is reasonable for the commit, it
> is because the first 11d scan request is sent to firmware before the
> first hw scan request after wlan load, then the hw scan started event
> will reported from firmware after the 11d scan finished, it needs about
> 6 seconds when 6 GHz enabled, so increased it from one second to 10
> seconds in the commit to avoid timed out for hw scan started. Then
> another commit 1f682dc9fb37 ("ath11k: reduce the wait time of 11d scan
> and hw scan while add interface") change the sequence of the first 11d
> scan and hw scan, then ath11k will receive the hw scan started event
> from firmware immediately for the first hw scan, thus ath11k does not
> need set the timeout value to max 10 seconds again, and this is to set
> the timeout value back from 10 seconds to 1 second.
>
> After the 1st hw scan finished, firmware will start 11d scan immediately,
> and firmware need use some seconds to finish 11d scan, if the 2nd hw
> scan is sent from ath11k to firmware before 11d scan finished, the 2nd
> hw scan will started after 11d scan finished, this will lead timeout to
> wait scan started in ath11k. Treat the timeout as a normal situation if
> 11d scan is running and skip report scan fail for this situation.
>
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3
>
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>

[...]

> @@ -3682,7 +3677,12 @@ static int ath11k_mac_op_hw_scan(struct ieee80211_hw *hw,
>  
>  	ret = ath11k_start_scan(ar, &arg);
>  	if (ret) {
> -		ath11k_warn(ar->ab, "failed to start hw scan: %d\n", ret);
> +		if (ret == -EBUSY)
> +			ath11k_dbg(ar->ab, ATH11K_DBG_MAC,
> +				   "scan engine is busy 11d state %d\n", ar->state_11d);
> +		else
> +			ath11k_warn(ar->ab, "failed to start hw scan: %d\n", ret);
> +
>  		spin_lock_bh(&ar->data_lock);
>  		ar->scan.state = ATH11K_SCAN_IDLE;
>  		spin_unlock_bh(&ar->data_lock);

This feels like a hack to me, for example will these failed scans now
cause delays is connection establishment? IMHO it's crucial from user's
point of view that we don't delay that in any way.

I would rather fix the root cause, do we know what's causing this?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
