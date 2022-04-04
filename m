Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E3DAC433F5
	for <ath11k@archiver.kernel.org>; Mon,  4 Apr 2022 16:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sQHj4Y3RmRf7sHl4K3tIhPSuAkEDwNqgnlZl+TDpb2k=; b=fwMknZMDnb/x2Y
	GPxnpGZZLTmRFqqjTat5L/NgjlpzYBdwkQRf9xSrSJc0P3fJ/QDV/TUQli9caihVyIlsYIQo+0lrf
	BVFqXHZ/lD09K4A6JLKt1Cv/Baaw6k9ag20uCG+mLxJkervmM2GbvOyNObq8PpoesryAOlKpE5wQU
	FLcG31XqUZZJSqeyxdIyTfXI2aVgmqJrbm0zBvIQGRQxoSI8SjekbtE1bNptc6LD9MS8Inc43h+qe
	ioGwB7nRGaWdjrY+4rAheW3G9BkWtIVoytm5R5dOYuvwsavFqZnSHE8ygL3zHgr5FYA+HW03ZLO/Q
	SUH6PPkRDgGdV2Q14ZvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbPpQ-00FqsR-NK; Mon, 04 Apr 2022 16:45:20 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbPpN-00Fqqa-Fw
 for ath11k@lists.infradead.org; Mon, 04 Apr 2022 16:45:19 +0000
Received: by mail-ej1-x633.google.com with SMTP id p15so21177985ejc.7
 for <ath11k@lists.infradead.org>; Mon, 04 Apr 2022 09:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=WYOOnPbn2RmEaHen3xtS2MJr0dYPX1i1sJyDMjOr0AU=;
 b=QMcDsPvIRuHi/WpJFJSoj5Z10CCm1Oo4x4A560Z5jTXDssFzvPFge568Rzbldy/2MQ
 S4nGAfN+tf8CRXW7HcSYn0wzdxLIQB9xjNqQWtnYw2e/Rbq1rCgklrfKYoDp/pX/CBl+
 BNw8Uz5EyE3p8DLCmGJ5Hi2Y+Jx/4X8JsRSrUcwdEsUkyx924f5ryrDaebgr/HfxG13U
 aDuTXOVLkR8Vg3PmOVfUtomcPwUCRhSgg3ZckjS56UXycmGS0Xz0/K0WbbykW9ZTRzer
 C0rm3kJEdSLJaEh6elf9JHT15ndrGpxJnLukoJ8LJPYYQ+dtQ4oQE5+3t0SBAPNfApT0
 XCNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WYOOnPbn2RmEaHen3xtS2MJr0dYPX1i1sJyDMjOr0AU=;
 b=ZA+Wo0wU/vKIWJOWwmrlFRGxhAhZPLJHcvbzmsWsTSQomdVTVrxQO5q6TwuISWjWvW
 x/6e5oillqsImNM2o95XHIFIm38xuPfEAJ+ThRlFZcukU+RI63ouh+/xukvEAR+0JjLP
 EeithQtfHTAJVcGLtRPC9kePZhVxJ8fyOzzOgfCTxhiUSJXpu7qEPGYB19jAypR0m2rF
 yLmyQwT35Mdg8kfxyu2RlrHzzotXFxPPdBLhpPaaJg+YM0HN1qv8w5fNcFRFiTVjOFah
 oftzFjL/nohma34DKBy9i4shNFm1kWyEJlBBjDIkViPcVyFSfQfIM3Ocy8ZNKv3n8Awo
 P2SQ==
X-Gm-Message-State: AOAM5314QnAGlrkFV71jCxC5Z3NGHTA5BBdsPKHSX+E5VZWuyVTQoye4
 6/A1XBRRI6gsFp/wLIBOhj5qduKcrLE=
X-Google-Smtp-Source: ABdhPJyZ1hv37A/0H7OrNN/66SRFU5MG2iN3PNyU2k0zTQ2HJwYjX+VdJpPd1V52Z/uY0Mx4q+lnPA==
X-Received: by 2002:a17:906:cf99:b0:6e7:9ff0:38d9 with SMTP id
 um25-20020a170906cf9900b006e79ff038d9mr992994ejb.646.1649090712908; 
 Mon, 04 Apr 2022 09:45:12 -0700 (PDT)
Received: from [192.168.0.253] (ip5f5abb55.dynamic.kabel-deutschland.de.
 [95.90.187.85]) by smtp.gmail.com with ESMTPSA id
 yy18-20020a170906dc1200b006d6e5c75029sm4555841ejb.187.2022.04.04.09.45.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 09:45:12 -0700 (PDT)
Message-ID: <1bd30dce-4046-721b-2207-32ace83af441@gmail.com>
Date: Mon, 4 Apr 2022 18:45:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] ath11k: do not return random value
Content-Language: en-US
To: Robert Marko <robert.marko@sartura.hr>
Cc: kvalo@kernel.org, David Miller <davem@davemloft.net>, kuba@kernel.org,
 ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20220404105324.13810-1-straube.linux@gmail.com>
 <CA+HBbNHEK=CbyeeyPG=s=D2xofdSbk8Lxx5R9nij_cp6t7ybDA@mail.gmail.com>
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <CA+HBbNHEK=CbyeeyPG=s=D2xofdSbk8Lxx5R9nij_cp6t7ybDA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_094517_593601_6B93C418 
X-CRM114-Status: GOOD (  17.10  )
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

On 4/4/22 18:35, Robert Marko wrote:
> On Mon, Apr 4, 2022 at 12:54 PM Michael Straube <straube.linux@gmail.com> wrote:
>>
>> Function ath11k_qmi_assign_target_mem_chunk() returns a random value
>> if of_parse_phandle() fails because the return variable ret is not
>> initialized before calling of_parse_phandle(). Return -EINVAL to avoid
>> possibly returning 0, which would be wrong here.
>>
>> Issue found by smatch.
>>
>> Signed-off-by: Michael Straube <straube.linux@gmail.com>
>> ---
>>   drivers/net/wireless/ath/ath11k/qmi.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
>> index 65d3c6ba35ae..81b2304b1fde 100644
>> --- a/drivers/net/wireless/ath/ath11k/qmi.c
>> +++ b/drivers/net/wireless/ath/ath11k/qmi.c
>> @@ -1932,7 +1932,7 @@ static int ath11k_qmi_assign_target_mem_chunk(struct ath11k_base *ab)
>>                          if (!hremote_node) {
>>                                  ath11k_dbg(ab, ATH11K_DBG_QMI,
>>                                             "qmi fail to get hremote_node\n");
>> -                               return ret;
>> +                               return -EINVAL;
>>                          }
>>
>>                          ret = of_address_to_resource(hremote_node, 0, &res);
>> --
>> 2.35.1
> 
> Hi Michael,
> This is already solved in ath-next and 5.18-rc1:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/net/wireless/ath/ath11k/qmi.c?h=v5.18-rc1&id=c9b41832dc080fa59bad597de94865b3ea2d5bab
> 

Hi Robert,

Ah ok, then I worked with the wrong tree (wireless-drivers-next).
Sorry for the noise.

regards,
Michael



-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
