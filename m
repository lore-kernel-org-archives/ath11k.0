Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94B61C6FD1C
	for <ath11k@archiver.kernel.org>; Wed, 22 Mar 2023 09:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=15zYhf5dYsTt6iKLbKmrpMbweG0/MluKhl3y3+O/DXA=; b=HGy/Oc0nfzbe2j
	SnbmwWK4QLkSsZKUrUjVItZkAcz1YlTf/vj/NttdHCGGK8sRXRVY5PGQsgGTvpgxL2MJU1Wea8aQZ
	AZauvvuQVbO0Uxs9ENvorImr1m4SbikfJ13D8ATgnC0XOzGzzbb+xIOgCIxvsqkvBIKLLg5OO8pto
	PvLcarADtApO0Ih9efDh2d9Oog0W/xxivkqN1nb5f09UCeizFi/5sdHKCIHyWcK/N6P0O8LZ1rDRH
	qtJcKptzRMK2WszGBmP0dSYgWyc0mq1VkESv7PCHIaZwfMZXvDDNCew5rPQKXiq6jTwwlm1Gyp5le
	loyAxmENNmTPjCH16gog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pev4O-00FVmX-0A;
	Wed, 22 Mar 2023 09:47:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pev4A-00FVcy-0X
	for ath11k@lists.infradead.org;
	Wed, 22 Mar 2023 09:47:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 589A561FEA;
	Wed, 22 Mar 2023 09:47:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 975CEC433EF;
	Wed, 22 Mar 2023 09:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679478452;
	bh=4HxVDzNfjJY6dkkmlEkbzo3As/3oTHbN33xG/hJluJA=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=B89Bbu6J/lWiotayPnDPHVfNeTGCqT/v8CLDJNXh7t4dXICawD5rAZJAuGXOzoczm
	 IaUasWhyHp7kkhzPGlS/F9UrBi08wn+rfdsNyHeZZEJbgFUI+A0PiXYim98KDZqK3D
	 ISfD64TML64uBjBYcbEuLltbGLKz7iAcLIXUUSZGgf9HEN+g0MkrlRzerluGATybXe
	 VlBUEhqrkR5GyKYY+UwvIwS1t93oskYFpfC+o0RJySxERhhuji8gP6TakiAvKsIjX6
	 f6/xtRiQLKPuIPLBdGqY4LlGcdNxFJoutkHupcE5MRB37Yahq7+3f/dmN6dVr1iCd5
	 xXoiLQrzOOyzw==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath11k: fix BUFFER_DONE read on monitor ring rx
  buffer
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230309164434.32660-1-quic_hprem@quicinc.com>
References: <20230309164434.32660-1-quic_hprem@quicinc.com>
To: Harshitha Prem <quic_hprem@quicinc.com>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Harshitha Prem <quic_hprem@quicinc.com>,
 Sathishkumar Muruganandam <quic_murugana@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <167947844748.8844.13661658322623444104.kvalo@kernel.org>
Date: Wed, 22 Mar 2023 09:47:31 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_024734_252837_EDD11965 
X-CRM114-Status: UNSURE (   9.36  )
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

Harshitha Prem <quic_hprem@quicinc.com> wrote:

> Perform dma_sync_single_for_cpu() on monitor ring rx buffer before
> reading BUFFER_DONE tag and do dma_unmap_single() only after device
> had set BUFFER_DONE tag to the buffer.
> 
> Also when BUFFER_DONE tag is not set, allow the buffer to get read
> next time without freeing skb.
> 
> This helps to fix AP+Monitor VAP with flood traffic scenario to see
> monitor ring rx buffer overrun missing BUFFER_DONE tag to be set.
> 
> Also remove redundant rx dma buf free performed on DP
> rx_mon_status_refill_ring.
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Sathishkumar Muruganandam <quic_murugana@quicinc.com>
> Signed-off-by: Harshitha Prem <quic_hprem@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

68e93ac5a31d wifi: ath11k: fix BUFFER_DONE read on monitor ring rx  buffer

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230309164434.32660-1-quic_hprem@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
