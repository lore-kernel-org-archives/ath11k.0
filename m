Return-Path: <SRS0=w2Qz=OR=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12062C433F5
	for <ath11k@archiver.kernel.org>; Mon, 27 Sep 2021 04:22:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B59CB6113A
	for <ath11k@archiver.kernel.org>; Mon, 27 Sep 2021 04:22:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B59CB6113A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KFFDQ//TqaEpyGpatB7WrMDbu3wO0pQMhNHRPx8TR0c=; b=vLVpTUwmkhqwkUzkjLhJqz5DhP
	DUxTC5aNqMZacdOoXC625RNDfnueBfGCnrHAo/1scWie/meNc1DwhSqYuo3uaSrUsjTOiinNKyWXn
	fKYTVqs/vbTjCBBCvLqYikiDQou3EbhWPmCgNBURMHbKlSkm2O+NmEtUj0TUp9SIg1/xdgsDKAFGY
	FygiQyzCEqYlpS3JGT/mG657MU8Ahj2cNAC/jJWjQEYDTaP9Qm/0yFse4RZhmBCi0icvIOznYU9sG
	YeDExrmuIGvt43D3NHvutRXRkvuFdq0Vqdpq6qkHOmf56FYagTJtIlfIwD3x6/kCyzIQo5ijHb67y
	JMX9IeMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUi9V-001XhS-RY; Mon, 27 Sep 2021 04:22:05 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUi9S-001Xab-Te
 for ath11k@lists.infradead.org; Mon, 27 Sep 2021 04:22:04 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1632716522; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=/H6WzJGD04JtDBNYTdt2svMoXCShbLV7vBBRYEn/Lug=;
 b=bHxOjisonRvgDkCBRNwKxGQH7ht2EoC7jCnK2YKxYfnvomc87foSg2dLjc/4a1G6FqKtQPN3
 O2cRCuIrGSjAUPsyHCQY4Go+gDH8o4pY8EG/rASwkIPPhv5dMLE14J60EF3PECsvGZ4HSoyV
 H/opur6/GXqOy1ax1/88vS1tJH8=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 615146ea713d5d6f96915753 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 27 Sep 2021 04:22:02
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 3E3AEC43616; Mon, 27 Sep 2021 04:22:01 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: akolli)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E7EC8C4360C;
 Mon, 27 Sep 2021 04:21:59 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 27 Sep 2021 09:51:59 +0530
From: akolli@codeaurora.org
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Jouni Malinen <jouni@codeaurora.org>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org
Subject: Re: [PATCH 1/4] ath11k: use hw_params to access board_size and
 cal_offset
In-Reply-To: <87a6k2rptc.fsf@codeaurora.org>
References: <20210721201927.100369-1-jouni@codeaurora.org>
 <20210721201927.100369-2-jouni@codeaurora.org>
 <87a6k2rptc.fsf@codeaurora.org>
Message-ID: <03d382622d9d8a48b35b923d16ca5710@codeaurora.org>
X-Sender: akolli@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210926_212203_069803_3A5AE52A 
X-CRM114-Status: GOOD (  15.75  )
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

On 2021-09-24 20:19, Kalle Valo wrote:
> Jouni Malinen <jouni@codeaurora.org> writes:
> 
>> From: Anilkumar Kolli <akolli@codeaurora.org>
>> 
>> Reuse board_size from hw_params, add cal_offset to hw params.
>> This patch is clean up only, there is no change in functionality.
>> 
>> Tested-on: IPQ8074 hw2.0 AHB 
>> WLAN.HK.2.4.0.1-00009-QCAHKSWPL_SILICONZ-1
>> Tested-on: QCN9074 hw1.0 PCI 
>> WLAN.HK.2.4.0.1-01838-QCAHKSWPL_SILICONZ-1
>> 
>> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
>> Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
>> ---
>>  drivers/net/wireless/ath/ath11k/core.c | 10 +++++-----
>>  drivers/net/wireless/ath/ath11k/hw.h   |  2 +-
>>  drivers/net/wireless/ath/ath11k/qmi.c  |  4 ++--
>>  drivers/net/wireless/ath/ath11k/qmi.h  |  2 --
>>  4 files changed, 8 insertions(+), 10 deletions(-)
>> 
>> diff --git a/drivers/net/wireless/ath/ath11k/core.c 
>> b/drivers/net/wireless/ath/ath11k/core.c
>> index c97830633f1f..d2ab3b134632 100644
>> --- a/drivers/net/wireless/ath/ath11k/core.c
>> +++ b/drivers/net/wireless/ath/ath11k/core.c
>> @@ -37,7 +37,7 @@ static const struct ath11k_hw_params 
>> ath11k_hw_params[] = {
>>  		.fw = {
>>  			.dir = "IPQ8074/hw2.0",
>>  			.board_size = 256 * 1024,
>> -			.cal_size = 256 * 1024,
>> +			.cal_offset = 128 * 1024,
>>  		},
>>  		.max_radios = 3,
>>  		.bdf_addr = 0x4B0C0000,
>> @@ -87,7 +87,7 @@ static const struct ath11k_hw_params 
>> ath11k_hw_params[] = {
>>  		.fw = {
>>  			.dir = "IPQ6018/hw1.0",
>>  			.board_size = 256 * 1024,
>> -			.cal_size = 256 * 1024,
>> +			.cal_offset = 128 * 1024,
>>  		},
>>  		.max_radios = 2,
>>  		.bdf_addr = 0x4ABC0000,
>> @@ -134,7 +134,7 @@ static const struct ath11k_hw_params 
>> ath11k_hw_params[] = {
>>  		.fw = {
>>  			.dir = "QCA6390/hw2.0",
>>  			.board_size = 256 * 1024,
>> -			.cal_size = 256 * 1024,
>> +			.cal_offset = 128 * 1024,
>>  		},
>>  		.max_radios = 3,
>>  		.bdf_addr = 0x4B0C0000,
>> @@ -180,7 +180,7 @@ static const struct ath11k_hw_params 
>> ath11k_hw_params[] = {
>>  		.fw = {
>>  			.dir = "QCN9074/hw1.0",
>>  			.board_size = 256 * 1024,
>> -			.cal_size = 256 * 1024,
>> +			.cal_offset = 128 * 1024,
>>  		},
>>  		.max_radios = 1,
>>  		.single_pdev_only = false,
>> @@ -226,7 +226,7 @@ static const struct ath11k_hw_params 
>> ath11k_hw_params[] = {
>>  		.fw = {
>>  			.dir = "WCN6855/hw2.0",
>>  			.board_size = 256 * 1024,
>> -			.cal_size = 256 * 1024,
>> +			.cal_offset = 128 * 1024,
>>  		},
>>  		.max_radios = 3,
>>  		.bdf_addr = 0x4B0C0000,
>> diff --git a/drivers/net/wireless/ath/ath11k/hw.h 
>> b/drivers/net/wireless/ath/ath11k/hw.h
>> index 5d150cd793b2..3a03e09563e7 100644
>> --- a/drivers/net/wireless/ath/ath11k/hw.h
>> +++ b/drivers/net/wireless/ath/ath11k/hw.h
>> @@ -128,7 +128,7 @@ struct ath11k_hw_params {
>>  	struct {
>>  		const char *dir;
>>  		size_t board_size;
>> -		size_t cal_size;
>> +		size_t cal_offset;
> 
> You don't mention anything about cal_size. I'll add this to the commit
> log:
> 
> cal_size was unused, so remove that.

Yes. Thanks for adding.

- Anil.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
