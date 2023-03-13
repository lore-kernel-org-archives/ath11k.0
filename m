Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81528C6FD19
	for <ath11k@archiver.kernel.org>; Mon, 13 Mar 2023 09:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o6HcL/kfbv3XLzlM2mmqwqU38Pjtx4d9u0tvodNgpok=; b=eZj8YPgfiD2k8U
	jwZwGw3m8NS+3JHtU7StyBTymvwbrFhV/+a12GDBjppjThP+YZyUS1ZXbTQC41TjAZODA5FkS9fFZ
	WdbTPyGe/Ar1IsL6FLcuiyEvSlOgNC38OIyG2ZOzqpl1XAW5+3qM6VQBEzOqB/LEbt/6B7gMU2RRj
	YIeYgwWoKzQ5ys2vq9F8HfqkPO6Eus3t3PWq6/qeb0dEKgB5NVfQUE1vP7xmdaJPlyievb0GfQHCJ
	4qjBHJm1YW8Hsjr7RgkYeecEP/wyXVFZzqqohr4n0t+IwWT9tXC+IIFKXcG7ah0hKlb+vJSJUtGR4
	1nwzk9GsgnuMYlD/+57w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pberk-00544Q-JX; Mon, 13 Mar 2023 09:53:16 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbere-00541l-GX
	for ath11k@lists.infradead.org; Mon, 13 Mar 2023 09:53:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B9937B80D54;
	Mon, 13 Mar 2023 09:53:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DDEFC433D2;
	Mon, 13 Mar 2023 09:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678701187;
	bh=x6u+QHZ/yrtW4oMxZ8xAVWornOHySm8Eqv6ZRws+RJ4=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=e87vmpaRJifq2wYx2gksixrWREbapknb0xgWauBH2MNYzywJ602czAostEH4qdjXt
	 33RHWqsO40ZjD7DhWXYRhLFqQa0NzhEbEVVarUu8O0dloa6hvDzEDRhGuPXtCkCeal
	 hH/eIcgRl71z18Amj0XbgwrX2mI5IK75Y//FyQ9zuT+f7N3/c0PpdxoyJbwFHtgY+o
	 U4KjJl4jJ8DDRResbdXfSa9KOQqJfbwZSWZ5X+9EPlBxfsB/uHexmNtgy2yB7m32aY
	 /ofPSMxiXSDVmADSc3XWDxBx+L/8ZJ7SY/+szXBfzqmvHTlNCHTnZkEKwkizwigWvg
	 qxczu8+B8icGQ==
From: Kalle Valo <kvalo@kernel.org>
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,  Govindaraj Saminathan <quic_gsaminat@quicinc.com>,  Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
Subject: Re: [PATCH 1/2] wifi: ath11k: factory test mode support
References: <20230213130854.2473-1-quic_rajkbhag@quicinc.com>
	<20230213130854.2473-2-quic_rajkbhag@quicinc.com>
