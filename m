Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B56DC6FA82
	for <ath11k@archiver.kernel.org>; Thu, 22 Sep 2022 07:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H8qLLswiOjQoHIPC1udOdgdqnF7/jM+ZDh6xHw5D1Po=; b=nlpoGary6Mchm7
	zdX723mT89UVFNtZxckQStWbMMg9BgaSg1zdOCURF8C3w6nBWccZr3BR+trG3TLToIr7OTGe2r78y
	Gijty5hUz8zSMyunkzUDXkW3eAohRM5U1T1/JSlxnP/w+RupvQmEG5A7VJ1/zY2+xikHbjCND2N2W
	ApBqDtyIaipqXRRgX/uR0XI2iz1yO2c9WXOd5GCoLiA54IvTOEiIU+FN4N3ITVMWIcWABiPsQwu65
	MqaHjJwiqRyxRvyfQKNYH5Tah0ElNttV29slM0JaXd71ZL++nu3doW/T7OVRRcM83NCBeSpViKMGw
	9cgFJ0tKYmVIyeQZuvPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obGRN-00Dl0R-4x; Thu, 22 Sep 2022 07:16:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obGRI-00Dkz8-23
	for ath11k@lists.infradead.org; Thu, 22 Sep 2022 07:16:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 92B1563416;
	Thu, 22 Sep 2022 07:16:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBD42C433C1;
	Thu, 22 Sep 2022 07:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663830963;
	bh=Ug3vdNZrUkehAQu0PPgU5X+QRZMeNzLGuhSE+RMFoqI=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=atBbsP5yZSiGDed0UEwbyYHSK+qTEfxtHlp3+BtfvI1XCMeRsPuo2wVdzQJr5wvIJ
	 6lemTDN78N2ofHRyJgJ+aw+Y+kGcZLu3BOlOgGypDBBt7CM8xQxe6lukG0WPEvymXu
	 M4wCMm1uD3nPvb53MSBT6wLHUoxOAQXzd2HEgGbi4hfzujmXvbtiBY7VUAkxrMlZwp
	 Po5W56bqHp3pT+3tuJ7hxsJKM+AChWjDfrMcau7VjEDyWzVBPvP+DqJVC8nQYfYoHq
	 pkR1shxy0JFbE5k7QkfYHoSXSl19FRW0GuC5k3fn4CpqaKRepbxAGBvDkXRt8s/6Po
	 MduKYyHZvB5FA==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath11k: change complete() to complete_all() for
 scan.completed
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220919024413.25083-1-quic_wgong@quicinc.com>
References: <20220919024413.25083-1-quic_wgong@quicinc.com>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_wgong@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <166383095879.28267.7782431891959207921.kvalo@kernel.org>
Date: Thu, 22 Sep 2022 07:16:01 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_001604_170309_10035F9D 
X-CRM114-Status: GOOD (  10.45  )
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

> Currently commit 1f682dc9fb37 ("ath11k: reduce the wait time of 11d scan
> and hw scan while add interface") introduced a wait_for_completion_timeout
> operation for ar->scan.completed, another one is existed in ath11k_scan_stop(),
> then ath11k has two places to wait for the ar->scan.completed and they
> run in different thread, thus it is possible to happend that the two
> thread both enter wait status. To handle this scenario, ath11k should
> change the complete() to complete_all() for the ar->scan.completed. This
> also work well when it is only one thread wait for ar->scan.completed.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

7855a6ed5cf7 wifi: ath11k: change complete() to complete_all() for scan.completed

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220919024413.25083-1-quic_wgong@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
