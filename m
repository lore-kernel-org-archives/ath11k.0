Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A757C433F5
	for <ath11k@archiver.kernel.org>; Wed,  8 Dec 2021 12:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gZvTygUlg/C4ZUHvg0fP1YBv9q7ellCymN7pUrNfTPc=; b=S389ZbI3DGjS8NZzAUykkhzP+Q
	PbiMQtmj+DLtKu49j9JOSmYZYheu/hn5EJh5kwkduqFpEuZHsCGYCmRmv6S+xX5G/JhZzs8eohFPK
	JHi9uAdKw3l1pwmO86cgkcBsRIH9BU7b/kypCN+5MxVJyUL5BwKdYzJ66KyqD06iX85iRnAZBGxKx
	YIKUWK6ndThU6Zlo9X6gQ9Ztb30cP55X6ud7y9yhji/sNwfaX3B6u9FFABKcgscVtZ5JwAzpZitO7
	y2sYQj4D+6/iFR9j7AXuFA/ak6RQWCNklF5KaIXaT6UqAGiHbD04qaeZ9IQwr9h3BDRl/Rw23p0YG
	0DThgzRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muwEl-00CWzo-HT; Wed, 08 Dec 2021 12:39:55 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muwEi-00CWzK-KQ
 for ath11k@lists.infradead.org; Wed, 08 Dec 2021 12:39:54 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1638967191; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=y6ZVfcg+sVRy5P1hPdcn6foFe/ecLIz95SvVzkTCvfw=;
 b=vUmj9fj/zohgtoZnHibRjb3BLaMnYloK2wp3MmICp/9LW3zHsyxlzCsF7IcZlmxurzNM2U+Y
 KHhqBZdk/9ENYYI/JiipArmf8yjZaGH/vuJreJ4dLLGWh7G7dcCKfUVjJT/rjaE+SuWV5ZeX
 XAyfETLNoJjUUUkc1+9W4WB/No8=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 61b0a7973553c354bee7cf14 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 08 Dec 2021 12:39:51
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 36963C4360D; Wed,  8 Dec 2021 12:39:50 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: akolli)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id C4942C4338F;
 Wed,  8 Dec 2021 12:39:49 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 08 Dec 2021 18:09:49 +0530
From: Anilkumar Kolli <akolli@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Jouni Malinen <jouni@codeaurora.org>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, Seevalamuthu Mariappan
 <seevalam@codeaurora.org>
Subject: Re: [PATCH 12/12] ath11k: Change QCN9074 firmware to operate in mode-2
In-Reply-To: <871r3lkcqc.fsf@codeaurora.org>
References: <20210721212029.142388-1-jouni@codeaurora.org>
 <20210721212029.142388-12-jouni@codeaurora.org>
 <871r3lkcqc.fsf@codeaurora.org>
Message-ID: <2918b38bca0d8d1fac8f1edabe5ecce0@codeaurora.org>
X-Sender: akolli@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211208_043952_777696_B5D70FEE 
X-CRM114-Status: GOOD (  18.53  )
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

On 2021-11-12 13:49, Kalle Valo wrote:
> Jouni Malinen <jouni@codeaurora.org> writes:
> 
>> From: Seevalamuthu Mariappan <seevalam@codeaurora.org>
>> 
>> In mode-2 QCN9074 firmware uses 15 MB of host memory and firmware
>> request 1 MB size segments in QMI, whereas in mode-0 firmware uses 45 
>> MB
>> of host memory and each segment is of 2 MB size. In mode-2 firmware
>> operates with reduced number of vdevs and peers.
>> 
>> Tested-on: QCN9074 hw1.0 PCI 
>> WLAN.HK.2.4.0.1-01838-QCAHKSWPL_SILICONZ-1
>> 
>> Signed-off-by: Seevalamuthu Mariappan <seevalam@codeaurora.org>
>> Co-developed-by: Anilkumar Kolli <akolli@codeaurora.org>
>> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
>> Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
>> ---
>>  drivers/net/wireless/ath/ath11k/core.c | 23 ++++++++++++++++++++++-
>>  drivers/net/wireless/ath/ath11k/core.h |  6 ++++++
>>  drivers/net/wireless/ath/ath11k/hw.c   | 14 +++++++-------
>>  drivers/net/wireless/ath/ath11k/hw.h   | 20 +++++++++++---------
>>  drivers/net/wireless/ath/ath11k/mac.c  | 10 +++++-----
>>  drivers/net/wireless/ath/ath11k/qmi.c  |  2 +-
>>  6 files changed, 52 insertions(+), 23 deletions(-)
>> 
>> diff --git a/drivers/net/wireless/ath/ath11k/core.c 
>> b/drivers/net/wireless/ath/ath11k/core.c
>> index d2ab3b134632..9f2c9795767e 100644
>> --- a/drivers/net/wireless/ath/ath11k/core.c
>> +++ b/drivers/net/wireless/ath/ath11k/core.c
>> @@ -77,6 +77,7 @@ static const struct ath11k_hw_params 
>> ath11k_hw_params[] = {
>>  		.supports_shadow_regs = false,
>>  		.idle_ps = false,
>>  		.cold_boot_calib = true,
>> +		.fw_mem_mode = 0,
>>  		.supports_suspend = false,
>>  		.hal_desc_sz = sizeof(struct hal_rx_desc_ipq8074),
>>  		.fix_l1ss = true,
> 
> [...]
> 
>> +static const struct ath11k_num_vdevs_peers ath11k_vdevs_peers[] = {
>> +	{
>> +		.num_vdevs = (16 + 1),
>> +		.num_peers = 512,
>> +	},
>> +	{
>> +		.num_vdevs = (8 + 1),
>> +		.num_peers = 128,
>> +	},
>> +	{
>> +		.num_vdevs = 8,
>> +		.num_peers = 128,
>> +	},
>> +};
> 
> I am worried about this array. It implies that _all_ hardware support
> these modes but is that really the case? I would guess that these are
> very much hardware and firmware specific values.
> 
> So because of that I would feel clearer to have num_vdevs and num_peers
> in ath11k_hw_params, to make it clear that the values are hardware
> specific. And then have fw_mem_mode, num_vdevs and num_peers in their
> own struct within struct ath11k_hw_params, just like spectral has
> grouped valued together.
> 

Sorry for the delayed response. I will make num_vdevs and num_peers part 
of hw_params.
and post next version.

Thanks
Anil

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
