Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67B13C4332F
	for <ath11k@archiver.kernel.org>; Thu, 22 Dec 2022 15:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bl//d1MiXJHOzuVp7jXBjzH7mBnaNQ2DqSBkpvUGfIU=; b=Oj7OCg7BRJlCw6
	LoHv2fWt+VUMTodwfYx7bqa5sIevFBCrXoXYglZ3wk7dFBOQUMqN9HLHljm2zeCXftYg2SyvD/h5p
	OcA1CCY4N1t/8m2AfRAn7pGDVDS3F1OORg/FRGc0SJU9N6ngBYZijINYy0KI1aM4U5niS8DNptRqO
	sZwUjygx5m+UCc/rIcR3UGerrfr1/Heq9Bqm6rjlacXrRQV6HVqqidM6STUqtORw/ilqzYsSjoDtd
	T9e52bMh4yZuUDa7YVmP+lBd6v6sBDHGcA/Wi4qc1eCRDRXJ7JkLeVrPZO89VzUv/lePkNm9NL/2s
	qKejdEei6oRZKOSDd5Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8NZh-00DYen-9S; Thu, 22 Dec 2022 15:33:37 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8NUe-00DVoK-Pu
	for ath11k@lists.infradead.org; Thu, 22 Dec 2022 15:28:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 94CE8CE1AA4;
	Thu, 22 Dec 2022 15:28:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3D25C433D2;
	Thu, 22 Dec 2022 15:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671722899;
	bh=KsnoqTPaGbCsUNb4K8sISomHfCTSNpMkJmK/bkrjvvg=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=j4K2VSyevxAJPgjlmRhxJ+Ce20Y5Dk7VDpSsR6+OE6SqrsXPon+AUzojKZ55VOnLK
	 yfEr5vVRlnbYhiYiJO3OuZtWZIBrEjakHLSNtX1wAEE7fxIF12X2zEbP/3Z2dCSdEh
	 NFHZ91K9FQO+FoVZPbfxBat3IzvF/jdVbfVFahEZvGrU08siWyM7uJK9DO4YtHJFm7
	 IPKCTmOvvT9huHzX7bflgC4Dwvod61O/EGqaiTxZuJLuQob0Hr7GnIUnPa5Cy7ljmO
	 jVhBStAglDLxfBrvPNjRBbSKVogWzjJHSwT92gYBku63xWX2qUzYGhprstglZzLbqk
	 q98dOBEBDsOrw==
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: update debugfs support for mupltiple radios in
 PCI
 bus
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <1614160542-27882-1-git-send-email-akolli@codeaurora.org>
References: <1614160542-27882-1-git-send-email-akolli@codeaurora.org>
To: Anilkumar Kolli <akolli@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Anilkumar Kolli <akolli@codeaurora.org>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <167172289467.8231.1004330123245787946.kvalo@kernel.org>
Date: Thu, 22 Dec 2022 15:28:18 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_072825_098741_B4246381 
X-CRM114-Status: GOOD (  10.88  )
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

Anilkumar Kolli <akolli@codeaurora.org> wrote:

> debugfs_ath11k struct is moved to ath11k_core, since its common
> for both pci and ahb.
> 
> Current ath11k_pci insmod fails if there are multiple PCI rdaios,
> 
>  ath11k_pci 0000:01:00.0: Hardware name qcn9074 hw1.0
>  debugfs: Directory 'ath11k' with parent '/' already present!
>  ath11k_pci 0000:01:00.0: failed to create ath11k debugfs
>  ath11k_pci 0000:01:00.0: failed to create soc core: -17
>  ath11k_pci 0000:01:00.0: failed to init core: -17
>  ath11k_pci: probe of 0000:01:00.0 failed with error -17
> 
> To avoid the failure, debugfs directory is created with soc_name
> and bus_id to allow creating debugfs directory for second PCI radio.
> 
> with this Debugfs entries looks like,
>  # ls -l /sys/kernel/debug/ath11k/
>  ipq8074 hw2.0 qcn9000 hw1.0_0000:01:00.0 qcn9000 hw1.0_0001:01:00.0
> 
>  # ls -l /sys/kernel/debug/ath11k/ipq8074 hw2.0/
>   mac0  mac1 simulate_fw_crash soc_dp_stats
> 
>  # ls -l /sys/kernel/debug/ath11k/qcn9000 hw1.0_0000:01:00.0
>   mac0 simulate_fw_crash soc_dp_stats
> 
>  # /sys/kernel/debug/ath11k/qcn9000 hw1.0_0001:01:00.0:
>    mac0  simulate_fw_crash soc_dp_stats
> 
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.4.0.1.r2-00012-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>

I submitted my version here:

https://patchwork.kernel.org/project/linux-wireless/patch/20221220121231.20120-1-kvalo@kernel.org/

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1614160542-27882-1-git-send-email-akolli@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
