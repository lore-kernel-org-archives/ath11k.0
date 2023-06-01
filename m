Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADF33C77B7A
	for <ath11k@archiver.kernel.org>; Thu,  1 Jun 2023 09:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WHnoaOhgxislXT9yE+9anc7emrZwwsVZm1Ax2JRxF4Y=; b=VPQtGsKVrBJ1Qa
	GpjiSTLYkunOp0J6TnTPQL3QltY0kj6FzLYYA+NhkY+EfVNTLTKgKgXj4QdZrraOB67ltXj7CJ7bv
	DX9LtOnMAFpg6Bn900glFhRviSRjRFFMgZQ4A+6UfOWYOLgM1KoxrpAuBy92Ho6FoREVDPmsqMGTw
	eHY4qK/FSXwAFxwKK6fnE8fTHZRwoSDEDnCCUtZOM4M76ysGbkAEGapeoC9NDNsHC5m9bI75OxsJ4
	SiZvteLs87XJJd9Wcxky8+X0yf6aziBHKVMoK6LG1BwCWKto4Rer9GHonuOa+ZrQBaJ9wbrj37JAX
	dnw6WGr3A2ELXNZ8T4ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4eYM-002ipq-1B;
	Thu, 01 Jun 2023 09:25:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4eYJ-002ipE-2n
	for ath11k@lists.infradead.org;
	Thu, 01 Jun 2023 09:25:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 66A1963910;
	Thu,  1 Jun 2023 09:25:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D59A5C433EF;
	Thu,  1 Jun 2023 09:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685611502;
	bh=QUpFX8TzSeS4OFWHtYr+Ii6AOKAmtix/AvEx1TKSDp8=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=kB6dWe1AKyx1mmdweucfx8wK76XuW3MR2xR9jCsQNJCLnYZrNWnA1Mp9XECqP+MZ4
	 v0WTzt4BzrrP6GAUIp02DzSASxWkKjU4XoSOs2iLI8TscdB9rfmBO8QD3Q1I6GfqVW
	 WW0gXTgQ7Rk5uz3/LS2ZEI59S7gnpyJG3Y67qUp3bsEUQ8s9vxGVzawTu7QsmcML2I
	 dwvw//8lYryHg7NDRJqcqa+dEqqCh2pIrOTXqG/SZiwMaDWafD/BYJYXNkqq9rSHie
	 16v6n+LMjZToFiD5l66NuLy4THxvW0+mH4DuF8ce3ok2cDVR3ySD9P4PTv3sXWfwVz
	 cIWGCIHrjkMnA==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath11k: add support default regdb while searching
 board-2.bin for WCN6855
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230517133959.8224-1-quic_wgong@quicinc.com>
References: <20230517133959.8224-1-quic_wgong@quicinc.com>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_wgong@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <168561149978.9854.14528391508083109613.kvalo@kernel.org>
Date: Thu,  1 Jun 2023 09:25:01 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_022503_945239_B7C74A6B 
X-CRM114-Status: UNSURE (   9.15  )
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

> Sometimes board-2.bin does not have the regdb data which matched the
> parameters such as vendor, device, subsystem-vendor, subsystem-device
> and etc. Add default regdb data with 'bus=%s' into board-2.bin for
> WCN6855, then ath11k use 'bus=pci' to search regdb data in board-2.bin
> for WCN6855.
> 
> kernel: [  122.515808] ath11k_pci 0000:03:00.0: boot using board name 'bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=3374,qmi-chip-id=2,qmi-board-id=262'
> kernel: [  122.517240] ath11k_pci 0000:03:00.0: boot firmware request ath11k/WCN6855/hw2.0/board-2.bin size 6179564
> kernel: [  122.517280] ath11k_pci 0000:03:00.0: failed to fetch regdb data for bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=3374,qmi-chip-id=2,qmi-board-id=262 from ath11k/WCN6855/hw2.0/board-2.bin
> kernel: [  122.517464] ath11k_pci 0000:03:00.0: boot using board name 'bus=pci'
> kernel: [  122.518901] ath11k_pci 0000:03:00.0: boot firmware request ath11k/WCN6855/hw2.0/board-2.bin size 6179564
> kernel: [  122.518915] ath11k_pci 0000:03:00.0: board name
> kernel: [  122.518917] ath11k_pci 0000:03:00.0: 00000000: 62 75 73 3d 70 63 69                             bus=pci
> kernel: [  122.518918] ath11k_pci 0000:03:00.0: boot found match regdb data for name 'bus=pci'
> kernel: [  122.518920] ath11k_pci 0000:03:00.0: boot found regdb data for 'bus=pci'
> kernel: [  122.518921] ath11k_pci 0000:03:00.0: fetched regdb
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3

BTW, the latest firmware version is:

WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23

You really should update your firmware, avoid using old firmware releases.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230517133959.8224-1-quic_wgong@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
