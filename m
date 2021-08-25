Return-Path: <SRS0=KApm=NQ=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66052C432BE
	for <ath11k@archiver.kernel.org>; Wed, 25 Aug 2021 18:46:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C325260E77
	for <ath11k@archiver.kernel.org>; Wed, 25 Aug 2021 18:46:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C325260E77
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=eero.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RpjwKY2u8Xz11lASQ8I2MrG26iZOUUf1IbIDYkTDCYM=; b=bRVGJvJ9sxr0xHF3/q7ORKrKc+
	e0UmDrv/Of95qgHXw41THpOaL1K35qMN8of6CQsSPsyTD9a3nU9UcNrJS2g7viLLeVe1qhaoU+bGs
	gWc0Vk+B9UetM4wXN7RcCgotc1ca3OvDYLpcJBXp849jyTiLz/+lckROH868Q+OwOq8glKdwBijV4
	E3DE6H197Uy9lTvmmVoC9tAd9E6ro3k0DLDZk0Ql5A+1qXmXKrJS2aGNV5D/m1hgK2lXgk5d74klB
	h5Aijj8FoxE3y6bJZ8yImLYoEW4vZctQSGjScHOHcY8C1/FICVPETYGDh9U1rHPiS6hH6vEJ4I3uJ
	IeIIW9Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIxua-008HK2-Qc; Wed, 25 Aug 2021 18:46:08 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIxuV-008HJH-0h
 for ath11k@lists.infradead.org; Wed, 25 Aug 2021 18:46:06 +0000
Received: by mail-qk1-x736.google.com with SMTP id y144so489265qkb.6
 for <ath11k@lists.infradead.org>; Wed, 25 Aug 2021 11:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eero.com; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=MM9TxT9aun9DoTvxLwFQ9t7L9RLMum6d40huNFPUugw=;
 b=YtDBuQZQpIl2+VpA7woAuOMDzBS5iPSCoECtEM+xTD0Bc6+05goxarFy4Z1WMQeKO+
 N62fcGSPe6ibgyLLzBkzw9mJ3bDb5l/V6twafYW1CrtHrUZoSpSrXj386RVxebBdfZ0+
 TXNJekS3TrnOE95UkySThRss6jxiSZIY3lwWI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=MM9TxT9aun9DoTvxLwFQ9t7L9RLMum6d40huNFPUugw=;
 b=bWuYjRv/QJYukAH476IvsX5g/mkKGHLGS1eTqWewoFpxohFLJMHndiLERa6hMpfhuf
 giI50krpU0aBeWS6V9tHDBgu5soS0hvqQo9+e4Jtz0k52ReuzmPh0SDC4Ub+sqT1+m9E
 Mw/Gb5KvhbJAPI4tTjyJ4qlyxL2DCApBN+Ku/ohMCk3Yx2m7ruXk+atDSuelZFZUCYXp
 ER/yfJRfmUCTEiL/8TkkwCCYnB+6H0Suv0HVW+xMwQ7lQEulTFt5oi/L47YWmyQoLcVX
 YIFDyH/K+qaZ8EdKuJnuVxfQlHHW6jLWb6bbtL16zQHpCmOOy98TDYnu2kOOptYw6nJb
 88wg==
X-Gm-Message-State: AOAM533wvgpnnHZEXXzrkksx+ipAI3ysrFK4anFZKhog1nuooPjYbunm
 1hWXj6R81t2np9kHnJ17gP6u+g==
X-Google-Smtp-Source: ABdhPJyyErLt+HKMWABB1TgmTuHzP77uR58/1erwL8HU1rBgU3RHoZMijNY7O9EeUFXtI9oXnpqQ8Q==
X-Received: by 2002:a37:8242:: with SMTP id e63mr32745206qkd.294.1629917157522; 
 Wed, 25 Aug 2021 11:45:57 -0700 (PDT)
Received: from ?IPv6:2600:1700:38c5:675f:d171:ff55:3554:62a5?
 ([2600:1700:38c5:675f:d171:ff55:3554:62a5])
 by smtp.gmail.com with ESMTPSA id s69sm594493qka.102.2021.08.25.11.45.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Aug 2021 11:45:56 -0700 (PDT)
Subject: Re: [PATCH v2 02/12] ath11k: allocate dst ring descriptors from
 cacheable memory
To: P Praneesh <ppranees@codeaurora.org>, kvalo@codeaurora.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>,
 Sriram R <srirrama@codeaurora.org>, Jouni Malinen <jouni@codeaurora.org>
References: <1629884277-18759-1-git-send-email-ppranees@codeaurora.org>
 <1629884277-18759-3-git-send-email-ppranees@codeaurora.org>
From: Peter Oh <peter.oh@eero.com>
Message-ID: <bbd198b3-87b7-a0ce-ada1-2bd723c9d9c9@eero.com>
Date: Wed, 25 Aug 2021 11:45:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1629884277-18759-3-git-send-email-ppranees@codeaurora.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210825_114603_114285_945091C0 
X-CRM114-Status: UNSURE (   9.58  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org


On 8/25/21 2:37 AM, P Praneesh wrote:
> @@ -292,6 +315,11 @@ int ath11k_dp_srng_setup(struct ath11k_base *ab, struct dp_srng *ring,
>   		return -EINVAL;
>   	}
>   
> +	if (cached && ab->hw_params.alloc_cacheable_memory) {
> +		params.flags |= HAL_SRNG_FLAGS_CACHED;
> +		ring->cached = 1;
> +	}

"&& ab->hw_params.alloc_cacheable_memory" is redundant check.

Thanks,
Peter


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
