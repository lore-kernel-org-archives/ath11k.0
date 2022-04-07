Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4666DC433FE
	for <ath11k@archiver.kernel.org>; Thu,  7 Apr 2022 05:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JqUYqqm64uvLkTUhOVb+lMLsJ8U0C2AODnxaR7xKms0=; b=ryssRdkFhh3AY0
	2IcQ2sDFETHwybE4G+7e2sdrRYgfAQoqFBnaPlws2/tarO87lk86l8EIJsXFmUTYuCxAZ72Wo1AFv
	gbnzF8XTkq9SOwh3XMVx87Jim5XUSlsTWl5LgCyXF33mtjy9np5MJZCLGTSFnA/p3cOUIulXpW7Rg
	oiWpFeU5+8lgzdiUTWSbMRHbVUun7HBo0NDJaEwJK/q8rltTXM0jCQuYA6hCn/z7qTdhg92JupRA1
	92KeMNMe//6M1JO0WB5gkQ2kGfSk420fhpZLmf/x3BqJOc/E5QRzZqyMerecqsD2kZmr/BLX0bqsp
	BFGa5CI+ZDyD9pp/YcmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncKae-009Vxe-0q; Thu, 07 Apr 2022 05:21:52 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncKaa-009Vvg-PP
 for ath11k@lists.infradead.org; Thu, 07 Apr 2022 05:21:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1649308908; x=1680844908;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=1EpOUVY650Sk0li7cGYf29RiOHs7Ea9JKGbs8flcp4w=;
 b=Jn3rwNqSrYUmACJ7fVuFT2ymkvZYnL52K792R6w8IHbal/0wl0zCeJfm
 7QGj+SJ1Xn94ZPnswiHxbsGqcTTwHcofNiEjnFRT1EsjxD+53jpyBP/d7
 gsRdGF0VFo1fIdIQ2iG3R4D2fKiJFI4M94LukxUMT0baz57JyzJ/TkaJe k=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 06 Apr 2022 22:21:47 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2022 22:21:46 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 6 Apr 2022 22:21:46 -0700
Received: from [10.50.10.231] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 6 Apr 2022
 22:21:43 -0700
Message-ID: <e2fd6542-38fe-a855-1d8f-65799970727e@quicinc.com>
Date: Thu, 7 Apr 2022 10:51:37 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v4 01/12] dt: bindings: net: add bindings of WCN6750 for
 ath11k
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <mka@chromium.org>,
 <ath11k@lists.infradead.org>, <devicetree@vger.kernel.org>
References: <20220406094107.17878-1-quic_mpubbise@quicinc.com>
 <20220406094107.17878-2-quic_mpubbise@quicinc.com>
 <Yk2s+srO9DKP7xW1@robh.at.kernel.org>
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
In-Reply-To: <Yk2s+srO9DKP7xW1@robh.at.kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_222148_920207_0BE85EFF 
X-CRM114-Status: GOOD (  15.19  )
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

On 4/6/2022 8:38 PM, Rob Herring wrote:
> On Wed, 06 Apr 2022 15:10:55 +0530, Manikanta Pubbisetty wrote:
>> WCN6750 is the WLAN chip on Qualcomm Snapdragon SoC SC7280;
>> Though being a PCIe based solution, it is not attached to
>> the APSS processor (Application Processor SubSystem), it is
>> instead attached to another tiny processor called WPSS Q6
>> processor (Wireless Processor SubSystem) on the SC7280 MSM,
>> where the WLAN firmware runs, and it is the WLAN firmware
>> running on the Q6 processor which enumerates WCN6750, as a
>> result APPS processor would never know such a device being
>> present in the system and would not detect the WCN6750
>> hardware unless and otherwise WCN6750 is registered as a
>> platform device. This is the reason behind adding WCN6750
>> WLAN node in the device tree.
>>
>> Add WCN6750 wireless driver support, its based on ath11k driver.
>>
>> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
>> ---
>>   .../bindings/net/wireless/qcom,ath11k.yaml    | 361 ++++++++++++------
>>   1 file changed, 252 insertions(+), 109 deletions(-)
>>
> 
> 
> Please add Acked-by/Reviewed-by tags when posting new versions. However,
> there's no need to repost patches *only* to add the tags. The upstream
> maintainer will do that for acks received on the version they apply.
> 
> If a tag was not added on purpose, please state why and what changed.
> 

There are changes in V4 but nothing significant, I have missed adding 
the tag, will make sure to add relevant tags going forward.

Thanks,
Manikanta

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
