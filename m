Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC6B9C433F5
	for <ath11k@archiver.kernel.org>; Wed, 30 Mar 2022 08:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iNrnj7Sf24aMbvfRMPg719gTxhglE1iEE97jg3Ftuj4=; b=umewum+bIFvfis
	DL3EzMPPUdvMXKy+RtHSsSpUKDWlUJpEWoNmOtmjenu4aZoDv2TBekz7jzyQLXd/ypLT4ZmoG6QvQ
	3cEQJ5VuVcZ0Y4Q8G/UnIwcPTDJLUK86bXxnRDToEnJ1LHZejQGLEteQ8TulXhTiWOoBNrZB6Hb51
	4ydd9OIGJ+af4RlC1C372jktqCQEI83Q5mGn+nSURIknMDHwPJ2STC3QvDu3ljNH50O/SRdCCLTPq
	fbQ6W2/kgwjenSGwJbpcTY1MtFjX0rIxNVnwRvSBvczv61Z5lygqrA4qPMz3TpV7TtcCCFWlSc7wu
	ozvw8talJAi0uZKwDcNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZTL1-00EgnE-U8; Wed, 30 Mar 2022 08:05:55 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZTKy-00Eglu-Fk
 for ath11k@lists.infradead.org; Wed, 30 Mar 2022 08:05:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 017E2B818F9;
 Wed, 30 Mar 2022 08:05:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDE98C340F0;
 Wed, 30 Mar 2022 08:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648627548;
 bh=lMwTSB85/tsnYn79vvntRMAyII4q2RgNdTc9seOc6a0=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=Sxzyy+4mwEhcVXrZVboKMFEJUqsKTeEKaLfjvLR/LUKiZoNkvNOawJVy5BE6w6r/p
 35aaE6ycEhtuVs2lQr3olOPx81JVybisN+CSOM6O1FMeEElXLqrTPZQ4YiRxS9LdPw
 VgRg9FwJL4Q6SP/aorlXEoxBdz06uyzrfiWOx2tfq+hOUVk7UwMDJSq1P6IMDamFY9
 zAlOebrdlT5Vg44TKjgIXSxKlmvUt+rRJltfpzmGzaqRG7wmZTLQvf5Nlil150t5Lq
 vpsmNsWPMm55BKMW5YG09HnwB+MtgA5bPX6aCzY9SMrKotbfc7uUu/wuGm9oCyHi2C
 WEs/qJ46JiTYw==
MIME-Version: 1.0
Subject: Re: [PATCH 3/3] ath11k: add support to search regdb data in
 board-2.bin for WCN6855
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220319023543.14288-4-quic_wgong@quicinc.com>
References: <20220319023543.14288-4-quic_wgong@quicinc.com>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_wgong@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <164862754496.10264.18242438305394450679.kvalo@kernel.org>
Date: Wed, 30 Mar 2022 08:05:47 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_010552_865722_6CD34D4B 
X-CRM114-Status: GOOD (  13.11  )
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

