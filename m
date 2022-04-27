Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC8A2C433EF
	for <ath11k@archiver.kernel.org>; Wed, 27 Apr 2022 11:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vXhlIi4w8PjkFUr7xfgkZFh7mGGRSnLE5wnlW+AZ7+w=; b=wseqvST2EE5iK2
	VXlnL/4wPz6oAnkuWOr0tEYrVbJsTxp+EQES2KUu5LTXIRqZRyBUaE3dPA+Z8feAEMAPQq4BE64hq
	mhT4L+yytUg5oV1eYWPlaYTGSJowKhegyIBzXpx4I/RIf4yDV+f374o6fSOZfdxzfSM3E+a0OrLw3
	iifpFd22kKw+ryR3qxCH67pYa2wMD7vpAN78+FgfxRofRl0l1rdvisc11VK7ozupRicmzq/sxegYo
	PgxgrJURqMrZdLNWksAw9KsJhuID92hDHXg7A+1JN7T3+yidiKR5kdGr7Q61sibmyCSQjgsc3nSgk
	nwfYIOGDaxJPRHaBDv4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njfmk-0014ES-Uz; Wed, 27 Apr 2022 11:24:42 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njfmi-0014Da-CC
 for ath11k@lists.infradead.org; Wed, 27 Apr 2022 11:24:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 588A2B82620
 for <ath11k@lists.infradead.org>; Wed, 27 Apr 2022 11:24:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C81EC385A9;
 Wed, 27 Apr 2022 11:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651058669;
 bh=LTGwnbGRpiim9T3RVtgFxvcwX/HqM66APROkek98ZdY=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=QqjVfVfeYrg4Sdk6EU9lunChpyV3z/3p5CS24BqGpyJD9SF5yzB5Rf4+jlHSkUYQs
 DKDJCLjOLNPf1BMU8lvLlk2/gdgt38lpTcbsGCuiaz5VEauR8j+Wxgg73DO0k61kp1
 J3/Rzprs1gnAruO0GaGKrhezMIItUvVYVrpM4yazkJ56Pd21E1wmjsrK7mMCwDjuhA
 l3VyLxVE4BfKnMrP8GO8r2vC7V8OHtuPek8rE4sfTMt3X/VtA6Ax2VXs5r2VGT9toY
 H6+osXni21iKuT1nblC+fZg8HwQuOCqPD7bzyKJJqpP3NxwBpjN5qP2Vze+Nsv/lnW
 8dhFUwIzLLPAQ==
From: Kalle Valo <kvalo@kernel.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: Re: [PATCH v5.18] ath11k: reduce the wait time of 11d scan and hw
 scan while add interface
References: <20220427111619.9758-1-kvalo@kernel.org>
Date: Wed, 27 Apr 2022 14:24:26 +0300
In-Reply-To: <20220427111619.9758-1-kvalo@kernel.org> (Kalle Valo's message of
 "Wed, 27 Apr 2022 14:16:19 +0300")
Message-ID: <87bkwm22hh.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_042440_758767_E57F59A8 
X-CRM114-Status: GOOD (  20.78  )
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

Kalle Valo <kvalo@kernel.org> writes:

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
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
> Link: https://lore.kernel.org/r/20220328035832.14122-1-quic_wgong@quicinc.com

I forgot to include the link to the bug report:

Link: https://bugzilla.kernel.org/show_bug.cgi?id=215777

I'll add that during commit.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
