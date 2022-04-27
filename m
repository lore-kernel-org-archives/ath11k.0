Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B895C433EF
	for <ath11k@archiver.kernel.org>; Wed, 27 Apr 2022 05:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cqxc/QFdfjXdU6FJOdOe4sYdyPhGq5XUQ46piNs6nQM=; b=KVuVVn9/5nsNi/
	CDCi5Jh2gtkS+tBPiHFOdafbYWnz7ZyseZwo8yv1fAZ1nI9HbVYnWOULeG9nx0rl5wF38xLpvqZmc
	b70noDHSu9JbN3Sl3y/fW4RoDDGMzchLmWRZGiZvWADfB20/4i8Mcj6UitAhlGCFI9v3Gr8rZWQZb
	KtHQ/aOcKE2TVHNWU6T3VD1xRmcsXwfHNVB3DyCr7gX1vHCYWJZ0GZSmzK+EewPkVXoyxAJq/PEHn
	7HCXDC5q+O2SvnxPt/DSTcjuFu4rzK2EOkz2XAZS8Kd4qBfzGAn0BZLnMjNSy4ss0sv6op1YxdeD9
	/kMlwFrBV+CRDc6ugcGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njaHw-00HTsM-EN; Wed, 27 Apr 2022 05:32:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njaHt-00HTrb-8o
 for ath11k@lists.infradead.org; Wed, 27 Apr 2022 05:32:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CF274612CF;
 Wed, 27 Apr 2022 05:32:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B299C385A9;
 Wed, 27 Apr 2022 05:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651037548;
 bh=eYExc3IcRuFN+bZXf/jvEOc9j7k3Wa1qVp0FWo3fSbY=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=PVUN3YP6FTcXStqJfdeiQd+80A81M6mVQ/TQ8yqYpXixc2HlfmBwcbRl0o3nO4Kc4
 rNey10o8VdVJTK7501dMPf1N5eezaTYvDoqukTPH3UdyunpzSOv2tVNa6rHUTZIT+o
 Yq291Nqb1GCTwqRQVfST0dxLqqcSPQ34Li6W33uBRQyFw07d90EJuEmil8ilrlXesr
 Iygerr/GCn76Z9V/MRuPstj8DeAImuWBS8bxKfyDrPTF4iYUv+FGTXRm+tbLJDIEGZ
 j080Jfn3by/rF09uRr+sOa5VhfmJTPvCepshVBoo+qM2dVukSSnUqWrS1/FDbu9CHW
 MuMyPUuxFi92g==
From: Kalle Valo <kvalo@kernel.org>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <robh@kernel.org>
Subject: Re: [PATCH v2 12/19] ath11k: Datapath changes to support WCN6750
References: <1642337235-8618-1-git-send-email-quic_mpubbise@quicinc.com>
 <1642337235-8618-13-git-send-email-quic_mpubbise@quicinc.com>
Date: Wed, 27 Apr 2022 08:32:23 +0300
In-Reply-To: <1642337235-8618-13-git-send-email-quic_mpubbise@quicinc.com>
 (Manikanta Pubbisetty's message of "Sun, 16 Jan 2022 18:17:08 +0530")
Message-ID: <87ilqvgkgo.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_223229_388441_7E7BE02B 
X-CRM114-Status: GOOD (  15.55  )
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

Manikanta Pubbisetty <quic_mpubbise@quicinc.com> writes:

> HAL RX descriptor for WCN6750 is same as QCN9074, so use
> the DP APIs of QCN9074 for WCN6750. There is one change
> wrt to REO configuration though, REO configuration for
> WCN6750 is same as WCN6855; Therefore, use reo_setup()
> of WCN6855 for WCN6750.
>
> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00573-QCAMSLSWPLZ-1
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-00192-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath11k/core.c |  1 +
>  drivers/net/wireless/ath/ath11k/hw.c   | 31 +++++++++++++++++++++++++++++++
>  2 files changed, 32 insertions(+)
>
> diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
> index 347131a..f65347c 100644
> --- a/drivers/net/wireless/ath/ath11k/core.c
> +++ b/drivers/net/wireless/ath/ath11k/core.c
> @@ -458,6 +458,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
>  		.num_vdevs = 16 + 1,
>  		.num_peers = 512,
>  		.supports_suspend = false,
> +		.hal_desc_sz = sizeof(struct hal_rx_desc_qcn9074),

You mention nothing about this change in the commit log, I'll add that.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
