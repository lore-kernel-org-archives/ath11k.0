Return-Path: <SRS0=DASI=OS=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F59BC433EF
	for <ath11k@archiver.kernel.org>; Tue, 28 Sep 2021 12:02:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C81860F6B
	for <ath11k@archiver.kernel.org>; Tue, 28 Sep 2021 12:02:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2C81860F6B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cjO5eNsXxViPPbdmNZnE6Zdg4tWPYwDKgSzIhEsXQnI=; b=ltzl5gTdr14/gAShQ6EAL9N9l0
	nkl1D+5m7p4MSO1PKvE48rDPngUbYjj5ACdSROnWHHwudbW2GVbud2xxcsiEGaEyFskhSpEEYQcjr
	p4eby57elxDp9BqSVGVFPBOmV81mxl0qL/blkCnGMKmNwH/3HwVc9IocSG4P1vXANrztZgqt72D7j
	JtucbNJnYHVhlMp6agwDvbBaFuyAbfx2yOxLTlt+IClljRuATKo9fSq5aB/ayuQjGhyyk2LaTQHea
	39Co2zbNjK+1Dhwg/lbsKXMDFXvd7IDYlAkIwZLA3P3+ZXqM2biARKGkKPLXUTeYJ8spEBxJlm0jW
	C5ON/P7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVBoH-0070Oc-SB; Tue, 28 Sep 2021 12:02:09 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVBo8-0070N0-US
 for ath11k@lists.infradead.org; Tue, 28 Sep 2021 12:02:08 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1632830527; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=HfBGPX+AtSvHhPxa35WuC6Y62tQn06H4I5i2eOknHF0=;
 b=NeyCZzj78LET8heTWBmyI0dpXLlyh0lN/wFAUGP56uUPggfo6tCbCs+V6Uqj077eKYv914Ym
 WU4ZSMNPai4xLle+FBiPtFHHvY2QtSV7S99HU5qIpEJq225nG+ZhKMvS5k/lLFBHWAV7nk88
 ByFTCe1lNnaj2y1kA7TAAr5Fo4k=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 6153040f519bd8dcf0667e5b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 28 Sep 2021 12:01:19
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 9CB54C43460; Tue, 28 Sep 2021 12:01:19 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: ramess)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id F037DC4338F;
 Tue, 28 Sep 2021 12:01:17 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 28 Sep 2021 17:31:17 +0530
From: Rameshkumar Sundaram <ramess@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Jouni Malinen <jouni@codeaurora.org>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, Sathishkumar Muruganandam
 <murugana@codeaurora.org>
Subject: Re: [PATCH 10/12] ath11k: Send PPDU_STATS_CFG with proper pdev mask
 to firmware
In-Reply-To: <87a6jxq8nx.fsf@codeaurora.org>
References: <20210721212029.142388-1-jouni@codeaurora.org>
 <20210721212029.142388-10-jouni@codeaurora.org>
 <87a6jxq8nx.fsf@codeaurora.org>
Message-ID: <83ee98a2c461e16800dd80ba75429b63@codeaurora.org>
X-Sender: ramess@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_050207_334749_6D6D32FC 
X-CRM114-Status: GOOD (  19.92  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 2021-09-28 16:16, Kalle Valo wrote:
> Jouni Malinen <jouni@codeaurora.org> writes:
> 
>> From: Rameshkumar Sundaram <ramess@codeaurora.org>
>> 
>> HTT_PPDU_STATS_CFG_PDEV_ID bit mask for target FW PPDU stats request
>> message was set as bit 8 to 15. Bit 8 is reserved for soc stats and
>> pdev id starts from bit 9. Hence change the bitmask as bit 9 to 15
>> and fill the proper pdev id in the request message.
>> 
>> Tested on: IPQ8074 hw2.0 AHB 
>> WLAN.HK.2.5.0.1-01092-QCAHKSWPL_SILICONZ-1
>> Tested on: IPQ6018 hw1.0 WLAN.HK.2.5.0.1-01067-QCAHKSWPL_SILICONZ-1
>> 
>> Fixes: 701e48a43e15 ("ath11k: add packet log support for QCA6390")
>> 
>> Co-developed-by: Sathishkumar Muruganandam <murugana@codeaurora.org>
>> Signed-off-by: Sathishkumar Muruganandam <murugana@codeaurora.org>
>> Signed-off-by: Rameshkumar Sundaram <ramess@codeaurora.org>
>> Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
>> ---
>>  drivers/net/wireless/ath/ath11k/dp.h    | 3 ++-
>>  drivers/net/wireless/ath/ath11k/dp_tx.c | 2 +-
>>  2 files changed, 3 insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/net/wireless/ath/ath11k/dp.h 
>> b/drivers/net/wireless/ath/ath11k/dp.h
>> index b2e7621969c5..522d3a6ce253 100644
>> --- a/drivers/net/wireless/ath/ath11k/dp.h
>> +++ b/drivers/net/wireless/ath/ath11k/dp.h
>> @@ -541,7 +541,8 @@ struct htt_ppdu_stats_cfg_cmd {
>>  } __packed;
>> 
>>  #define HTT_PPDU_STATS_CFG_MSG_TYPE		GENMASK(7, 0)
>> -#define HTT_PPDU_STATS_CFG_PDEV_ID		GENMASK(15, 8)
>> +#define HTT_PPDU_STATS_CFG_SOC_STATS		BIT(8)
>> +#define HTT_PPDU_STATS_CFG_PDEV_ID		GENMASK(15, 9)
> 
> This part is clear after reading the commit log.
> 
>> --- a/drivers/net/wireless/ath/ath11k/dp_tx.c
>> +++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
>> @@ -906,7 +906,7 @@ int ath11k_dp_tx_htt_h2t_ppdu_stats_req(struct 
>> ath11k *ar, u32 mask)
>>  		cmd->msg = FIELD_PREP(HTT_PPDU_STATS_CFG_MSG_TYPE,
>>  				      HTT_H2T_MSG_TYPE_PPDU_STATS_CFG);
>> 
>> -		pdev_mask = 1 << (i + 1);
>> +		pdev_mask = 1 << (ar->pdev_idx + i);
>>  		cmd->msg |= FIELD_PREP(HTT_PPDU_STATS_CFG_PDEV_ID, pdev_mask);
>>  		cmd->msg |= FIELD_PREP(HTT_PPDU_STATS_CFG_TLV_TYPE_BITMASK, mask);
> 
> But this part isn't. All I can see in the commit log is a vague comment
> "and fill the proper pdev id in the request message" and nothing else.
> Please provide a proper explanation for this change and I can then add
> that to the commit log.

Hi Kalle,
In patch 701e48a43e15 ("ath11k: add packet log support for QCA6390") ,
both HTT_PPDU_STATS_CFG_PDEV_ID and pdev_mask were changed, but this 
pdev_mask calculation
is not valid for platforms which has multiple pdevs with 1 rxdma per 
pdev, as this is writing same value(i.e. 2) for all pdevs.
Hence fixed it to consider pdev_idx as well, to make it compatible for 
both single and multi pd cases.


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
