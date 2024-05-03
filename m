Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C90FC4345F
	for <ath11k@archiver.kernel.org>; Fri,  3 May 2024 13:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mMuOjeHyPP+hinlNOxVKCaa4d/P8OBXrUc1b4slJB/U=; b=E1MN3PEsuKdtOh2/CXMFZK4G6O
	/GVogsWAnFnQn5SbGVkizl3YEjMO8QZX08UBchw88+o91F21wDcYgkBym32mG4/uN21oteCoHU29u
	PB+/KmKQ56plO0s9NRhKy+AEpkL4ET4UkkXOh1NO0SwObERBh7WroLfpa8HtWQU+AIVMGMc0Abku0
	GynhXwISfgLqjEJB/4B1q5/ZJ42RkW0P/YXDrGUgStc6oXYTDhdnQTSlcSknNo7DSn8HPDPUpXv0c
	GcUW5x/0ZTQbr59syi2DLrD+gUnnhnsvc1CV02eCDphkuWVTb0FnSQrn8KqkM8fabV9x7xkqmQ2se
	lmg3W1oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2shK-0000000GbQ4-0RlG;
	Fri, 03 May 2024 13:11:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2shG-0000000GbOp-3JFA
	for ath11k@lists.infradead.org;
	Fri, 03 May 2024 13:11:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 162E461C83;
	Fri,  3 May 2024 13:11:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A172C2BBFC;
	Fri,  3 May 2024 13:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714741888;
	bh=5404OLBra5zpvBGKgxF26R374GnojqrH4m9tPxLxqB4=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=PSP5BKdNjOhzRw2cMZ21Ayfon+vBr27dKHmm+CWtsDxLrGrcPv+g0Piji/HEbRnJR
	 VDZ/S6Qn1MEHCx3tHi95qpKkL7eDOznhsZZWaKl3ppAFF9/zmi22ZDD9tCRx/7C6V9
	 0odGXcgXmSCXt1h4CEhV89nI+ZIf5lg4Wz/51eejQUY8jludGYlhSKu3RsFmQTGTf+
	 Ps4qWYF+3qURu9pL3+G3UpFVFWX2qwpi1VVsX1T4Hj0ZV48DHfyMHfWQrH6Y5jXFVL
	 RlWNrRxmXBwMnrRR2hrJ9wsYIsX2ZkezffnXMZfT5Yn0GXooMNoxSCaYrputOsFJFL
	 mra5tJcelz8rQ==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>,
  <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,
  "Venkateswara Naralasetty" <quic_vnaralas@quicinc.com>
Subject: Re: [PATCHv5] wifi: ath11k: skip status ring entry processing
References: <20240429073624.736147-1-quic_tamizhr@quicinc.com>
	<35f114c4-1ff7-4a4b-aadf-ed147f19e170@quicinc.com>
	<87cyq7ota5.fsf@kernel.org>
	<4f9abe89-a004-45e8-b369-5c2b39bff440@quicinc.com>
Date: Fri, 03 May 2024 16:11:25 +0300
In-Reply-To: <4f9abe89-a004-45e8-b369-5c2b39bff440@quicinc.com> (Jeff
	Johnson's message of "Tue, 30 Apr 2024 08:14:16 -0700")
Message-ID: <871q6jnipu.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_061130_896853_ECA99EA2 
X-CRM114-Status: GOOD (  15.65  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

>> Also I removed one unrelated change and removed unnecessary else. Please
>> check my changes:
>> 
>> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=6e88d559268779107715008c51e006f7a5f62045
>
> So looking at the 'pending' change I have the observation that
> ath11k_dp_rx_mon_buf_done() only returns one of two values:
> DP_MON_STATUS_NO_DMA
> DP_MON_STATUS_REPLINISH
>
> And the return value handling has explicit handling for those values, without
> any logic for other values:
> +				if (reap_status == DP_MON_STATUS_NO_DMA)
> +					continue;
> +
> +				if (reap_status == DP_MON_STATUS_REPLINISH) {
>
> if we only expect these two values to ever be returned, then we could remove
> the testing for DP_MON_STATUS_REPLINISH since, it it isn't NO_DMA then it must
> be REPLINISH

Nice, I simplified this error handling now. Less indentation now which
is much better.

> + ath11k_warn(ab, "mon status DONE not set %lx, buf_id %d\n",
> + FIELD_GET(HAL_TLV_HDR_TAG, tlv->tl),
> +						    buf_id);
>
> I don't think we should log anything here. we already warn before calling the
> new function. if we get here it means the next buffer had DONE set so we can
> replenish the current buffer

Yeah, I removed the warning altogether. Please check my changes:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=49c28a9720959fb5daf702fe1732a716f3cff15c

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

