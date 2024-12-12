Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4332AE77180
	for <ath11k@archiver.kernel.org>; Thu, 12 Dec 2024 14:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9QS97HBENBxpe8403LN8srUbhPceiGYGkCtd6t/uNuk=; b=JkL/z9xhDp7fEvPXPzD9pYZFMo
	L/tJ0vv/zLYEeCTreHpN0Jmj81CQ2wmVUs4lZTQZ53EeKGOcogEIHRyRIshRLVlrMLEp94Z6U4gy9
	MRxs/rnzcniUbout7tYAwJEz3PqNKR6uKj4IJTjAqZSw+xeyuX2K7mIpizFp89HK5NDdh1Ii/WufH
	j9WYVBNgaJRfVAhWCCXnKn028KgIixJyQJKTiXy3DV+cnP/bLYj6YK1lOh7wWPlnNrh2SF6lH8m3B
	V7BtjUy3sc6Mk/MAfQpIeZH7dGs8JN7pX5t6r+vNzOx9BhxvLhMrmB0+poUiVssKUhOzi6m8SQR8F
	cgtQaKmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLjle-00000000YOZ-2qAj;
	Thu, 12 Dec 2024 14:02:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLjlc-00000000YNt-17WB
	for ath11k@lists.infradead.org;
	Thu, 12 Dec 2024 14:02:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4543C5C57BD;
	Thu, 12 Dec 2024 14:01:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F93EC4CECE;
	Thu, 12 Dec 2024 14:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734012131;
	bh=ovTK1jGKGDsAnJbJ0JS50A+5b+gNs6T5ryRElMlatoE=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=LpScoE+OxRRdwfC/TLTP0dGbvrMQsf8by0ZKQ8L+rt4FfBntF73J7WsL3mphiQMau
	 1ZLgPFcz1iQ/zuc0dg9n5Cxmcql9n7Z8+pKM6+RVGSVDZWr1r5YpgHyY3J8oEkafZ9
	 7U85gXRJKrw2Q5TEzfQC76x5fAkQxx2itjd0+B1NB8iENJ8+R3TLWLdn5dJnvzbzYg
	 OY6yw+lyUxKq2q0tw2Q4VbQO4IfCkpOMU4AcciJAAkJonL/5P6nbawq8iOaqiIKcU9
	 V00iEXIVZ9T21I07ybxvzuK+Tm4GkwGvUyUT9dcKrpvgIeMfMvU7OoS504Fvmu+rAp
	 3iPQ7dZiJclHQ==
From: Kalle Valo <kvalo@kernel.org>
To: Kang Yang <quic_kangyang@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v3 1/2] wifi: ath11k: move update channel list from
 update reg worker to reg notifier
References: <20241129070714.226-1-quic_kangyang@quicinc.com>
	<20241129070714.226-2-quic_kangyang@quicinc.com>
Date: Thu, 12 Dec 2024 16:02:08 +0200
In-Reply-To: <20241129070714.226-2-quic_kangyang@quicinc.com> (Kang Yang's
	message of "Fri, 29 Nov 2024 15:07:13 +0800")
Message-ID: <8734itov8f.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_060212_452912_34D5D231 
X-CRM114-Status: GOOD (  17.09  )
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
> Currently ath11k call regulatory_set_wiphy_regd() in ath11k_regd_update()
> to notify the reg domain change to cfg80211 and update channel list by
> reg_work, then ath11k immediately update channel list to firmware by
> ath11k_reg_update_chan_list().
>
> callstack:
> ath11k_regd_update
> ->regulatory_set_wiphy_regd
>            -> schedule_work(&reg_work)
> -> ath11k_reg_update_chan_list
>
> They are running in two threads, it leads the channel list data out of
> sync caused by muti-threads without synchronization. At this time,
> ath11k may update wrong channel list to firmware because the reg_work
> still running or even hasn't started yet. In this case, if the
> ath11k_reg_update_chan_list accesses an improperly updated channel list
> before reg_work is completed, it may result in out of bounds write
> errors, as shown in the KASAN report:
>
> BUG: KASAN: slab-out-of-bounds in ath11k_reg_update_chan_list
> Call Trace:
>     ath11k_reg_update_chan_list+0xbfe/0xfe0 [ath11k]
>     kfree+0x109/0x3a0
>     ath11k_regd_update+0x1cf/0x350 [ath11k]
>     ath11k_regd_update_work+0x14/0x20 [ath11k]
>     process_one_work+0xe35/0x14c0
>
> The correct flow is after reg_work update the channel list according to
> new reg domain, ath11k call ath11k_reg_update_chan_list() and update the
> new channel list to firmware.
>
> reg_call_notifier()(finally it will call ath11k_reg_notifier()) will be
> called to by reg_work to notify ath11k when it finishes the channel
> list update. So at this time, call ath11k_reg_update_chan_list() in
> reg_call_notifier() with initiator type NL80211_REGDOM_SET_BY_DRIVER.
> Then ath11k_reg_update_chan_list() will use the correct channel list.
>
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3
>
> Fixes: f45cb6b29cd3 ("wifi: ath11k: avoid deadlock during regulatory update in ath11k_regd_update()")
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>

The commit message would need significant work to make it more
understandable, I feel that it's just explaining call flows. But clearly
describing the problem and the design how it's solved would be a lot
more helpful.

Jeff had good guidance how to write a good commit message but I don't
have a link at hand right now.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

