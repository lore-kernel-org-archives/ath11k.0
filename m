Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66FDDD41C38
	for <ath11k@archiver.kernel.org>; Wed, 13 Nov 2024 11:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=27IL78knNrE4tNNraKH4K1uVbGu59kI1WnbSWbPBGoI=; b=LsfwUMRT7lyXVGOdMuLRRRD9qS
	LiyRifuE3JIdvOUzOWUmZwE+K/cQGr5SlG1yhNeOVhIlqCKYEuHXxkor0mVI/KKSngszVRDMf6jUV
	Z8eo/80cfcBJdMhyC1HDGZTf8+fc8SiZddYYTs+b8Av5qAYtdYuxXCnatu5BeRaXYH5iDDXRSdtD8
	IiIUvTx7zR4RyAZzjU4Lm7N52hZ8yoO+UySWId36/1EIIhe5y2B0NYxeYu2qdb7X3Tc2RCAkf2Tjx
	l2iJItH/nG4HbzhSGG0Rr2wxGHUXvGGqLUpYTYFW+QjF00lQ8p29qrj6Nwq1tPiyNI2+RQRrz770S
	Yd/LZ3Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBBLg-00000006YxJ-02y8;
	Wed, 13 Nov 2024 11:15:48 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBBLc-00000006Yuj-0pdL
	for ath11k@lists.infradead.org;
	Wed, 13 Nov 2024 11:15:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 71FC7A40278;
	Wed, 13 Nov 2024 11:13:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D834C4CECD;
	Wed, 13 Nov 2024 11:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731496542;
	bh=S4ycrZQStn8QOXaCZpRMOEP63ygGEe01jCW5MGzRT7g=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=JG3YiJvmboyG7gA3xaZCh2slDRsjhju+eCAfuchA7TqSXU7ldd9pUEgDD3mkeaGLi
	 0sDYejDT5v94Orub3esIi9qY/JC6TunKpYUVRvoHyNygjJHlNNScmc153aI2D3RvQT
	 ImIcH9v+LjBtGxC8J2RvSf3TzTq10x5G0HThgt5ZSelVy7HgviYJvqTPRFSrF25fmx
	 APJ2GLPkClnIqKOk+xTh06eUZ/8Fm6dLFWadByY9YQnx+WeFSm10KcKTTWVzHiZzpE
	 U5TlzUHafmx+3zMeBIuWc3YDY01YiYp84v/y5w5dhA3736ARwGfW95x8AYOq+Kj301
	 nc+5b1ZUi5VHg==
From: Kalle Valo <kvalo@kernel.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 2/6] wifi: ath11k: don't use static variables in
 ath11k_debugfs_fw_stats_process()
References: <20241113015631.3105-1-quic_bqiang@quicinc.com>
	<20241113015631.3105-3-quic_bqiang@quicinc.com>
Date: Wed, 13 Nov 2024 13:15:39 +0200
In-Reply-To: <20241113015631.3105-3-quic_bqiang@quicinc.com> (Baochen Qiang's
	message of "Wed, 13 Nov 2024 09:56:27 +0800")
Message-ID: <87y11n1j1g.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_031544_372583_5E500D00 
X-CRM114-Status: GOOD (  10.68  )
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

> Currently ath11k_debugfs_fw_stats_process() is using static variables to count
> firmware stat events. Taking num_vdev as an example, if for whatever reason (
> say ar->num_started_vdevs is 0 or firmware bug etc.) the following condition
>
> 	(++num_vdev) == total_vdevs_started
>
> is not met, is_end is not set thus num_vdev won't be cleared. Next time when
> firmware stats is requested again, even if everything is working fine, we will
> fail due to the condition above will never be satisfied.
>
> The same applies to num_bcn as well.
>
> Change to use non-static counters so that we have a chance to clear them each
> time firmware stats is requested. Currently only ath11k_fw_stats_request() and
> ath11k_debugfs_fw_stats_request() are requesting firmware stats, so clear
> counters there.
>
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.37
>
> Fixes: da3a9d3c1576 ("ath11k: refactor debugfs code into debugfs.c")
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>

Yikes, good catch!

Acked-by: Kalle Valo <kvalo@kernel.org>

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

