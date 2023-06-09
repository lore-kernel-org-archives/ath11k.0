Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3898C7EE29
	for <ath11k@archiver.kernel.org>; Fri,  9 Jun 2023 17:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=27cqpelCKcVCt6v4r1sAJQMN/uODmlmSWgoVIIlGfC8=; b=wDcWwWj6a3UIVH
	QYgYYNFzBjUxobzB9pQWalD7tq4F+aw6ZCHX8lELRGHmFm+mWjTtLISGnyPG0Fbr5JK6XJqwwK5fB
	tm32YxOMExx+nVhwFBgizho/Ymt3oNSKLY2djAwLdT8Gd1vlgRhFQ3O8M/7jQGDvUxcT4/NXcIcb5
	rX75cQIEv2O53EdQIr/6/Yc5D9dOGsGzNeVsfCTlB9KMmkrks6LVQorUFcr7MRb1UU37qiHSY8w93
	G/FlM4o7GC4gQE4Zzr23+Zqt1SHMruOXNXY7JEWPqURjJLyiCQCVUrnQppPOJ6FuQrtXlbegaA55v
	whNn5OUduRrDlAkipizQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7feN-00DhQi-0m;
	Fri, 09 Jun 2023 17:11:47 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7feK-00DhPF-2X
	for ath11k@lists.infradead.org;
	Fri, 09 Jun 2023 17:11:46 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5149390b20aso3370912a12.3
        for <ath11k@lists.infradead.org>; Fri, 09 Jun 2023 10:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686330692; x=1688922692;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RbYIw9tUAYWWQYDm2hFNShk0R2ieZOPDUqTCunugD/A=;
        b=k2mhiJUDrPJ76VLaEaKbjJ/hz3WPVGtjxVdkafO4KOn+RTACjDdx5aaGQav+/cbCOq
         1OMWHVJBaMB8ADDgpzpSG6zm83yVEgjiYbARcbSf77VpeVqrJynS+cBIguI242sF7XSv
         e35YSHXJKUk3C/vTXUL+4mdSW7vJgujXhsaPyIixMdXDEIXDgIMZpwQ9K9yzS1RWfcuT
         0r+EbEWkO4SkoiqHoptCuQIp0v1ZCI4EpxiGW1N9fW/w2DBWYZI26i4l4qAipmfvWxaN
         GJfILye+6Jj8or91eyCSO0de8nEM1ZmQID++CDmTgA8yzgzBo+KntXmJ2ynEpoqhVMGz
         ek8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686330692; x=1688922692;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RbYIw9tUAYWWQYDm2hFNShk0R2ieZOPDUqTCunugD/A=;
        b=AkiVPVq8o0L7VsmbY4DxLw2LvdscRX/UsvlD5e+hTQNsd37a3F6UuMOsmvawX2ueCR
         A36aC/MKYl4y3QhCrXEgDph98uiBXZe0clEV+jopBBOf8VeY97c4i6VlY8l5MFoof8WU
         VuktieoT9rmW9rx2vltwIHETk5YrEBCLPGxHWi8loJtGlceQSwtFMCcb33WwmvTuPkiJ
         DsR7nPfmxE2W2hKARlWphfCtFH9LzQyvGiOFw0pIaS7yuMBdIufqsVB9HaCfjJ+ubZd9
         ULMZDZ4ZtvD/4QBCMVGCxueqvjX0pnOEQiXos4L33JwAd9qnSNTO0omRAWIKBR8OHvFL
         zTFg==
X-Gm-Message-State: AC+VfDznWvsqIGkQIg7LGD7IMdVWBnsj4H9i+o6yUdlT+BcWSy/LT905
	16v+/QjzYhYTeRZFM38w4aFYGf494Nw=
X-Google-Smtp-Source: ACHHUZ4+hTREUq2MAVjfeoHl9XRMnmtbKRLp1dSQWatMZz/rqBIwfUm0F4ppoWKXbON0L/AabZjEHg==
X-Received: by 2002:aa7:c1c5:0:b0:516:4394:244f with SMTP id d5-20020aa7c1c5000000b005164394244fmr1437097edp.12.1686330691851;
        Fri, 09 Jun 2023 10:11:31 -0700 (PDT)
Received: from shift.daheim (pd9e2959c.dip0.t-ipconnect.de. [217.226.149.156])
        by smtp.gmail.com with ESMTPSA id o8-20020aa7dd48000000b0051499320435sm2016281edw.14.2023.06.09.10.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 10:11:31 -0700 (PDT)
Received: from localhost ([127.0.0.1])
	by shift.daheim with esmtp (Exim 4.96)
	(envelope-from <chunkeey@gmail.com>)
	id 1q7fca-001jV8-1i;
	Fri, 09 Jun 2023 19:11:30 +0200
Message-ID: <54175c04-00f3-0094-7b70-3d08c0ab9d71@gmail.com>
Date: Fri, 9 Jun 2023 19:11:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v1 1/2] dt-bindings: net: ath11k: add ieee80211-freq-limit
 property
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-wireless@vger.kernel.org,
 ath11k@lists.infradead.org, kvalo@kernel.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
References: <a3075482150d342f71ec235badacec32cdd6c553.1686300243.git.chunkeey@gmail.com>
 <20230609165104.GA1257474-robh@kernel.org>
Content-Language: de-DE
From: Christian Lamparter <chunkeey@gmail.com>
In-Reply-To: <20230609165104.GA1257474-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230609_101144_849507_6017489B 
X-CRM114-Status: GOOD (  12.53  )
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

On 6/9/23 18:51, Rob Herring wrote:
> On Fri, Jun 09, 2023 at 10:44:54AM +0200, Christian Lamparter wrote:
>> This is an existing optional property that ieee80211.yaml/cfg80211
>> provides. It's useful to further restrict supported frequencies
>> for a specified device through device-tree.
>>
>> Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
>> ---
>>   Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
>> index 7d5f982a3d09..91bf69c2df01 100644
>> --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
>> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
>> @@ -58,6 +58,8 @@ properties:
>>       minItems: 1
>>       maxItems: 2
>>   
>> +  ieee80211-freq-limit: true
>> +
> 
> You need a ref to ieee80211.yaml as well.

Yes. will fix that.

(Related to that: ath10k already supported ieee80211-freq-limit since 2018
but not in the binding. will post a separate patch shortly)

Regards,
Christian


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
