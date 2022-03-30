Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D18DC433F5
	for <ath11k@archiver.kernel.org>; Wed, 30 Mar 2022 05:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IUx3tHZ4WUn1X/HR7TG+Z1u07bXaPoiooeQA+YzIxj0=; b=sZnptA5PW/EO9q
	x1Z2+Zj+QbbLiPd41jeoY7Jtp7lLeehs7AmZD2Cuu5Dntk+7Wq94UeUOHhj3HWrGYXk5GWEgKoiCu
	47rI+ZFhZy0e5Pc7dWramv2OwTG+Wwn4Nkxu6aV/XKl2hC/8Z20PseheyDL7+17482iajIXd53j6/
	22Vlukp29KGzPGvPWhH3YTz6PkOeA6kOx5PLIZcYCwCzvCiyHtvYY+9FgPG8w+SXiHx369fcl5bd1
	uFaTwQnoypNO8TszQm2ZgITpFZ9di0f09U2AE/zcm+8tb1SOtK/R2uv/mb/8irDanjQ5XtXGK7ozo
	UPc6X+kKZ2hYMUxusPPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZQjj-00EGy6-15; Wed, 30 Mar 2022 05:19:15 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZQjg-00EGwT-DW
 for ath11k@lists.infradead.org; Wed, 30 Mar 2022 05:19:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1648617552; x=1680153552;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=DrQrBtnuoEiDhYwrgeogj26bXxENzzF7ytxPr/um6/Q=;
 b=eH+n+1/1Z6OlvL8lGfYQ+4eEl9jg/0l0wCwGaxAgYE2HvvLkCnH4JygC
 Bhdpyt8OjUZipzyb7qQOM9/le3lE7oiARRtJkSxWj5FSqWKVOdLJCemAq
 i12zrP0KKQ0rXlpokg9ZPDymYG3JejLKQQoLg3BmFAEikR2rR2uNolEeG g=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 29 Mar 2022 22:19:10 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2022 22:19:10 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 29 Mar 2022 22:19:10 -0700
Received: from [10.50.50.150] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 29 Mar
 2022 22:19:08 -0700
Message-ID: <31ea937d-d1d9-b9ed-c023-8a1ea0eea42c@quicinc.com>
Date: Wed, 30 Mar 2022 10:49:05 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v3 01/12] dt: bindings: net: add bindings of WCN6750 for
 ath11k
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <ath11k@lists.infradead.org>,
 <devicetree@vger.kernel.org>
References: <20220328094838.14093-1-quic_mpubbise@quicinc.com>
 <20220328094838.14093-2-quic_mpubbise@quicinc.com>
 <YkOYTpTMXTEx5mAU@robh.at.kernel.org>
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
In-Reply-To: <YkOYTpTMXTEx5mAU@robh.at.kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220329_221912_546308_EF068962 
X-CRM114-Status: GOOD (  10.71  )
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



On 3/30/2022 5:07 AM, Rob Herring wrote:
> On Mon, 28 Mar 2022 15:18:27 +0530, Manikanta Pubbisetty wrote:
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
> Reviewed-by: Rob Herring <robh@kernel.org>

Thanks for the review Rob!!

Manikanta

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