> Currently ath11k only download the same regdb.bin file for all WCN6855
> chips, actually ath11k needs to distinguish all different WCN6855 chips.
> 
> This is to re-use the string type which include bus, chip id, board id,
> vendor, device, subsystem-vendor, subsystem-device and variant for
> WCN6855 to distinguish different regdb in board-2.bin.
> 
> ath11k will first load board-2.bin and search in it for the regdb data
> with the above parameters, if matched one regdb data, then download it
> to firmware, if not matched any one, then ath11k will download the file
> regdb.bin to firmware.
> 
> Add enum value ATH11K_BD_IE_REGDB and enum type ath11k_bd_ie_regdb_type
> to distinguish regdb data and board data since they are in the same file
> board-2.bin.
> 
> This only take effect for WCN6855 which supports regdb in hardware parameters.
> 
> Test log:
> [ 3833.091948] ath11k_pci 0000:05:00.0: boot using board name 'bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=3374,qmi-chip-id=2,qmi-board-id=262'
> [ 3833.092072] ath11k_pci 0000:05:00.0: boot firmware request ath11k/WCN6855/hw2.0/board-2.bin size 205316
> [ 3833.092079] ath11k_pci 0000:05:00.0: board name
> [ 3833.092083] ath11k_pci 0000:05:00.0: 00000000: 62 75 73 3d 70 63 69 2c 71 6d 69 2d 63 68 69 70  bus=pci,qmi-chip
> [ 3833.092088] ath11k_pci 0000:05:00.0: 00000010: 2d 69 64 3d 31                                   -id=1
> [ 3833.092091] ath11k_pci 0000:05:00.0: board name
> [ 3833.092095] ath11k_pci 0000:05:00.0: 00000000: 62 75 73 3d 70 63 69 2c 71 6d 69 2d 63 68 69 70  bus=pci,qmi-chip
> [ 3833.092099] ath11k_pci 0000:05:00.0: 00000010: 2d 69 64 3d 32                                   -id=2
> [ 3833.092102] ath11k_pci 0000:05:00.0: board name
> [ 3833.092105] ath11k_pci 0000:05:00.0: 00000000: 62 75 73 3d 70 63 69 2c 71 6d 69 2d 63 68 69 70  bus=pci,qmi-chip
> [ 3833.092109] ath11k_pci 0000:05:00.0: 00000010: 2d 69 64 3d 33                                   -id=3
> [ 3833.092112] ath11k_pci 0000:05:00.0: board name
> [ 3833.092116] ath11k_pci 0000:05:00.0: 00000000: 62 75 73 3d 70 63 69 2c 76 65 6e 64 6f 72 3d 31  bus=pci,vendor=1
> [ 3833.092119] ath11k_pci 0000:05:00.0: 00000010: 37 63 62 2c 64 65 76 69 63 65 3d 31 31 30 33 2c  7cb,device=1103,
> [ 3833.092123] ath11k_pci 0000:05:00.0: 00000020: 73 75 62 73 79 73 74 65 6d 2d 76 65 6e 64 6f 72  subsystem-vendor
> [ 3833.092126] ath11k_pci 0000:05:00.0: 00000030: 3d 31 37 63 62 2c 73 75 62 73 79 73 74 65 6d 2d  =17cb,subsystem-
> [ 3833.092130] ath11k_pci 0000:05:00.0: 00000040: 64 65 76 69 63 65 3d 33 33 37 34 2c 71 6d 69 2d  device=3374,qmi-
> [ 3833.092133] ath11k_pci 0000:05:00.0: 00000050: 63 68 69 70 2d 69 64 3d 32 2c 71 6d 69 2d 62 6f  chip-id=2,qmi-bo
> [ 3833.092137] ath11k_pci 0000:05:00.0: 00000060: 61 72 64 2d 69 64 3d 32 36 36 2c 76 61 72 69 61  ard-id=266,varia
> [ 3833.092140] ath11k_pci 0000:05:00.0: 00000070: 6e 74 3d 48 50 5f 47 38 5f 4c 61 6e 63 69 61 31  nt=HP_G8_Lancia1
> [ 3833.092144] ath11k_pci 0000:05:00.0: 00000080: 35                                               5
> [ 3833.092147] ath11k_pci 0000:05:00.0: board name
> [ 3833.092150] ath11k_pci 0000:05:00.0: 00000000: 62 75 73 3d 70 63 69 2c 76 65 6e 64 6f 72 3d 31  bus=pci,vendor=1
> [ 3833.092154] ath11k_pci 0000:05:00.0: 00000010: 37 63 62 2c 64 65 76 69 63 65 3d 31 31 30 33 2c  7cb,device=1103,
> [ 3833.092157] ath11k_pci 0000:05:00.0: 00000020: 73 75 62 73 79 73 74 65 6d 2d 76 65 6e 64 6f 72  subsystem-vendor
> [ 3833.092161] ath11k_pci 0000:05:00.0: 00000030: 3d 31 37 63 62 2c 73 75 62 73 79 73 74 65 6d 2d  =17cb,subsystem-
> [ 3833.092165] ath11k_pci 0000:05:00.0: 00000040: 64 65 76 69 63 65 3d 33 33 37 34 2c 71 6d 69 2d  device=3374,qmi-
> [ 3833.092168] ath11k_pci 0000:05:00.0: 00000050: 63 68 69 70 2d 69 64 3d 32 2c 71 6d 69 2d 62 6f  chip-id=2,qmi-bo
> [ 3833.092172] ath11k_pci 0000:05:00.0: 00000060: 61 72 64 2d 69 64 3d 32 36 36                    ard-id=266
> [ 3833.092206] ath11k_pci 0000:05:00.0: board name
> [ 3833.092209] ath11k_pci 0000:05:00.0: 00000000: 62 75 73 3d 70 63 69 2c 76 65 6e 64 6f 72 3d 31  bus=pci,vendor=1
> [ 3833.092213] ath11k_pci 0000:05:00.0: 00000010: 37 63 62 2c 64 65 76 69 63 65 3d 31 31 30 33 2c  7cb,device=1103,
> [ 3833.092216] ath11k_pci 0000:05:00.0: 00000020: 73 75 62 73 79 73 74 65 6d 2d 76 65 6e 64 6f 72  subsystem-vendor
> [ 3833.092220] ath11k_pci 0000:05:00.0: 00000030: 3d 31 37 63 62 2c 73 75 62 73 79 73 74 65 6d 2d  =17cb,subsystem-
> [ 3833.092223] ath11k_pci 0000:05:00.0: 00000040: 64 65 76 69 63 65 3d 33 33 37 34 2c 71 6d 69 2d  device=3374,qmi-
> [ 3833.092227] ath11k_pci 0000:05:00.0: 00000050: 63 68 69 70 2d 69 64 3d 32 2c 71 6d 69 2d 62 6f  chip-id=2,qmi-bo
> [ 3833.092230] ath11k_pci 0000:05:00.0: 00000060: 61 72 64 2d 69 64 3d 32 36 32                    ard-id=262
> [ 3833.092234] ath11k_pci 0000:05:00.0: boot found match regdb data for name 'bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=3374,qmi-chip-id=2,qmi-board-id=262'
> [ 3833.092238] ath11k_pci 0000:05:00.0: board name
> [ 3833.092241] ath11k_pci 0000:05:00.0: 00000000: 62 75 73 3d 70 63 69 2c 71 6d 69 2d 63 68 69 70  bus=pci,qmi-chip
> [ 3833.092245] ath11k_pci 0000:05:00.0: 00000010: 2d 69 64 3d 31 31                                -id=11
> [ 3833.092248] ath11k_pci 0000:05:00.0: board name
> [ 3833.092251] ath11k_pci 0000:05:00.0: 00000000: 62 75 73 3d 70 63 69 2c 71 6d 69 2d 63 68 69 70  bus=pci,qmi-chip
> [ 3833.092255] ath11k_pci 0000:05:00.0: 00000010: 2d 69 64 3d 32 32                                -id=22
> [ 3833.092258] ath11k_pci 0000:05:00.0: board name
> [ 3833.092261] ath11k_pci 0000:05:00.0: 00000000: 62 75 73 3d 70 63 69 2c 71 6d 69 2d 63 68 69 70  bus=pci,qmi-chip
> [ 3833.092265] ath11k_pci 0000:05:00.0: 00000010: 2d 69 64 3d 33 33                                -id=33
> [ 3833.092268] ath11k_pci 0000:05:00.0: boot found regdb data for 'bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=3374,qmi-chip-id=2,qmi-board-id=262'
> [ 3833.092272] ath11k_pci 0000:05:00.0: fetched regdb
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

801cb1d23428 ath11k: add support to search regdb data in board-2.bin for WCN6855

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220319023543.14288-4-quic_wgong@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
