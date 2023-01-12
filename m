Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E4FBC54EBD
	for <ath11k@archiver.kernel.org>; Thu, 12 Jan 2023 09:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aLeBAKN+e18FCI2C6jyk47tBlgcQg8Xt5VkNdhQrJzc=; b=Hhw4VBOtDXbUeF
	nSxMMihbe2BRliDPaCLJekD+Z2SEuVYJUzQx36rR0UVrPUVtP2+ayW2u+J6GBB9+NhlhS83TbBr3N
	za4cNJqvbla/5a3FiwO6ECVYUSU3dF10QwcEhB8sxCZb9Dh4OJciprWyqZIfetVpP/qCjrUywlocB
	vaFi9gMWxIuuT/nxbknggUnZ8G8Rj0reEpHpLLMXI1SG6+x0KHee8EPteivD91WDTuJaY6e+zxq5m
	eEIpKQFAtNk5QrgP6vPb/aDaO9WXjbaJRJGXEPgNvDEfQGyu2E0fMjoiSphrKd7orjzAy/hEFnsHG
	3ZbgseQbAVX9gjD8zA9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFtaS-00EI7H-KO; Thu, 12 Jan 2023 09:09:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFtaP-00EI5L-Ed
	for ath11k@lists.infradead.org; Thu, 12 Jan 2023 09:09:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E7A7A61FA0;
	Thu, 12 Jan 2023 09:09:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93078C433D2;
	Thu, 12 Jan 2023 09:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673514564;
	bh=rrrY0mwZBiE2S9b+NOyUnVV3BWYMdajkh1hhqZrk2vE=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=dGILvNc5uMcKYgPlrMWrBZnl+YW5fWCeWcMxMYJ01CrHU2xR5Owyniz+3EpXmeCav
	 vO7RkxlJlLga/N/qKBEiFfKaKbNnCOzadCESjovjUln8qmMD3bW3X5q8VISDEb/mm3
	 NFyEXVj/fVJV45ZqgkD1ec1uszwIkhnISsyWIdWKna0AP/ASa+ySMhl07Rosq5B6a+
	 4h2hmdsQ02tBk8kYdzaRRDerRs7rKQz1e22FRPpSas/lOG5oh52S0Cdr49NopQZNm8
	 E1cqGU3jUd6CJ+/PC2Ssu5+mguj8WDMEgE5GEyxbWu7lxFnI8HQn3xZsc1vVGbqBHG
	 mSXG8UN4p8FKw==
From: Kalle Valo <kvalo@kernel.org>
To: Robert Marko <robert.marko@sartura.hr>
Cc: ath11k@lists.infradead.org,  linux-wireless@vger.kernel.org
Subject: Re: [PATCH] ath11k: debugfs: fix to work with multiple PCI devices
References: <20221220121231.20120-1-kvalo@kernel.org>
	<CA+HBbNGBKemtF9ZsFBFCe7_1eqMJ80QhEPCsinOJY2LQ4+tiFg@mail.gmail.com>
Date: Thu, 12 Jan 2023 11:09:21 +0200
In-Reply-To: <CA+HBbNGBKemtF9ZsFBFCe7_1eqMJ80QhEPCsinOJY2LQ4+tiFg@mail.gmail.com>
	(Robert Marko's message of "Mon, 2 Jan 2023 16:42:55 +0100")
Message-ID: <87k01sdsqm.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_010925_615106_F80D1E8C 
X-CRM114-Status: GOOD (  16.39  )
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

Robert Marko <robert.marko@sartura.hr> writes:

> On Tue, Dec 20, 2022 at 1:16 PM Kalle Valo <kvalo@kernel.org> wrote:
>>
>> From: Kalle Valo <quic_kvalo@quicinc.com>
>>
>> ath11k fails to load if there are multiple ath11k PCI devices with same name:
>>
>>  ath11k_pci 0000:01:00.0: Hardware name qcn9074 hw1.0
>>  debugfs: Directory 'ath11k' with parent '/' already present!
>>  ath11k_pci 0000:01:00.0: failed to create ath11k debugfs
>>  ath11k_pci 0000:01:00.0: failed to create soc core: -17
>>  ath11k_pci 0000:01:00.0: failed to init core: -17
>>  ath11k_pci: probe of 0000:01:00.0 failed with error -17
>>
>> Fix this by creating a directory for each ath11k device using schema
>> <bus>-<devname>, for example "pci-0000:06:00.0". This directory created under
>> the top-level ath11k directory, for example /sys/kernel/debug/ath11k.
>>
>> The reference to the toplevel ath11k directory is not stored anymore within ath11k, instead
>> it's retrieved using debugfs_lookup(). If the directory does not exist it will
>> be created. After the last directory from the ath11k directory is removed, for
>> example when doing rmmod ath11k, the empty ath11k directory is left in place,
>> it's a minor cosmetic issue anyway.
>>
>> Here's an example hierarchy with one WCN6855:
>>
>> ath11k
>> `-- pci-0000:06:00.0
>>     |-- mac0
>>     |   |-- dfs_block_radar_events
>>     |   |-- dfs_simulate_radar
>>     |   |-- ext_rx_stats
>>     |   |-- ext_tx_stats
>>     |   |-- fw_dbglog_config
>>     |   |-- fw_stats
>>     |   |   |-- beacon_stats
>>     |   |   |-- pdev_stats
>>     |   |   `-- vdev_stats
>>     |   |-- htt_stats
>>     |   |-- htt_stats_reset
>>     |   |-- htt_stats_type
>>     |   `-- pktlog_filter
>>     |-- simulate_fw_crash
>>     `-- soc_dp_stats
>>
>> I didn't have a test setup where I could connect multiple ath11k devices to the
>> same the host, so I have only tested this with one device.
>>
>> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.9
>
>
> I can confirm that this works on a combination of IPQ8074 with an
> external QCN9074 radio which would previously clash and error out, so:
>
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.5.0.1-01208-QCAHKSWPL_SILICONZ-1
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01208-QCAHKSWPL_SILICONZ-1
> Tested-by: Robert Marko <robert.marko@sartura.hr>

Great, thank you for testing this. Very much appreciated. I added the
tags tags to the commit.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
