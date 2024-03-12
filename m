Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B294C54E5D
	for <ath11k@archiver.kernel.org>; Tue, 12 Mar 2024 15:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9KXamnDTq0ahhizFFFO2G1XNhGR1aO6N+9YDezLmQTQ=; b=1EC6TX3TrULrDgJDuv+bwi3rib
	7EdwILEUczysWGO9Ifnp61ybx0mVGSem85dF4a1Fe0qXz14mhHnclgZpIpwvRDSQVyQBxorRwM9Ve
	1lgqqfrxuOW0PUggK+WkGd0vIpBXVmXKSEd1U2P916UqKrb7VJOqEVv4MsHQZ81zaNZM7ga3T8d8W
	C9+xGSohv4+1QpPbI1upwKEjlLEPMGrPoQPXEPqq4XqivzTcXxXxl/+xTS0t/oCdcNApCkXHaipve
	ccxn5GEtu163GMstOtg1ZcldmCUXLgUl/gK0ji+Cby6JY3ubnQmfeX4xNDvx4ahekAZnUKkEL56eL
	2pb5b+gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk4Ig-00000006QTI-0irw;
	Tue, 12 Mar 2024 15:44:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk4Ic-00000006QSh-1lzi
	for ath11k@lists.infradead.org;
	Tue, 12 Mar 2024 15:44:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CB51060F03;
	Tue, 12 Mar 2024 15:44:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25F0DC43390;
	Tue, 12 Mar 2024 15:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710258257;
	bh=snpqoaWKx8iTXyE2sCbCJPAM5Y7erY06kxvvCuQSX40=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=kHQ3wnPdos0Weuu7tWpl2eoIblEHFdZJbAPZ3lbwAwx5Dk7v2Haq35rKDKwmcYixW
	 CvsltBENLsCxSm6jtePFJk21jxwjcUyZC6rw+8wj+cLyiYVIUze6+SMEY69ONDPzE/
	 +YLGgzptUAyLm8u9fLJk/TAdz13Qsi3HysfQMtPYPZrGfGYRduVV3PASv8HqgE16lm
	 1RwOs1N8rfPdHGnmgP5XGordeXGVUb8gK9QIfDiYzw0W2FmlpYecwYFJPprAisIdM9
	 0hrVtqfG5AbuQWEw3neJAdFX9RGXUGp8byLLZB3VgBrhkyUek9e1cFjbplxTvYohl+
	 O4CNWr/D+bHaQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: ath11k: don't force enable power save on
 non-running
 vdevs
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240309113115.11498-1-quic_bqiang@quicinc.com>
References: <20240309113115.11498-1-quic_bqiang@quicinc.com>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_bqiang@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171025825444.2014319.13788313325908699695.kvalo@kernel.org>
Date: Tue, 12 Mar 2024 15:44:15 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_084418_589269_D20B13BF 
X-CRM114-Status: GOOD (  15.34  )
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

Baochen Qiang <quic_bqiang@quicinc.com> wrote:

> Currently we force enable power save on non-running vdevs, this results
> in unexpected ping latency in below scenarios:
>         1. disable power save from userspace.
>         2. trigger suspend/resume.
> 
> With step 1 power save is disabled successfully and we get a good latency:
> 
> PING 192.168.1.1 (192.168.1.1) 56(84) bytes of data.
> 64 bytes from 192.168.1.1: icmp_seq=1 ttl=64 time=5.13 ms
> 64 bytes from 192.168.1.1: icmp_seq=2 ttl=64 time=5.45 ms
> 64 bytes from 192.168.1.1: icmp_seq=3 ttl=64 time=5.99 ms
> 64 bytes from 192.168.1.1: icmp_seq=4 ttl=64 time=6.34 ms
> 64 bytes from 192.168.1.1: icmp_seq=5 ttl=64 time=4.47 ms
> 64 bytes from 192.168.1.1: icmp_seq=6 ttl=64 time=6.45 ms
> 
> While after step 2, the latency becomes much larger:
> 
> PING 192.168.1.1 (192.168.1.1) 56(84) bytes of data.
> 64 bytes from 192.168.1.1: icmp_seq=1 ttl=64 time=17.7 ms
> 64 bytes from 192.168.1.1: icmp_seq=2 ttl=64 time=15.0 ms
> 64 bytes from 192.168.1.1: icmp_seq=3 ttl=64 time=14.3 ms
> 64 bytes from 192.168.1.1: icmp_seq=4 ttl=64 time=16.5 ms
> 64 bytes from 192.168.1.1: icmp_seq=5 ttl=64 time=20.1 ms
> 
> The reason is, with step 2, power save is force enabled due to vdev not
> running, although mac80211 was trying to disable it to honor userspace
> configuration:
> 
> ath11k_pci 0000:03:00.0: wmi cmd sta powersave mode psmode 1 vdev id 0
> Call Trace:
>  ath11k_wmi_pdev_set_ps_mode
>  ath11k_mac_op_bss_info_changed
>  ieee80211_bss_info_change_notify
>  ieee80211_reconfig
>  ieee80211_resume
>  wiphy_resume
> 
> This logic is taken from ath10k where it was added due to below comment:
> 
>         Firmware doesn't behave nicely and consumes more power than
>         necessary if PS is disabled on a non-started vdev.
> 
> However we don't know whether such an issue also occurs to ath11k firmware
> or not. But even if it does, it's not appropriate because it goes against
> userspace, even cfg/mac80211 don't know we have enabled it in fact.
> 
> Remove it to fix this issue. In this way we not only get a better latency,
> but also, and the most important, keeps the consistency between userspace
> and kernel/driver. The biggest price for that would be the power consumption,
> which is not that important, compared with the consistency.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
> 
> Fixes: b2beffa7d9a6 ("ath11k: enable 802.11 power save mode in station mode")
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

01296b39d351 wifi: ath11k: don't force enable power save on non-running vdevs

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240309113115.11498-1-quic_bqiang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


