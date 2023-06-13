Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52395C77B7A
	for <ath11k@archiver.kernel.org>; Tue, 13 Jun 2023 09:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=do6d7HV+59viS5mDhzPY6HQfQc7BtGqOh1iTc02zZRw=; b=wTQ8Z1SNBGzj6F
	/ERKtZuDYlkckJzoVh9tPBuxyKnI+U1tCFTxZ4MFzif6y0xMySC/2s92yuWevYRwKB2c8S9xDUo3Z
	uKE8voRbvEJiSFa2E8OCvMwU2YC1YAyZOHYHnpeXwBySPmBEDg1WNSOmQeaTSoTLBTzfKxV5BTD7u
	G1pmftHx+/icsXSQ4ABD4AG9lKU6ri+eWJ+uTozqbAMm/hYSSzgPA3Vur0cdPIc3j6hAOP8phRAuv
	CVa0zIOP/AsyBKHpTyiJol4z9G0VoAA4QNQC6Eh2zUdo5M8LukPCacb6cAJ1GiRNDO+Hh6tbfRzKp
	HzqhPHB6fSebjQVZ37kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q907J-007U8B-01;
	Tue, 13 Jun 2023 09:15:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q907G-007U7I-0B
	for ath11k@lists.infradead.org;
	Tue, 13 Jun 2023 09:15:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3D2D462A52;
	Tue, 13 Jun 2023 09:15:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E99B1C4339B;
	Tue, 13 Jun 2023 09:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686647704;
	bh=JKBkTIwWYa/gnKOWIS3YMlHF+x0MovPcQPCPXxXUptY=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=Igv3dXfHmRtoB0Ey7FvNp43NFTWMUSh2iBLNuhjCqyZ9JLb9fUHxddVQ2kx2KVV6G
	 BzCI2UVSKOjxrTtub8QZE+WQWUvVjHQJrq0C2K2DWmocO7EaNYtzCicSKNaT4WVC77
	 FFx/KYxlIxJj1dbwFTChkqeR8XniiPOiNQ21SM0TlypVSvYUKMeQVOwa/sY+wCvibs
	 uExqGRKKLg2NHbM12AfBqozfz4nTpiIildoy7xLJld8pJYurBr/81/vLo6mp7IM4Go
	 PbZsZ1rwZeO15TiRkmuAeeSOb1y9Bie8QFyFsBch7C8gDL8t+SHssmdthltrYzopuS
	 TgiO6JnykxE9g==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath11k: fix memory leak in WMI firmware stats
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230606091128.14202-1-quic_adisi@quicinc.com>
References: <20230606091128.14202-1-quic_adisi@quicinc.com>
To: Aditya Kumar Singh <quic_adisi@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 P Praneesh <quic_ppranees@quicinc.com>,
 Aditya Kumar Singh <quic_adisi@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <168664770075.2274.7742799592706415506.kvalo@kernel.org>
Date: Tue, 13 Jun 2023 09:15:02 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230613_021506_140507_75ADA66F 
X-CRM114-Status: GOOD (  10.59  )
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

> Memory allocated for firmware pdev, vdev and beacon statistics
> are not released during rmmod.
> 
> Fix it by calling ath11k_fw_stats_free() function before hardware
> unregister.
> 
> While at it, avoid calling ath11k_fw_stats_free() while processing
> the firmware stats received in the WMI event because the local list
> is getting spliced and reinitialised and hence there are no elements
> in the list after splicing.
> 
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
> Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

6aafa1c2d3e3 wifi: ath11k: fix memory leak in WMI firmware stats

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230606091128.14202-1-quic_adisi@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
