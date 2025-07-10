Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D6A1C83F17
	for <ath11k@archiver.kernel.org>; Thu, 10 Jul 2025 17:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E3Zohc0nzj3FVWgHmXsuojr1RG8LeIWFa1m+NDG2dEk=; b=YUXPWe/8aBghbvaqf0ebPvov53
	g9krLwKxyDzL+T0tdWgEJ02cDbaOP8o28g00itCUZk84+OSRv4Ow0Mea+H1olOy9MgNuKsJ4dZlej
	njIp7IlUfvaLyUwrxMoRz6jaWrd25x9RBbPyPTWHXOVz6+7V17usJ5jBPRd2m+Hzen9lFwgMQi0bX
	X0jwEM1xZd9HNSyTUT0pkQCots8s2R8nMEq6iSwPx0wIL5C9y9ZiuhykwwYzbMe3Wu65J2lCQyrew
	kTjfWqbA54ByoCat3iEKQ2DI0fa1RMIusxLVtlGuRfbu5zCtH47+HBaU7e4vhp/thm28F0cXtXvu4
	ybK5pz9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZuxV-0000000CZVG-3Wmc;
	Thu, 10 Jul 2025 17:21:21 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZssz-0000000CCmA-12qw
	for ath11k@lists.infradead.org;
	Thu, 10 Jul 2025 15:08:34 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1752160063; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Ey677D7vp5EHx9o22NhmGckpctpPOXMgkwrKyeE0GtEQnaMxWYzFFc4EmKX/B0i5bTYfNacI+XlqFl1CS9iAJu99gP7ycpTJ1MtaeVoRVgoA1FeimGjv1SO87DpcuVzyZQU8YuNuBTDDY8Azaj48abGEbWLt6sANpkVN5vRzSzw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1752160063; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=E3Zohc0nzj3FVWgHmXsuojr1RG8LeIWFa1m+NDG2dEk=; 
	b=IBv+vEKMEXET51NPwsWAZW0/tlx01+cFffz/UkspLw/IWquTYzKHnJddAszExQFr97VZ+HpU1WAbJlgXJ5YIJ08TYBANiYx2S+GwOaSaIISPJR1gwHbpXKi9wQNCFLp5YDCdyKkPBXBk2Dqugz5bFptPKLEgvE6tZj8NjaGK5Sw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=usama.anjum@collabora.com;
	dmarc=pass header.from=<usama.anjum@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1752160063;
	s=zohomail; d=collabora.com; i=usama.anjum@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=E3Zohc0nzj3FVWgHmXsuojr1RG8LeIWFa1m+NDG2dEk=;
	b=bEdYrqdJwiD1Hvw4frXuTi3fB/DJJPLsmxLTjS1MxJLXWsTb1VJKICpjzCXZqiFl
	KKBWUX045NEgZPlAfUEReYADODGYuwyyFdfXL1vteRkFYr24orL9vciBHgPe87/sKf9
	zBi5hvJaMbf7rWSH8gQS3IZAN6hdXrFht43SDSQQ=
Received: by mx.zohomail.com with SMTPS id 1752160060955259.8992334590108;
	Thu, 10 Jul 2025 08:07:40 -0700 (PDT)
Message-ID: <c40f13e8-7420-4046-880d-7c72620fc021@collabora.com>
Date: Thu, 10 Jul 2025 20:07:25 +0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] bus: mhi: keep device context through suspend cycles
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
 Manivannan Sadhasivam <mani@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
 Youssef Samir <quic_yabdulra@quicinc.com>,
 Matthew Leung <quic_mattleun@quicinc.com>, Yan Zhen <yanzhen@vivo.com>,
 Alexander Wilhelm <alexander.wilhelm@westermo.com>,
 Alex Elder <elder@kernel.org>, Kunwu Chan <chentao@kylinos.cn>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Siddartha Mohanadoss <smohanad@codeaurora.org>,
 Sujeev Dias <sdias@codeaurora.org>, Julia Lawall <julia.lawall@lip6.fr>,
 John Crispin <john@phrozen.org>, Muna Sinada <quic_msinada@quicinc.com>,
 Venkateswara Naralasetty <quic_vnaralas@quicinc.com>,
 Maharaja Kennadyrajan <quic_mkenna@quicinc.com>, mhi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Cc: kernel@collabora.com
References: <20250630074330.253867-1-usama.anjum@collabora.com>
 <20250630074330.253867-4-usama.anjum@collabora.com>
 <b72b3635-1c09-444f-98f5-30fcc219b297@oss.qualcomm.com>
Content-Language: en-US
From: Muhammad Usama Anjum <usama.anjum@collabora.com>
In-Reply-To: <b72b3635-1c09-444f-98f5-30fcc219b297@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_080833_350147_BC28D6FB 
X-CRM114-Status: GOOD (  13.21  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 7/8/25 3:15 PM, Krishna Chaitanya Chundru wrote:
> 
> 
> On 6/30/2025 1:13 PM, Muhammad Usama Anjum wrote:
>> Don't deinitialize the device context while going into suspend or
>> hibernation cycles. Otherwise the resume may fail if at resume time, the
>> memory pressure is high and no dma memory is available.
>>
>> Tested-on: WCN6855 WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.6
>>
>> Fixes: 3000f85b8f47 ("bus: mhi: core: Add support for basic PM operations")
>> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
>> ---
>>   drivers/bus/mhi/host/init.c | 11 ++++++-----
>>   1 file changed, 6 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
>> index 2e0f18c939e68..8f56e73fdc42e 100644
>> --- a/drivers/bus/mhi/host/init.c
>> +++ b/drivers/bus/mhi/host/init.c
>> @@ -1133,9 +1133,11 @@ int mhi_prepare_for_power_up(struct mhi_controller *mhi_cntrl)
>>         mutex_lock(&mhi_cntrl->pm_mutex);
>>   -    ret = mhi_init_dev_ctxt(mhi_cntrl);
> mhi init dev ctxt also initializes the ring pointers to base value,
> I think we should take care of them also ?
Are you referring to mhi_rings? They are getting initialized inside
mhi_init_dev_ctxt() and de-initialized in __mhi_deinit_dev_ctxt(). That's
why I've not handled them separately.

> 
> - Krishna Chaitanya.
>> -    if (ret)
>> -        goto error_dev_ctxt;
>> +    if (!mhi_cntrl->mhi_ctxt) {
>> +        ret = mhi_init_dev_ctxt(mhi_cntrl);
>> +        if (ret)
>> +            goto error_dev_ctxt;
>> +    }
>>         ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->regs, BHIOFF, &bhi_off);
>>       if (ret) {
>> @@ -1212,8 +1214,6 @@ void mhi_deinit_dev_ctxt(struct mhi_controller *mhi_cntrl)
>>   {
>>       mhi_cntrl->bhi = NULL;
>>       mhi_cntrl->bhie = NULL;
>> -
>> -    __mhi_deinit_dev_ctxt(mhi_cntrl);
>>   }
>>     void mhi_unprepare_after_power_down(struct mhi_controller *mhi_cntrl)
>> @@ -1234,6 +1234,7 @@ void mhi_unprepare_after_power_down(struct mhi_controller *mhi_cntrl)
>>       }
>>         mhi_deinit_dev_ctxt(mhi_cntrl);
>> +    __mhi_deinit_dev_ctxt(mhi_cntrl);
>>   }
>>   EXPORT_SYMBOL_GPL(mhi_unprepare_after_power_down);
>>   


