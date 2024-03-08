Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52381C5475B
	for <ath11k@archiver.kernel.org>; Fri,  8 Mar 2024 15:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=woIf9T8uSlpVHu/7H0wt/8FmJV/bkGZ12WLIZF6/swc=; b=g//AdmEC2fMKDgHyodO6ilw/Wx
	s0JtSdm+yqTemPg9Vxuvvw7B+6a+MNY+HoGG+pikHNcrsgvBs0hjGp8Q4r3sBd58guHDx/++m2wSy
	36l8aX8836LJm0raxTsO4KQ+f0NDvki6p/gHw10ecKgbv1pSjF2xdN/0JnduJkBgOn/53Q/Xqb/dl
	s2CnqB74Z2kDV4JXs0w9Mlu2J8CBpVWLXDDa/MCYRC0VwrwukXNk/WQlr7RDCIiPFECTTYGe/kWO4
	5+SqGZjinmsxb47yB3yreTX7gLlMd73AVl62TA7CrtVbrbNz7MzGBaVYSnDh0bwD2P5VDJPkZwh2p
	HAVba86Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ribnY-00000009kZY-4Bit;
	Fri, 08 Mar 2024 15:06:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ribnW-00000009kYZ-1vPc
	for ath11k@lists.infradead.org;
	Fri, 08 Mar 2024 15:06:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 79F3D60B43;
	Fri,  8 Mar 2024 15:06:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10628C433F1;
	Fri,  8 Mar 2024 15:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709910369;
	bh=K47phgkDZNLRQ1Cerqn/YO0B/e7+sDQNzjKODd9H+eo=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=ZtGcnHti66X/DljK+xp8+Cd7ys/5i3rMLmiURoCflEE3GePKT0Z5XCpcHkEWLs1oG
	 l2/zXlaH3ynKhWz7s5fN0pXOd/f8v0VjWaXd4ghd+5By67oeb7T6liJreLN0cqlfNS
	 Abi/LsQnbjVR61DwaUiSINWDmISKRm8znQbuQd1gVGeCEOkrvGDktE/wdt8YQy+CuF
	 fF8oj5dH+AM6Nr1OQeE7qdpjjUTulsKLAk/RgcksjUep6G+03Ubrf2bEGDPBUx6hoT
	 S/tBIjkKPN5yxcCks1DvM5QBRqSk+BhtAm+X7EzvGxbQk6urXbWJGn3L4n9tz6G+s0
	 gpMVGaxjKstaQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: ath11k: fix soc_dp_stats debugfs file permission
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240305-fix-soc_dp_stats-permission-v1-1-2ec10b42f755@quicinc.com>
References: <20240305-fix-soc_dp_stats-permission-v1-1-2ec10b42f755@quicinc.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, <ath11k@lists.infradead.org>,
 <linux-wireless@vger.kernel.org>, <linux-kernel@vger.kernel.org>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <170991036603.1311983.8197697439450200231.kvalo@kernel.org>
Date: Fri,  8 Mar 2024 15:06:07 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240308_070610_587589_E4B7A945 
X-CRM114-Status: UNSURE (   6.20  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> wrote:

> Currently the soc_dp_stats debugfs file has the following permissions:
> 
> # ls -l /sys/kernel/debug/ath11k/pci-0000:03:00.0/soc_dp_stats
> -rw------- 1 root root 0 Mar  4 15:04 /sys/kernel/debug/ath11k/pci-0000:03:00.0/soc_dp_stats
> 
> However this file does not actually support write operations -- no .write()
> method is registered. Therefore use the correct permissions when creating
> the file.
> 
> After the change:
> 
> # ls -l /sys/kernel/debug/ath11k/pci-0000:03:00.0/soc_dp_stats
> -r-------- 1 root root 0 Mar  4 15:15 /sys/kernel/debug/ath11k/pci-0000:03:00.0/soc_dp_stats
> 
> Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

fa645e663165 wifi: ath11k: fix soc_dp_stats debugfs file permission

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240305-fix-soc_dp_stats-permission-v1-1-2ec10b42f755@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


