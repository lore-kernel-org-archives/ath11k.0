Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C4AC77B7E
	for <ath11k@archiver.kernel.org>; Thu,  1 Jun 2023 09:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UDzgmmtv+PMEW7goWYrFYMaq2rsx3fgpPGmUIOOjE60=; b=IKsL6vkdttWoHc
	ecBNZdc5bMBnnRH0SGLdvuJk0dWWox/o0JJZlkXP3JISARNumkMfi1Pslh8MM4xaFCgA3AfjG9dU0
	00kUpAu8RKUeoI0yMjsCIiG/62/uAci6rJRKIY0vImBwc9Nr/GcQyXVWX2GqsImcAXpe+8sSUTF6/
	xq30Ddd4pD7D7VaxRmafKZDzUWbsvBuS/YKYAAR1UI9vEzwH9GqDkvKNnWhdt8M5XKzS/V0Z69Uu0
	h1Vq+KZb+/XC27FanEyMZ79NynAkKpGAdapIlQ6ER/ccolNtv2COUQxLrpjF0aaIb3H7v2xJrvI64
	1LyxmWYci6T2jZ3Qb2NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4eXM-002ifI-19;
	Thu, 01 Jun 2023 09:24:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4eXJ-002iee-20
	for ath11k@lists.infradead.org;
	Thu, 01 Jun 2023 09:24:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E16BA64276;
	Thu,  1 Jun 2023 09:24:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64814C433EF;
	Thu,  1 Jun 2023 09:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685611440;
	bh=0O/GI9jziIcE0yjMclqjVCTlKdf6tJ8wFmi3ZOU/5vY=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=SPO8mQSJq4TScaZqcrB3UdhbYWsgwaaTivSNaa1ZuhFbA9XOt76JKWVWZKPHGISb9
	 boUC5jgBPM8Zz2tfswImC3lDPR+DGWX5i6IwPWhoMe1E4hmDhxOyMDLVizFWzEibH7
	 ozdeKphKmG9w6SyT4YRZ3HzRHyFnC1w9ULIroiARpLA1+IQ7nqtrVxm7g3qgPv5uW+
	 au71NCMfieoYboypMC9yWCf/sBW56nfBlmwIlVHG/QAYWaho9CHxOlxC6suuBPJ23C
	 QVfI794e7b7vUlE2CUTvtUI8UC1nJ44dUveFCAkTd7gO2ZblnFbZzokPvDHqQxfT3b
	 E7e23naon+P0g==
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
Message-ID: <168561143721.9854.3957851649423510026.kvalo@kernel.org>
Date: Thu,  1 Jun 2023 09:23:59 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_022401_698663_25E6C6E2 
X-CRM114-Status: UNSURE (   9.17  )
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
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

88ca89202f8e wifi: ath11k: add support default regdb while searching board-2.bin for WCN6855

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230517133959.8224-1-quic_wgong@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
