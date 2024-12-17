Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC0E5E77184
	for <ath11k@archiver.kernel.org>; Tue, 17 Dec 2024 14:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F1DBwzVsolSUhrei5QahZ4bEvU7Y0xBPFO/xvdm+okI=; b=bjn/gt1ZOFF+pA70pROsfYSc/l
	107yxTqbp95neTnMX/3TSQEyd4FEcbD8r6vTYOrawNU/Guai+3Gw/ualDVt2fV7Xzq3q9Mvfkf1e7
	DEqcE8rwnrxrTh8Zl9uhPkAbRCkxpaxza94nZw5+YK7MDnAZhZzp+BZKBx/ntntN6YLx4zGS0Vbz9
	JqIAULfijTQmym/aKHM4bq710DTDa3sqETZ4UZozU/r8qV/yxi8JkHh4xqqU+Hjz9xRPog08cHVIK
	gKg//2KMwTPV5ExoPUGdROKGI4mJosPbgSxG/U/aZUBqk2y1FiZwdgweypj4NCNM+qJg+Cluoe/FV
	Go+fm7Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNYqV-0000000DopP-1n40;
	Tue, 17 Dec 2024 14:46:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNYpo-0000000DoiE-0JXu
	for ath11k@lists.infradead.org;
	Tue, 17 Dec 2024 14:46:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 76F505C60EF;
	Tue, 17 Dec 2024 14:45:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90348C4CED4;
	Tue, 17 Dec 2024 14:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734446763;
	bh=pOoZRHsdKE7v2ECFsEVSpOwoH9Mz2gzKsGXQgVL/M/4=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=p62oys+WEA21wxHLd1fk3m6T8Xhp5dfIPRF1njFgqLUL8kGyZMzaMw8Km823iOx2r
	 fBRZNjwfL4zPvATmF1LQAr23O/HM9+DuRpJRZKmSfnNqfXSXNU58toASWN0y/suL+s
	 iTOCZrKyFFRS7IJSdfpDVodPm5QQ8iqG2cH+ULcgkF+Rmoanb9KMhO0uoTh8rEtWvl
	 MnuiEQBQXzSy0uXL3hs9aFVMQ8Ar97zHPQQp0cvp/4UPx6cKw68fexD3JFkCkQaI/N
	 Y/hOXF+mf0752uYNIxRVorgYpy+gk/6IIIWMEOcbc+XTqPX8AI5/MYeQ3h/pt/sEiT
	 1+a+3g2Fn2k7A==
From: Kalle Valo <kvalo@kernel.org>
To: Kang Yang <quic_kangyang@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] wifi: ath11k: move update channel list from
 update reg worker to reg notifier
References: <20241213093909.629-1-quic_kangyang@quicinc.com>
	<20241213093909.629-2-quic_kangyang@quicinc.com>
Date: Tue, 17 Dec 2024 16:46:00 +0200
In-Reply-To: <20241213093909.629-2-quic_kangyang@quicinc.com> (Kang Yang's
	message of "Fri, 13 Dec 2024 17:39:08 +0800")
Message-ID: <87frmmmkpj.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_064604_153699_DC8B8315 
X-CRM114-Status: GOOD (  14.01  )
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

Kang Yang <quic_kangyang@quicinc.com> writes:

> From: Wen Gong <quic_wgong@quicinc.com>
>
> Currently when ath11k gets new channel list, it will mainly do two things
> in ath11k_regd_update():
> 1. update channel list to cfg80211 by reg_work.
> 2. update cfg80211's channel list to firmware by
> ath11k_reg_update_chan_list().
>
> Flow:
> ath11k_regd_update
> ->regulatory_set_wiphy_regd
>         -> schedule_work(&reg_work)
>                 ->reg_work->reg_process_self_managed_hint
>                         ->handle_band_custom(update to cfg80211)
> -> ath11k_reg_update_chan_list(update to firmware)
>
> But ath11k_reg_update_chan_list() is immediately called after reg_work
> is queued. They are running in different threads. At this time,
> ath11k_reg_update_chan_list() may use a wrong channel list because
> handle_band_custom() may not be finished.
> This may result in out-of-bounds write errors:
> BUG: KASAN: slab-out-of-bounds in ath11k_reg_update_chan_list
> Call Trace:
>     ath11k_reg_update_chan_list+0xbfe/0xfe0 [ath11k]
>     kfree+0x109/0x3a0
>     ath11k_regd_update+0x1cf/0x350 [ath11k]
>     ath11k_regd_update_work+0x14/0x20 [ath11k]
>     process_one_work+0xe35/0x14c0
>
> So should make sure ath11k_reg_update_chan_list() is called after
> handle_band_custom() is finished.
>
> reg_process_self_managed_hint() will call reg_call_notifier() after
> handle_band_custom(). This function will call ath11k_reg_notifier(), so
> move ath11k_reg_update_chan_list() to ath11k_reg_notifier(). Then
> ath11k can update correct channel list to firmware.
>
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3
>
> Fixes: f45cb6b29cd3 ("wifi: ath11k: avoid deadlock during regulatory update in ath11k_regd_update()")
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>

I think the commit message should be completely rewritten, the idea here
is not to list functions and their call orders.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

