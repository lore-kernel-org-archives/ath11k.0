Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D421EC4332F
	for <ath11k@archiver.kernel.org>; Wed, 21 Dec 2022 12:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LpWWKXkrt/CIwGV3nBnS92ZyyFCwPCTvqzluI9iAu6I=; b=iMthcSCAqgbjDz
	tP/18K93jI1+x95b3hcyUQYCaeETjVWR2hn/Thd4OpCajdMJi4pZnibY+byqJWVZD4IszKSC7Vs9d
	BgicODmZWsG0vu5UaNfteu9mzFzqGd1SNHIUGzdPbL0yFDPH/QW1QxbmiAZAfDg+N/8wMSINySG1V
	95cAf0H/GIu99ysuefBoDrFVIw+2eI9lakowJ9164ouImnzWDC+G4uXSDRb6C2e2bMXhqSH6BMCPK
	RhrI/nQLuSBcPANWRWTZybUcZrjV0OPyuXNvd6j529yvv7y/99B2mJ3fWc6UifwhkggzsWdMBLlkD
	0YirjBBFz+2/Eil4BZZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7ye7-00Er9q-8g; Wed, 21 Dec 2022 12:56:31 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7yYk-00EolT-3O
	for ath11k@lists.infradead.org; Wed, 21 Dec 2022 12:50:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 808DEB81B6A;
	Wed, 21 Dec 2022 12:50:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F189CC433EF;
	Wed, 21 Dec 2022 12:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671627050;
	bh=w+bo5wdpOHW/2setB3OgJQMiL7ZmgUaSvGy1sczlENE=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=o6VyS4vmhWELQt7vRJowldL221EnYDOQNjgwY+/715tL89woKITSWRa+tP+2Y5Uva
	 hu0+Vww65jROMY04gSkH+5s2DsR3+jbGjIrh55ilUqlmIFxIJjxeGAl551VRswlqQe
	 5z/8Gv2zk8wqS+/00YqHjCgpSdCd6Od+zu6r/nWqU5XNCUG0G/JpECXTec+3eiQxoB
	 S9hm4UzB60yTjMuxRNLiLWEWh35Lnp8viuvVzDdZcxnAosqUUbTP7JLvudvVlO6yuJ
	 p/n+I8otzRM/Xbdm/exaikYRbO33iqy7NsRbTutPDS284LAqdS3pWz5I/3P8AoSJLK
	 mC2i3uoGQWzcg==
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/3] wifi: ath11k: add support to parse new WMI event
 for 6
 GHz
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20221214164639.31542-3-quic_adisi@quicinc.com>
References: <20221214164639.31542-3-quic_adisi@quicinc.com>
To: Aditya Kumar Singh <quic_adisi@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Aditya Kumar Singh <quic_adisi@quicinc.com>,
 Lavanya Suresh <quic_lavaks@quicinc.com>, Wen Gong <quic_wgong@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <167162704604.23347.8011938867680129068.kvalo@kernel.org>
Date: Wed, 21 Dec 2022 12:50:48 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221221_045058_361945_F3DA5A36 
X-CRM114-Status: GOOD (  10.13  )
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

Aditya Kumar Singh <quic_adisi@quicinc.com> wrote:

> In order to support different power levels of 6 GHz AP and client,
> new WMI event for regulatory - WMI_REG_CHAN_LIST_CC_EXT_EVENTID is
> added in firmware. This event provides new parameters required for
> 6 GHz regulatory rules.
> 
> Add support for parsing 2.4 GHz, 5 GHz and 6 GHz reg rules and other
> parameters from WMI_REG_CHAN_LIST_CC_EXT_EVENTID.
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
> 
> Reported-by: kernel test robot <lkp@intel.com>

I don't think using Reported-by is correct here. You are
adding a new feature, not fixing a bug reported the bot.

> Signed-off-by: Lavanya Suresh <quic_lavaks@quicinc.com>
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

This patch added new checkpatch warnings, they were too complex for me to fix them:

drivers/net/wireless/ath/ath11k/reg.c:678: line length of 92 exceeds 90 columns
drivers/net/wireless/ath/ath11k/wmi.h:4090: Please don't use multiple blank lines
drivers/net/wireless/ath/ath11k/wmi.h:4212: line length of 92 exceeds 90 columns
drivers/net/wireless/ath/ath11k/wmi.c:5002: line length of 91 exceeds 90 columns
drivers/net/wireless/ath/ath11k/wmi.c:5102: line length of 94 exceeds 90 columns
drivers/net/wireless/ath/ath11k/wmi.c:5208: line length of 91 exceeds 90 columns
drivers/net/wireless/ath/ath11k/wmi.c:5209: line length of 92 exceeds 90 columns
drivers/net/wireless/ath/ath11k/wmi.c:5235: line length of 95 exceeds 90 columns
drivers/net/wireless/ath/ath11k/wmi.c:5298: line length of 91 exceeds 90 columns

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20221214164639.31542-3-quic_adisi@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
