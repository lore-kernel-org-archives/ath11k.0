Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0A27C38A02
	for <ath11k@archiver.kernel.org>; Fri, 28 Oct 2022 13:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=94ecrt9qTAzeZmWus1ftMLxGHSNTwZvvdCvBhOtsi2c=; b=q53dTdCm8+ghuv
	655WE3SGmZOxdXODCwvvzi5FpxEW1WQhfGEFE8LsTSLE1bqRMuuzdxl+QUchA6jlchA9VxqBmeJgy
	ayr2Mo/NHJ6F0Wd6pBOSxp/GXtUy4UilcQLaHrhWwONEy3sFDY45ZwnNX6LBLgoFGYNDT9DyMTfHI
	DYhgWJbxq1JEoUeEHIv5d5sUjiJ8A4jNk6niSXW4QkSLCbXNoFD6cjsNgNk3wT3u6IeZJqw8TBEhL
	PwvI5/Nk97IY8wYQQ6SC+Jee8oYEHpDJi4n3KDvIA3Etj5OP7O8xSWk8/BMc/yFrBuNo7hL/DwcR8
	BGuT9wnTSCm1e9GFajPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooPbW-00HPNx-4o; Fri, 28 Oct 2022 13:40:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooPbS-00HPMr-Pa
	for ath11k@lists.infradead.org; Fri, 28 Oct 2022 13:40:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4DC666287E;
	Fri, 28 Oct 2022 13:40:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4F58C43143;
	Fri, 28 Oct 2022 13:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666964453;
	bh=80M5z3G6EudmtnIBuKj1K24+NxFXRZMki+pjSgoRv1A=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=I3h20+uyo/1OiHMzZQrWkxkcpzZAk4IzL9JudkSP8GNXSKGql74hytO3Y4EzB1eQg
	 T5jEnt5UISJYBZOsmi/8ZvOeUXi77bmyDqePe9CL1azCKoK4sUBnfaPv92xmTpky9g
	 A3xCnCZUA9q1QWBjSPFN+wlisycY0cimSNIyLnQuqXvAJQBX0/5INDdaQe9a0N3eX3
	 zEsbOIwqv6SbEKRpoXhCfz4Pg1QTID0lDxb+bq9FBv12QOivk3WE0V/0G30TE8N5MZ
	 soJ5T1mfp3FHR8SN21NkU0Lvs4qZjhsuOtjaq54RFB7w+SD/bfQDEfsej0p4W2BzM4
	 V/mbnDTqNwOtA==
MIME-Version: 1.0
Subject: Re: [PATCH v2] wifi: ath11k: fix monitor vdev creation with firmware
 recovery
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20221014155054.11471-1-quic_nmaran@quicinc.com>
References: <20221014155054.11471-1-quic_nmaran@quicinc.com>
To: Nagarajan Maran <quic_nmaran@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Nagarajan Maran <quic_nmaran@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <166696444811.2585.6793212023358512651.kvalo@kernel.org>
Date: Fri, 28 Oct 2022 13:40:52 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_064054_888188_F1C1858F 
X-CRM114-Status: GOOD (  10.26  )
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

Nagarajan Maran <quic_nmaran@quicinc.com> wrote:

> During firmware recovery, the monitor interface is not
> getting created in the driver and firmware since
> the respective flags are not updated properly.
> 
> So after firmware recovery is successful, when monitor
> interface is brought down manually, firmware assertion
> is observed, since we are trying to bring down the
> interface which is not yet created in the firmware.
> 
> Fix this by updating the monitor flags properly per
> phy#, during firmware recovery.
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Nagarajan Maran <quic_nmaran@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

f3ca72b03271 wifi: ath11k: fix monitor vdev creation with firmware recovery

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20221014155054.11471-1-quic_nmaran@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
