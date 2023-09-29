Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECDF8E71D31
	for <ath11k@archiver.kernel.org>; Fri, 29 Sep 2023 13:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8LMWVXswCPFtvCRp2ZhlyzsGH7YOd14xLVY9DZEfaqM=; b=deHV7DhYf9OMdb
	5VmBxXVPSQ7qFL7D5xGUONY4SG6dmpOvICuNRMwjjbxALX0OuWhHiMePIGKD/jwyRmiRbhSQwCAKt
	HjmW1OnIHs/dtKYvdVL08Tu9piNcvIVsGEcvx7l7aTmjF5eTk6KtDZOTWN7RmxmSvHMCWg5q8kWyQ
	nr8+wTGf5cQs/Inl4kULqQCYsb4PoKJciyLHvdk3EkonHa7rAuTWb+ebiD8WNGnLMCia26p1Mgblo
	ddxSKHvm7m3WprWGWESnFgbtprevKHB/qdz6xOO8U7XBcdiAVFc0vhzBWKzf2Oh+wD5X/W1/qN/6W
	4hwL5URHQ7YcQa/ziA6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qmDNx-007x1m-1z;
	Fri, 29 Sep 2023 13:18:25 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qmDNu-007x1G-03
	for ath11k@lists.infradead.org;
	Fri, 29 Sep 2023 13:18:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 34631B81E9D;
	Fri, 29 Sep 2023 13:18:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FA30C433C8;
	Fri, 29 Sep 2023 13:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695993499;
	bh=6eCocSUXWWHZqvMeL461G2ax4/sd6yLCuIpByV7gpgA=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=W0kUAD67zjoz8TpDNUCmCqzvkKZ5S/ZaWL0sg2YmC/Y76uiOfpaCPyXp0X7VyfUIg
	 vGrO6geS6aoaeQV/ajGS6Uae8UHl7rzTBYHZ7AM5LkF0KFZtZ6qeM/plz186WDbp3G
	 LQ3jvudGfKciE9ezSdqwo5L3bk0FUbYZ2uTeOx7xGgoriHG+pW2QBL0+et2A0kgbiX
	 RZMztvijFaWju3o+3WZ5Y9wND32Y7VKyzyuKtf8IZmgs0U7MSi9ik3mfjqUAeKKP7l
	 TijbepUzz4DO2D+e8YNtEOO3g+k90PFHSg7sNbU1/pUAsBnL0pPWUG67heNXXhB9yJ
	 p6RyWdtcgNb+A==
MIME-Version: 1.0
Subject: Re: [PATCH v6 09/13] wifi: ath11k: fill parameters for vdev set tpc
 power
 WMI command
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230920082349.29111-10-quic_wgong@quicinc.com>
References: <20230920082349.29111-10-quic_wgong@quicinc.com>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_jjohnson@quicinc.com>, <quic_wgong@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169599349616.3629319.16079411629041044676.kvalo@kernel.org>
Date: Fri, 29 Sep 2023 13:18:18 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230929_061822_205235_1CCF696B 
X-CRM114-Status: UNSURE (   5.39  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Wen Gong <quic_wgong@quicinc.com> wrote:

> Prepare the parameters which is needed for WMI command WMI_VDEV_SET_TPC_POWER_CMDID.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

And this also added new warnings:

drivers/net/wireless/ath/ath11k/mac.c: In function 'ath11k_mac_fill_reg_tpc_info':
drivers/net/wireless/ath/ath11k/mac.c:7791:13: error: variable 'oper_freq' set but not used [-Werror=unused-but-set-variable]

drivers/net/wireless/ath/ath11k/mac.c:7731: Possible repeated word: 'the'
drivers/net/wireless/ath/ath11k/mac.c:7755: Possible repeated word: 'the'

I fixed them in the pending branch:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=c9f905ac838d9a7d79adb49951c7b0579d020c0a

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230920082349.29111-10-quic_wgong@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
