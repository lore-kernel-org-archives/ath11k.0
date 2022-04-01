Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9796DC433F5
	for <ath11k@archiver.kernel.org>; Fri,  1 Apr 2022 11:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EbCXmDDvUGhLMdIB+Bq5xQPBUxTR7SSRcFi7fNSkqec=; b=RrOrx/9hdZyWsM
	nG1dkGand4ooVGXaXA9gE8OL+ZJxnHirkxAu2I9he7pdKu5/qj14oLK6K9IsWhLu6AimaF8tRvz1v
	XLGMcWL9HbWS7pk3m6vuMknBPvJYVfxGWg1CJH4DciQh0R7XGSDI4WfLCsQI0knLv32M35Sf4yBIE
	9zGzgCEfqK0j9rLarJOQ2WutjgcI00upC5b0FdKuy1AKowZjJVc230eSx3tnonvFaUDivSETeNTFv
	DyhDYUP9yEzIUAmHRIfVAyJ3WRiwp/7d0w/+NL6FcNZm0jNiU0/yH1XmRkCUseaLY7uyXE4f90YyQ
	vY/NU3Vqt5W+lkM4pMKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naFs1-005Pof-Bb; Fri, 01 Apr 2022 11:55:13 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naFry-005PoK-La
 for ath11k@lists.infradead.org; Fri, 01 Apr 2022 11:55:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 418F7B823FB;
 Fri,  1 Apr 2022 11:55:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38647C340F2;
 Fri,  1 Apr 2022 11:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648814108;
 bh=y6XcPGh3sC2XlAg+TUUW/ULmKjUaOfKpUMeAfKPhDP0=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=XxBxNsdZN8wAmhmmR/ZZjd7i4wuLyHDUFYp0Pvex/dAnXVC9IsPgw4cHtAJG2I58D
 bKlbjmHqJWbmvx1iumWsO47QRI8OAy2w5tpBa5WfNE/0XEeVhpGze2faLjoY2RIesf
 enZiwCXWsMCV3ploLqF3P1ft9uJxJDazbjDeKwzriKVnYb0Qc8yb2+LAHsGEibCRyW
 5XTJNT+1zfeCw79Sce3JDwDUyd7djTLm3zIYcEbyFU8XrR9jHqAqVXSAJ8yGzqDC5a
 Z1J4KDT1Mr6kw7a8Kb+9dWLDYv9SMxiJXTFx0IIEfNDEihkm5mCtuSjoz3BvlVPVga
 JYT8yIoOBowCQ==
From: Kalle Valo <kvalo@kernel.org>
To: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH] ath11k: Change max no of active probe SSID and BSSID to
 fw capability
References: <20220329150221.21907-1-quic_kathirve@quicinc.com>
Date: Fri, 01 Apr 2022 14:55:01 +0300
In-Reply-To: <20220329150221.21907-1-quic_kathirve@quicinc.com> (Karthikeyan
 Kathirvel's message of "Tue, 29 Mar 2022 20:32:21 +0530")
Message-ID: <87wng9t3vu.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_045510_879101_5521E35D 
X-CRM114-Status: GOOD (  11.36  )
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

Karthikeyan Kathirvel <quic_kathirve@quicinc.com> writes:

> The maximum number of SSIDs in a for active probe requests is currently
> reported as 16 (WLAN_SCAN_PARAMS_MAX_SSID) when registering the driver.
> The scan_req_params structure only has the capacity to hold 10 SSIDs.
> This leads to a buffer overflow which can be triggered from
> wpa_supplicant in userspace. When copying the SSIDs into the
> scan_req_params structure in the ath11k_mac_op_hw_scan route, it can
> overwrite the extraie pointer.
>
> Firmware supports 16 ssid * 4 bssid, for each ssid 4 bssid combo probe
> request will be sent, so totally 64 probe requests supported. So
> set both max ssid and bssid to 16 and 4 respectively. Remove the
> redundant macros of ssid and bssid.
>
> Tested-on : WLAN.HK.2.7.0.1-01300-QCAHKSWPL_SILICONZ-1 v1

This is not correct format:

https://wireless.wiki.kernel.org/en/users/drivers/ath11k/submittingpatches#tested-on_tag

On what hardware did you test this? I can then fix the tag.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
