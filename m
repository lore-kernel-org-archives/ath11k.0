Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9879DC433F5
	for <ath11k@archiver.kernel.org>; Fri, 29 Apr 2022 10:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vVqN9PH0fE+1MHMBAlSMiJQ01pZ9TriOnfv2JsZe9qY=; b=bili9DZZekPOwZ
	aEXkGdyhOSduhEQduFZBmbwc4DGGv8krbarUTmNM36uBxY7KFUekVfXuPJ7Cj313JGYoNiYiK/xoC
	sGoiAK/9ponv/de42xrHCpCFOcS1XldVr7Gyttrvh3Gl3gyX932h9pLKGBUnhvf7ke3c6v1hfksgN
	dOQi1O7NrsVLh0Bhuu66TAw0xV8X70lRRVAQtwPgdoO8Y14+om5JQcI4ayFVosfA6SMFOZIJywpzy
	5Bl7TTNWu1TZRpKujR7eOLxSk7hPYTqo1SrqpRSVSHOzUGN/gpyExf4SaYB8nIkmKlf0q64IyUrPD
	aTwAtsOIJdbx09XKd8Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkNpL-00AmZr-PX; Fri, 29 Apr 2022 10:26:19 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkNgj-00AhLS-Jk
 for ath11k@lists.infradead.org; Fri, 29 Apr 2022 10:17:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1651227445; x=1682763445;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=jV8p+d24/N7KDNyhAMbE3UbsM26Maj+9OmdbzkL2JsM=;
 b=ea0xLBLTyL3XVj0h0VE4ZdxjyOB30Iq6yy9dtITRTG112ET2zXZlpFsJ
 /3m3eKiM4FHNwdoNibzGDmPa8ttfSZeoUqiP/GI62tP8IKhEtKhHnAuvp
 4VJc+jabqE+ex7SbGv83JsYHWjgS99nExjyYFEXv2YR9EHWYKBHnAZtYf M=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 29 Apr 2022 03:17:20 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2022 03:17:19 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 29 Apr 2022 03:17:19 -0700
Received: from [10.50.21.2] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 29 Apr
 2022 03:17:16 -0700
Message-ID: <ab4e4298-a2d6-d66b-f90f-4282dd3f1454@quicinc.com>
Date: Fri, 29 Apr 2022 15:47:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v6 4/9] ath11k: Add register access logic for WCN6750
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <robh@kernel.org>, <mka@chromium.org>
References: <20220427111848.9257-1-quic_mpubbise@quicinc.com>
 <20220427111848.9257-5-quic_mpubbise@quicinc.com> <87pml2g1c7.fsf@kernel.org>
 <6e607455-e42a-a591-f58b-b3b2c83ea2cc@quicinc.com>
 <87h76cdxn2.fsf@kernel.org>
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
In-Reply-To: <87h76cdxn2.fsf@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_031725_690980_CD05F5C9 
X-CRM114-Status: GOOD (  12.82  )
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

On 4/29/2022 3:22 PM, Kalle Valo wrote:
> Manikanta Pubbisetty <quic_mpubbise@quicinc.com> writes:
> 
>>>> @@ -704,11 +718,26 @@ static int ath11k_pci_probe(struct pci_dev *pdev,
>>>>    {
>>>>    	struct ath11k_base *ab;
>>>>    	struct ath11k_pci *ab_pci;
>>>> +	const struct ath11k_bus_params *bus_params;
>>>>    	u32 soc_hw_version_major, soc_hw_version_minor, addr;
>>>>    	int ret;
>>>>    +	switch (pci_dev->device) {
>>>> +	case QCA6390_DEVICE_ID:
>>>> +	case WCN6855_DEVICE_ID:
>>>> +		bus_params = &ath11k_pci_bus_params_qca6390;
>>>> +		break;
>>>> +	case QCN9074_DEVICE_ID:
>>>> +		bus_params = &ath11k_pci_bus_params_qcn9074;
>>>> +		break;
>>>
>>> Now you are making bus_params device specific, that's not really the
>>> point of bus params. They are supposed to be _bus_ specific parameters.
>>>
>>> Can't you use hw_params like I mentioned in the review?
>>>
>>
>> Even without this patch, as of today, bus_params is already device
>> specific with QCN9074 changing the static_window_map in bus_params to
>> true in ath11k_pci_probe().
> 
> Yeah, that's a mistake which slipped in review.
> 
>> And if we have to move these device specific bus_params to hw_parmas,
>> then bus_params can be pretty much removed completely with the changes
>> that WCN6750 bring in. Any thoughts on this? I can make the changes
>> that can get along with WCN6750 series.
> 
> My original idea with bus_params was to there are bus specific
> parameters and that way we could simplify hw_params. Clearly that's not
> working and I agree with you, bus_params should be removed. So it would
> be good if you can do that in the next patchset.
> 

Sure Kalle, pls ignore V6 for now, I'll send out V7 with the bus_params 
completely removed.

Thanks,
Manikanta

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
