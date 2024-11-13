Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F37D41C38
	for <ath11k@archiver.kernel.org>; Wed, 13 Nov 2024 11:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a6ObfgRqgQZ+0P/9MYzrsGYrN6CKHB674x/6O/khsn0=; b=sGiR3JudRcM5K5wZm5EAS2aSQW
	Lb5D1BajhqEHxaJkedL/zD6ul0aMnrdytOr3/0jx0UIgHR/IdCI4KVnSuVcxv1uKQtLFIvPqyKRqN
	qSqJ9MrVZ7L8d2DuRFiVcjumkp7JFf21bGEKf92xpqWBzBTUU5+wchAaSEvOdyTz6cx2lZCVt3UPe
	QgWafaj5c/7mGNbKbs6govax16IbLHbJxAaB0JlXmfeA5NkZtqDePcy8pCnXYsuytdtfIfdB4TPnI
	MDcTQgmTKGUV45SM0qvda8xkmSEia4piQ4XY9i2wPFDPkidKpUUPU5KcHa4uvYe9R1+IxXX+jVJCv
	ANgPvEOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBBLx-00000006Z4m-0oOz;
	Wed, 13 Nov 2024 11:16:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBBLu-00000006Z3M-1tyO
	for ath11k@lists.infradead.org;
	Wed, 13 Nov 2024 11:16:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 938935C5938;
	Wed, 13 Nov 2024 11:15:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0A3DC4CED2;
	Wed, 13 Nov 2024 11:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731496561;
	bh=ib+bJZucry4VIQl+otQGDjYYRhXSZRpJohf6xBckVGQ=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=gy2UN4v32YOlsxr60i4MDuH2FiaL3+mUmBbLroP9NsVfz+2aI3Xkloxhj472FIYFW
	 /KhcbpEPt6zqcvWEjoghwBF8FmwibWe+hcnhEfUR6R7LwzcUWSbO8jdwlX+cjnN1Ff
	 cjZ6GFc4o6GfsIqr/i2ivSAEBRkhEbELvnsjj9N63YeAci6nStiJ6NZRDuaRyut0GA
	 ZJPMj35L85mb2/Zu0FOjn8NIbY3fWCQsP8tyPGfpdybj/VTaCGOfoPzi/xWqQ4V1vc
	 M8FvBqmycqXjrlhcI48XoA4UvkVoPMRqGkfeuQA/IDBkuAwOOvTV7tYjhMUlu44CBW
	 p63r/IjsrCCIA==
From: Kalle Valo <kvalo@kernel.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 4/6] wifi: ath11k: adjust unlock sequence in
 ath11k_update_stats_event()
References: <20241113015631.3105-1-quic_bqiang@quicinc.com>
	<20241113015631.3105-5-quic_bqiang@quicinc.com>
Date: Wed, 13 Nov 2024 13:15:58 +0200
In-Reply-To: <20241113015631.3105-5-quic_bqiang@quicinc.com> (Baochen Qiang's
	message of "Wed, 13 Nov 2024 09:56:29 +0800")
Message-ID: <87ttcb1j0x.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_031602_552559_DAE12B33 
X-CRM114-Status: UNSURE (   7.74  )
X-CRM114-Notice: Please train this message.
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

Baochen Qiang <quic_bqiang@quicinc.com> writes:

> Currently RCU lock and ar->data_lock are acquired in a sequence of
>
> 	rcu_read_lock()
> 	spin_lock_bh(&ar->data_lock)
>
> but released in a sequence of
>
> 	rcu_read_unlock()
> 	spin_unlock_bh(&ar->data_lock)
>
> Although there are no apparent issues with this, reorder them to
> achieve symmetry.
>
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.37
>
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>

Acked-by: Kalle Valo <kvalo@kernel.org>

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

