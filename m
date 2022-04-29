Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE10EC433EF
	for <ath11k@archiver.kernel.org>; Fri, 29 Apr 2022 06:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2ds2C88/WUQgreV1oPQap/y/CKZDS+3YhQNFAPB0E0A=; b=2kJ89i3n6JXJn2
	d2g/5ccNEVayL1dwfuflzx/91n4H9HnmHwDje4kZg60A6J+UZvjE9R7F26TgLl1mMLB2naTGTZOu/
	cmJH/GAvDfhEbLeIlk+iOnTpM0Vgz+nG4UtXXKYF8b6qJWjw85VzCbiFLZZmiKVjcZXNAKhIlSsNn
	O8DBRf12TmEvs0SXCAKeFzAvvIztprU78uMkRJBK3Bao25mi9iMmgn1WdzPgN3Ky0YDn9WWMzUoA1
	OwJ3NNffePe0UdF9OEQ0iGYHGzrRsUwTgUJ3V8ed833s3oJSqYDdut+bAHh6RraGkaUkDOz+2cxQC
	30n/ZKdIepzjR2uuNuoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkJgU-009f6h-5F; Fri, 29 Apr 2022 06:00:54 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkJgR-009f6C-8f
 for ath11k@lists.infradead.org; Fri, 29 Apr 2022 06:00:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EBF70B83026
 for <ath11k@lists.infradead.org>; Fri, 29 Apr 2022 06:00:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E328DC385A4;
 Fri, 29 Apr 2022 06:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651212047;
 bh=j0Zer+6QL+0K2ksOmfZ1gu5Whw21UNJ5m6NogkXAcLA=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=q2FxV6XAZ6xTTwvtsL/WPjGdsM97pNAXWQZl9Aa7NU3ia68qAZDf827BnUhnDFRxt
 egw0dtIIOLVT3nzpFFeRGei86HodnTh45+5g+bc1sLady+Oi64XeB1YoXp0yG4feKm
 G/BuiRDneJoGmxXkCAut/tnPnCCPgEw2ygZ79or15WqqdyRFomEvU4OYXFI+duuKti
 KncFs+p4OsRW68B5I5zFuX1X9yHFJjajm48iWM6Oe2hrQbwcAiHilvmzo78pLU1MhF
 vLAMHM3RNR54GJtxi81BURUZXup7m3umA2xsUgqIC9rnPQ+jCNjBV8MqS6W8lfc2tu
 42ONj7uANs6Bw==
MIME-Version: 1.0
Subject: Re: [v5.18] ath11k: reduce the wait time of 11d scan and hw scan
 while add interface
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220427111619.9758-1-kvalo@kernel.org>
References: <20220427111619.9758-1-kvalo@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <165121204399.9395.8156139682593720867.kvalo@kernel.org>
Date: Fri, 29 Apr 2022 06:00:46 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_230051_627838_E2DCD97B 
X-CRM114-Status: GOOD (  17.75  )
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

> From: Wen Gong <quic_wgong@quicinc.com>
> 
> (cherry picked from commit 1f682dc9fb3790aa7ec27d3d122ff32b1eda1365 in wireless-next)
> 
> Currently ath11k will wait 11d scan complete while add interface in
> ath11k_mac_op_add_interface(), when system resume without enable
> wowlan, ath11k_mac_op_add_interface() is called for each resume, thus
> it increase the resume time of system. And ath11k_mac_op_hw_scan()
> after ath11k_mac_op_add_interface() also needs some time cost because
> the previous 11d scan need more than 5 seconds when 6 GHz is enabled,
> then the scan started event will indicated to ath11k after the 11d
> scan completed.
> 
> While 11d scan/hw scan is running in firmware, if ath11k update channel
> list to firmware by WMI_SCAN_CHAN_LIST_CMDID, then firmware will cancel
> the current scan which is running, it lead the scan failed. The patch
> commit 9dcf6808b253 ("ath11k: add 11d scan offload support") used
> finish_11d_scan/finish_11d_ch_list/pending_11d to synchronize the 11d
> scan/hw scan/channel list between ath11k/firmware/mac80211 and to avoid
> the scan fail.
> 
> Add wait operation before ath11k update channel list, function
> ath11k_reg_update_chan_list() will wait until the current 11d scan/hw
> scan completed. And remove the wait operation of start 11d scan and
> waiting channel list complete in hw scan. After these changes, resume
> time cost reduce about 5 seconds and also hw scan time cost reduced
> obviously, and scan failed not seen.
> 
> The 11d scan is sent to firmware only one time for each interface added
> in mac.c, and it is moved after the 1st hw scan because 11d scan will
> cost some time and thus leads the AP scan result update to UI delay.
> Currently priority of ath11k's hw scan is WMI_SCAN_PRIORITY_LOW, and
> priority of 11d scan in firmware is WMI_SCAN_PRIORITY_MEDIUM, then the
> 11d scan which sent after hw scan will cancel the hw scan in firmware,
> so change the priority to WMI_SCAN_PRIORITY_MEDIUM for the hw scan which
> is in front of the 11d scan, thus it will not happen scan cancel in
> firmware.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3
> 
> Fixes: 9dcf6808b253 ("ath11k: add 11d scan offload support")
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=215777
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
> Link: https://lore.kernel.org/r/20220328035832.14122-1-quic_wgong@quicinc.com

Patch applied to wireless.git, thanks.

bb300130e47f ath11k: reduce the wait time of 11d scan and hw scan while add interface

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220427111619.9758-1-kvalo@kernel.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
