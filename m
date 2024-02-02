Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D346C47DB3
	for <ath11k@archiver.kernel.org>; Fri,  2 Feb 2024 11:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GK2d7xkp+5AQ1CvoFM5La5/z8eBp6y/8ieSCqyY4iu8=; b=H4ahjlyxl/Rb1YCg2Xo7wd1V5J
	K56q5bxSIWP/nMlj5dtRKrgG0vNeA5ML86E6bnTQDcqUSdVUPVARCd0ykZapIp+SuxTjQTxQgCzem
	yyGymy1220X82dogK6bwvz4nHFUiX+Cncg+Jy2Muu5zvjKjeEdGdLObP1/Py8VJizDVk6Rzv3w1Xm
	OzvHsCpyiXIh1bjOP7dUcy8M9+v7wkXaWskmAxo8RW0pmgbgnMKB4Xx1xoeQ085Ie2rwvuAdVGt25
	jMPe5KfF4VRkDlYG8Nl5UMHrlZaLXRtJ6BtS97AeYNdl+lTASygLt4iFOHrb+wnLnAB7zZf8KksSU
	8UNKh8eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVrvo-0000000BKtr-1MDD;
	Fri, 02 Feb 2024 11:42:04 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVrvl-0000000BKt9-1d12
	for ath11k@lists.infradead.org;
	Fri, 02 Feb 2024 11:42:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6679BCE1E4F;
	Fri,  2 Feb 2024 11:41:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D29FC433F1;
	Fri,  2 Feb 2024 11:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706874117;
	bh=z4gO3mQEqJNFiFdLOMUsqG+yj2/Gcf/2cOR4uqD60BM=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=KKiFdLxIqUk+F0Va0NnSfqzLthXkiQgrakd22NAqiKhx2ilEJ3Doef9hMk+UzLE3P
	 mavVexPZpQ+deNy40zkcoSBFxcSUKO/QQU/HZKSpNVhwnaSfMcNCWBZUQFWsQ7eNQY
	 qyByZt42B+FotnIep1uWMUB0w8BKMDtHOAwpmWmla+Uxtwy1cfunRE3CFClBeo1ovv
	 /5k39+XCpxZ4XfQByc2KBrFfHmFRhasFOaihel4bahx4KaJ5vefAYcxZPJPmPXXlca
	 IRud+uKWsczxjXlmBx4ywaw3ytuMfbnMqcwF+ZsuWTTncoGNOVFrnGJ5QdBpisXesA
	 2lSFIfjLzK0cg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: ath11k: change to move WMI_VDEV_PARAM_SET_HEMU_MODE
 before WMI_PEER_ASSOC_CMDID
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240131021832.17298-1-quic_bqiang@quicinc.com>
References: <20240131021832.17298-1-quic_bqiang@quicinc.com>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_bqiang@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <170687411452.3200018.9505739166220430603.kvalo@kernel.org>
Date: Fri,  2 Feb 2024 11:41:56 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_034201_813202_F1D14CBD 
X-CRM114-Status: GOOD (  10.65  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Baochen Qiang <quic_bqiang@quicinc.com> wrote:

> Currently when connecting to an AP with 11AX-HE phy mode, host sends
> WMI_VDEV_PARAM_SET_HEMU_MODE parameter to firmware after
> WMI_PEER_ASSOC_CMDID command. This results in TXBF not working, because
> firmware calculates TXBF values while handling WMI_PEER_ASSOC_CMDID,
> however at that time WMI_VDEV_PARAM_SET_HEMU_MODE has not been sent yet.
> See below log:
> 
> AP sends "VHT/HE/EHT NDP Announcement" to station, and station sends
> "Action no Ack" of category code HE to AP, the "Nc Index" and
> "Codebook Information" are wrong:
> 
> Issued action:
> IEEE 802.11 Action No Ack, Flags: ........
> IEEE 802.11 wireless LAN
>     Fixed parameters
>         Category code: HE (30)
>         HE Action: HE Compressed Beamforming And CQI (0)
>             Total length: 152
>             HE MIMO Control: 0x0004008018
>                 .... .... .... .... .... .... .... .... .... .000 = Nc Index: 1 Column (0)
>                 .... .... .... .... .... .... .... ..0. .... .... = Codebook Information: 0
> 
> Change to send WMI_VDEV_PARAM_SET_HEMU_MODE before WMI_PEER_ASSOC_CMDID,
> then firmware will calculate the TXBF values with valid parameters
> instead of empty values. TXBF works well and throughput performance is
> improved from 80 Mbps to 130 Mbps with this patch.
> 
> Good action after this patch:
> IEEE 802.11 Action No Ack, Flags: ........
> IEEE 802.11 wireless LAN
>     Fixed parameters
>         Category code: HE (30)
>         HE Action: HE Compressed Beamforming And CQI (0)
>             Total length: 409
>             HE MIMO Control: 0x0004008219
>                 .... .... .... .... .... .... .... .... .... .001 = Nc Index: 2 Columns (1)
>                 .... .... .... .... .... .... .... ..1. .... .... = Codebook Information: 1
> 
> This change applies to all chipsets.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23
> 
> Fixes: 38dfe775d0ab ("wifi: ath11k: push MU-MIMO params from hostapd to hardware")
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

413e20e82ee7 wifi: ath11k: change to move WMI_VDEV_PARAM_SET_HEMU_MODE before WMI_PEER_ASSOC_CMDID

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240131021832.17298-1-quic_bqiang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