Date: Mon, 13 Mar 2023 11:53:01 +0200
In-Reply-To: <20230213130854.2473-2-quic_rajkbhag@quicinc.com> (Raj Kumar
	Bhagat's message of "Mon, 13 Feb 2023 18:38:53 +0530")
Message-ID: <87mt4hnfk2.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_025310_872146_5693A0B2 
X-CRM114-Status: GOOD (  26.46  )
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

Raj Kumar Bhagat <quic_rajkbhag@quicinc.com> writes:

> From: Govindaraj Saminathan <quic_gsaminat@quicinc.com>
>
> Add support to process factory test mode commands(FTM) for calibration.
> By default firmware start with NORMAL mode and to process the FTM commands
> firmware needs to be restarted in FTM mode using module parameter ftm_mode.
> The pre-request is all the radios should be down before starting the test.
>
> When start command ATH11K_TM_CMD_TESTMODE_START is received, ar state
> is set to Test Mode. If the FTM command or event length is greater
> than 256 bytes, it will be broken down into multiple segments and
> encoded with TLV header if it is segmented commands, else it is sent
> to firmware as it is.
>
> On receiving UTF event from firmware, if it is segmented event, the driver
> will wait until it receives all the segments and notify the complete
> data to user application. In case the segmented sequence are missed or
> lost from the firmware, driver will skip the already received partial data.
>
> In case of unsegmented UTF event from firmware, driver notifies the
> data to the user application as it comes. Applications handles
> the data further.
>
> Command to boot in ftm mode
> insmod ath11k ftm_mode=1
>
> Tested-on : IPQ8074 hw2.0 AHB WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: Govindaraj Saminathan <quic_gsaminat@quicinc.com>
> Co-developed-by: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
> Signed-off-by: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>

[...]

> --- a/drivers/net/wireless/ath/ath11k/core.c
> +++ b/drivers/net/wireless/ath/ath11k/core.c
> @@ -1,7 +1,7 @@
>  // SPDX-License-Identifier: BSD-3-Clause-Clear
>  /*
>   * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
> - * Copyright (c) 2021-2022 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2021-2023 Qualcomm Innovation Center, Inc. All rights reserved.
>   */
>  
>  #include <linux/module.h>
> @@ -32,6 +32,10 @@ module_param_named(frame_mode, ath11k_frame_mode, uint, 0644);
>  MODULE_PARM_DESC(frame_mode,
>  		 "Datapath frame mode (0: raw, 1: native wifi (default), 2: ethernet)");
>  
> +unsigned int ath11k_ftm_mode;
> +module_param_named(ftm_mode, ath11k_ftm_mode, uint, 0444);
> +MODULE_PARM_DESC(ftm_mode, "Boots up in factory test mode");

I changed this to bool as there's only two values, true or false.

> @@ -1362,6 +1366,11 @@ static int ath11k_core_soc_create(struct ath11k_base *ab)
>  {
>  	int ret;
>  
> +	if (ath11k_ftm_mode) {
> +		ab->fw_mode = ATH11K_FIRMWARE_MODE_FTM;
> +		ath11k_info(ab, "Booting in ftm mode\n");
> +	}

I changed this to:

"Booting in factory test mode\n"

> @@ -1822,6 +1832,10 @@ static void ath11k_core_post_reconfigure_recovery(struct ath11k_base *ab)
>  			ath11k_warn(ab,
>  				    "device is wedged, will not restart radio %d\n", i);
>  			break;
> +		case ATH11K_STATE_TM:
> +			ath11k_warn(ab, "fw mode reset done radio %d\n", i);
> +			break;

What is this warning supposed to tell the user? Should it be a debug
message instead?

> @@ -530,6 +531,7 @@ enum ath11k_state {
>  	ATH11K_STATE_RESTARTING,
>  	ATH11K_STATE_RESTARTED,
>  	ATH11K_STATE_WEDGED,
> +	ATH11K_STATE_TM,

For consistency I renamed this to ATH11K_STATE_FTM.

> --- a/drivers/net/wireless/ath/ath11k/debug.h
> +++ b/drivers/net/wireless/ath/ath11k/debug.h
> @@ -1,6 +1,7 @@
>  /* SPDX-License-Identifier: BSD-3-Clause-Clear */
>  /*
>   * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
>   */
>  
>  #ifndef _ATH11K_DEBUG_H_
> @@ -33,6 +34,7 @@ __printf(2, 3) void ath11k_err(struct ath11k_base *ab, const char *fmt, ...);
>  __printf(2, 3) void ath11k_warn(struct ath11k_base *ab, const char *fmt, ...);
>  
>  extern unsigned int ath11k_debug_mask;
> +extern unsigned int ath11k_ftm_mode;

As the variable is is in core.c I moved this to core.h.

> @@ -5838,6 +5841,11 @@ static int ath11k_mac_op_start(struct ieee80211_hw *hw)
>  	struct ath11k_pdev *pdev = ar->pdev;
>  	int ret;
>  
> +	if (ath11k_ftm_mode) {
> +		ath11k_err(ab, "fail to start mac operations in ftm mode\n");

I changed this to:

ath11k_warn(ab, "mac operations not supported in factory test mode\n");

> +		return -EWOULDBLOCK;

EWOULDBLOCK is defined as EAGAIN, so it doesn't look approriate here. I
changed it to EOPNOTSUPP.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
