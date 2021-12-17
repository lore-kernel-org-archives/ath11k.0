Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE732C433EF
	for <ath11k@archiver.kernel.org>; Fri, 17 Dec 2021 13:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SntwUEG4nQ/WCkptTClgFvyLQfP1BYzgL86PALrZ3UM=; b=bGimVN7Ky5+pOj
	ifA9NLWA7bu37C+2rbw6EnqqO4zsWEuVmXjk8is1OfxpfCp0Z1iA3Ym6C9IW2WoSD4s5kXxWce/kv
	cKQDk2fHU1nnfjBZjfoWe2YrepOv2R8R4M8nC0+uApM45Mpo+IJ+P8ZBz9nXlAGUoDpnVkeb647aY
	TEqRNS0q/iI+cgqliS7NFlH67YakRFn4udg+opruq1BW3PPaReF9Rl1Gk4cRxRiWVWkLjstDh1BRX
	gab556GKH+l1xVdy7CgOW8zPmFR4eVo1q2CB62sGCUG3dieY9ojYmyRWV+f7ZQvQRZkKUwoMLNuXL
	BMeA757Tyk9SOTFyvHJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myDKV-00AOqu-MQ; Fri, 17 Dec 2021 13:31:23 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myDKT-00AOos-2i
 for ath11k@lists.infradead.org; Fri, 17 Dec 2021 13:31:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C0C4CB8280A;
 Fri, 17 Dec 2021 13:31:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96569C36AE7;
 Fri, 17 Dec 2021 13:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639747878;
 bh=dO21G1S5TYGg8s1h33uOCeWOQqtYH+TK7gHEco/Z9iM=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=hnDA21dPsP6sON0JsCp+Tkcnb/XJjTM1/IIK6sjUMOBDaqeszz1qBxzMy/Hp0JGz0
 qPoy+R/ARDOqRkXJnQgnnLV9vScNuAIp3SIKvulu2J2d3LNL6Ur8uJjew0/XWOgHIK
 IjqQQLQHRxTeObh2N1fZpy/ivWp0fSyxfAEbpQLThRifNmBraJ6b+WZOi28eevgovE
 VMA9ljAyoyB4hQEktOvVWBFJ7FEelzR796P7EZh61n9qrNfFDY0q7KQH0L+nqNRqIQ
 TPB8LVhqr38h4cvzMPa8ltp6JrcopN/dqS6+6nHZuvcckfAeGYP8vZJq2im7kH1iY5
 mUGbPVTBHWBTA==
MIME-Version: 1.0
Subject: Re: [PATCH v2] ath11k: add regdb.bin download for regdb offload
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20211215061556.14282-1-quic_wgong@quicinc.com>
References: <20211215061556.14282-1-quic_wgong@quicinc.com>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_wgong@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163974786863.27118.8951264944041941308.kvalo@kernel.org>
Date: Fri, 17 Dec 2021 13:31:17 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_053121_470467_A381060A 
X-CRM114-Status: GOOD (  16.65  )
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

> The regdomain is self-managed type for ath11k, the regdomain info is
> reported from firmware, it is not from wireless regdb. Firmware fetch
> the regdomain info from board data file before. Currently most of the
> regdomain info has moved to another file regdb.bin from board data
> file for some chips such as QCA6390 and WCN6855, so the regdomain info
> left in board data file is not enough to support the feature which need
> more regdomain info.
> 
> After download regdb.bin, firmware will fetch the regdomain info from
> regdb.bin instead of board data file and report to ath11k. If it does
> not have the file regdb.bin, it also can initialize wlan success and
> firmware then fetch regdomain info from board data file.
> 
> Add download the regdb.bin before download board data for some specific
> chip which support supports_regdb in hardware parameters.
> 
> download regdb.bin log:
> [430082.334162] ath11k_pci 0000:05:00.0: chip_id 0x2 chip_family 0xb board_id 0x106 soc_id 0x400c0200
> [430082.334169] ath11k_pci 0000:05:00.0: fw_version 0x110c8b4c fw_build_timestamp 2021-10-25 07:41 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HSP.1.1-02892-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3
> [430082.334414] ath11k_pci 0000:05:00.0: boot firmware request ath11k/WCN6855/hw2.0/regdb.bin size 24310
> 
> output of "iw reg get"
> global
> country US: DFS-FCC
>         (2402 - 2472 @ 40), (N/A, 30), (N/A)
>         (5170 - 5250 @ 80), (N/A, 23), (N/A), AUTO-BW
>         (5250 - 5330 @ 80), (N/A, 23), (0 ms), DFS, AUTO-BW
>         (5490 - 5730 @ 160), (N/A, 23), (0 ms), DFS
>         (5735 - 5835 @ 80), (N/A, 30), (N/A)
>         (57240 - 63720 @ 2160), (N/A, 40), (N/A)
> 
> phy#0 (self-managed)
> country US: DFS-FCC
>         (2402 - 2472 @ 40), (6, 30), (N/A)
>         (5170 - 5250 @ 80), (N/A, 24), (N/A), AUTO-BW
>         (5250 - 5330 @ 80), (N/A, 24), (0 ms), DFS, AUTO-BW
>         (5490 - 5730 @ 160), (N/A, 24), (0 ms), DFS, AUTO-BW
>         (5735 - 5895 @ 160), (N/A, 30), (N/A), AUTO-BW
>         (5945 - 7125 @ 160), (N/A, 24), (N/A), NO-OUTDOOR, AUTO-BW
> 
> Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

With WCN6855 I see new warnings:

[12136.485140] ath11k_pci 0000:06:00.0: qmi failed to load CAL data file:cal-pci-0000:06:00.0.bin
[12169.157236] ath11k_pci 0000:06:00.0: qmi failed to load CAL data file:cal-pci-0000:06:00.0.bin

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20211215061556.14282-1-quic_wgong@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
