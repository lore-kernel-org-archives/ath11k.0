Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA4B4C46467
	for <ath11k@archiver.kernel.org>; Tue, 10 Jan 2023 13:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+RoO0I/Alua3dBzbUI8RM3JwNMWrTYFf4blS6gNY3hA=; b=U29/wEGH8NI6zH
	uT8xenRHRx+bGFl7mXJMPWaqHZgcglLaiFDrVQUeDyZd1CWtgabJMP345bStxQUx38fMR8dooc18p
	J0Sm+BnWUil4xFXYJn6Zi14YTHrvS2Wbd4dlUbjW5kzUwuucatdtXeOm3fia+9muXp3zKsX1tR8NE
	cRKkCO37SQlZCXrx5vLSb60Tgx3QJlQVl8rlRC30FCL1LPQICMBz7ZT5B3iiefpyZy3PfP+0CPlvb
	pOPOMWPrMrLsWO+6J3pjdWv+TZ1KrIQFzvoymid+bym+7GfPGsLGKvG1HcyNBYnW00owieQgsMpdg
	MTwtKe0t6KBkRTT5vJ3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFEew-0072qO-F5; Tue, 10 Jan 2023 13:27:22 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFEes-0072po-QB
	for ath11k@lists.infradead.org; Tue, 10 Jan 2023 13:27:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 17636B81630
	for <ath11k@lists.infradead.org>; Tue, 10 Jan 2023 13:27:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADCF8C433D2;
	Tue, 10 Jan 2023 13:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673357235;
	bh=fLMyic9Kl202nlqpBzKTc0Mqy/BXCOzUfblO7YoPzMI=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=T1YvgQMLwp7yUO4KNl6fBvq6w3+ujzpfRBb0KwbOjZ8a+KJI0L3ez+n3gAtRoqIC6
	 4AVN6ibArKnDb7w25SRIh+vK9ww+27L2cdHi+EMJzrRWV8UXFjGgjGn/SRigOITeuy
	 bQECpKYcWzhh/3VkoVqj1t5fypC3Gurfsw/11rW7f2X1zkWzz7AyuT9NMIlcATnIMg
	 1CAZe5Zb+eMsHRPVbEUEorE+e/yGd16uWfzmFw9qH3uVSAOc4LP15wMgZx2vz2k90t
	 q0j14kgEBLZhO2oqOtlodY+f+zxGaxJC1Qh5RxAto0t+ISRA+Ffx4B3mYgmwIXx8Ca
	 6LPzi0pSsNytg==
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: debugfs: fix to work with multiple PCI devices
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20221220121231.20120-1-kvalo@kernel.org>
References: <20221220121231.20120-1-kvalo@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <167335721814.4132.1940344098269572941.kvalo@kernel.org>
Date: Tue, 10 Jan 2023 13:27:14 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_052719_033399_4647BDA9 
X-CRM114-Status: GOOD (  14.26  )
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

Kalle Valo <kvalo@kernel.org> wrote:

> ath11k fails to load if there are multiple ath11k PCI devices with same name:
> 
>  ath11k_pci 0000:01:00.0: Hardware name qcn9074 hw1.0
>  debugfs: Directory 'ath11k' with parent '/' already present!
>  ath11k_pci 0000:01:00.0: failed to create ath11k debugfs
>  ath11k_pci 0000:01:00.0: failed to create soc core: -17
>  ath11k_pci 0000:01:00.0: failed to init core: -17
>  ath11k_pci: probe of 0000:01:00.0 failed with error -17
> 
> Fix this by creating a directory for each ath11k device using schema
> <bus>-<devname>, for example "pci-0000:06:00.0". This directory created under
> the top-level ath11k directory, for example /sys/kernel/debug/ath11k.
> 
> The reference to the toplevel ath11k directory is not stored anymore within ath11k, instead
> it's retrieved using debugfs_lookup(). If the directory does not exist it will
> be created. After the last directory from the ath11k directory is removed, for
> example when doing rmmod ath11k, the empty ath11k directory is left in place,
> it's a minor cosmetic issue anyway.
> 
> Here's an example hierarchy with one WCN6855:
> 
> ath11k
> `-- pci-0000:06:00.0
>     |-- mac0
>     |   |-- dfs_block_radar_events
>     |   |-- dfs_simulate_radar
>     |   |-- ext_rx_stats
>     |   |-- ext_tx_stats
>     |   |-- fw_dbglog_config
>     |   |-- fw_stats
>     |   |   |-- beacon_stats
>     |   |   |-- pdev_stats
>     |   |   `-- vdev_stats
>     |   |-- htt_stats
>     |   |-- htt_stats_reset
>     |   |-- htt_stats_type
>     |   `-- pktlog_filter
>     |-- simulate_fw_crash
>     `-- soc_dp_stats
> 
> I didn't have a test setup where I could connect multiple ath11k devices to the
> same the host, so I have only tested this with one device.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.9
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.5.0.1-01208-QCAHKSWPL_SILICONZ-1
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01208-QCAHKSWPL_SILICONZ-1
> 
> Tested-by: Robert Marko <robert.marko@sartura.hr>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

323d91d4684d wifi: ath11k: debugfs: fix to work with multiple PCI devices

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20221220121231.20120-1-kvalo@kernel.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
