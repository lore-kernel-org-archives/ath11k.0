Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC1A5C433EF
	for <ath11k@archiver.kernel.org>; Tue,  5 Apr 2022 08:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SpA0Q7C5HOtx64YfN4s9G7RcIw7KD8MrvdDtmDF3bBE=; b=LFxTdD2K5o6+sQ
	0TTFuaSMfJY84EfAUzqVGKN+7Fz1RAYfy1ATNc5VVQgPdx8WBLr3WBnMhg2SgEbbvBOvi1K6b7ysW
	b2QiCumJMXsoEJBic4wwcfBKzwwRvlO3M52MxVNhUUc+LSLaWfUE+rllGXTIICjOgto+cpskRvqFp
	rvNDJN50zKPz/H9YBIS7yhwaymd/ZIowJQAHma+ML5b4pjOIzIJL7lozbS//LSyepUKE5GixUTRl3
	WUVXQhBaCWLOJ1hU7WFsWo6X8ylB6hU0HNkWQr6jijr9qOMgPN3Rt/nElmXB+R/ohIkcVTtYRzjCg
	sKrHcRaRxs7AIhhSnkxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbeFf-0009L2-0t; Tue, 05 Apr 2022 08:09:23 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbeFb-0009KS-Tg
 for ath11k@lists.infradead.org; Tue, 05 Apr 2022 08:09:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 91890B81B90;
 Tue,  5 Apr 2022 08:09:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66635C385A0;
 Tue,  5 Apr 2022 08:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649146157;
 bh=VzMbINFNTvSENLG/I6ooncrp2ypoqck+oxssEZccqoM=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=RRvQs/ew/vr6siHZtExBHLT9lWLJNq8Hyy4R9/QXp7goNUlHhRv5ouiMwqvaym8nS
 KW4UrRfoLi8M+IRhl/WIajFgH0jx31qT3ibM9ZFQrAHYdqRlZ69JFr4akgquE80Yfd
 V1tnoHoTaYjq3BDO1Fj3lO8/3IjN7HLvqiRG0siMp5r/YC+cjF+birFgWxCppUzAxC
 VvDmsjqvYw/5WKT9MnoNdmnb4frQKfqNcCimdVDHvvNvs4bwF+DR0K3GPtAmb8/W5r
 Q4F/B1EBeYk/vuJWtsDH4Lgg2Pxzpu+KG1fLu3PrDFEWOVEvDt5o870PXs+mn7XCLm
 EJIcfYqJOZPFA==
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Change max no of active probe SSID and BSSID to fw
 capability
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220329150221.21907-1-quic_kathirve@quicinc.com>
References: <20220329150221.21907-1-quic_kathirve@quicinc.com>
To: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <164914615451.12306.2945099051936753478.kvalo@kernel.org>
Date: Tue,  5 Apr 2022 08:09:16 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_010920_150200_8427F6D4 
X-CRM114-Status: UNSURE (   9.88  )
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

Karthikeyan Kathirvel <quic_kathirve@quicinc.com> wrote:

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
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.7.0.1-01300-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

50dc9ce9f805 ath11k: Change max no of active probe SSID and BSSID to fw capability

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220329150221.21907-1-quic_kathirve@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
