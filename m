Return-Path: <SRS0=ZsjY=HG=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61534C433E0
	for <ath11k@archiver.kernel.org>; Thu,  4 Feb 2021 06:10:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 177F264F4C
	for <ath11k@archiver.kernel.org>; Thu,  4 Feb 2021 06:10:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 177F264F4C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=eero.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1PlN+s/OmRO3WBJaBCBIZDC4KmrYY1LSfHMDI/OZD5Q=; b=udxXEYxMH2UgTdDP8o5cjikYN
	6R4KkmX7O2BX7621LyVh1uTXyk0FhaayOmsVU9Am2dEDYOXH5MxyE8FV/GfSKcXWTwSrnR1cpL+3J
	Wpu6NKU6NJp76pygRdpwp29R3gX75aY00PntFVnx9tpTII9iuF6y28KMMYdjPz8dqxu8aZUgW3Ulh
	Z+v/BXslxWJhrSTNGTxKsR8m8U+u16uOTQAbMOs6Whq02Sl1iqHkeZwwT/b9Pr5RrrXkBEmAfUyG7
	035TKACeStS4fO7qpMOjdUBrl7boZ3go+VeQNmwyctP3wXpDUVoabPXrOnHDQr1Q4RmqN8nItY7xe
	9hTBjlMzg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7Xqa-0008CQ-VY; Thu, 04 Feb 2021 06:10:33 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7XqY-0008Bs-Et
 for ath11k@lists.infradead.org; Thu, 04 Feb 2021 06:10:31 +0000
Received: by mail-pf1-x42d.google.com with SMTP id q131so1431773pfq.10
 for <ath11k@lists.infradead.org>; Wed, 03 Feb 2021 22:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eero.com; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=ll3s8aJPZrz+UhnuWvqlIOTSBpyJKVwbxKsSXsfaYzM=;
 b=SIc1tGI02dg9xjUK49V+JJ0o1PH3s3JQeCK8gfbynhIHtExaJfAtcXX3+Gz83E9Hkr
 XxjMqGffPh7snNcsxUYXAemCD+LagfZNywvzY5KwCQ9a8v+VgWKNRyYmuGqToLVsAOzd
 OCOw35520vQdO7noEEoBBvXa2woDKAbzZRhhw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=ll3s8aJPZrz+UhnuWvqlIOTSBpyJKVwbxKsSXsfaYzM=;
 b=NJ/Z1q8HEjbEAncqLAsLzJ7RpHSAbpWTzkEIRY4ikxxOZ4bPcuIc4e4knpBBNFbVf2
 tpOHPZWR1eHIJdGqDn159gnQ8JDWO8sXw4C5lzDGLgnhNkT0hiT7zKLLrqYYWqiV9wKJ
 wMNFubufzD3a3iW0+4VW/VMZsKx+WnjcRIAT9Qrevx8UBjUUmaipZLEwx1gWBr6Gzi9v
 eLAiK6AQy+pFIiddu+0Sz6JOP+++enHVXBn8cUJOJj0XQOi/d7GLT7q+3Npv5p8Gr6vc
 XUGXJiaolysSDH+phje1tRDMdVDjWqou2K54yup6vNtPPdI7vljWbXN1yItVkI8PB+bR
 gzmg==
X-Gm-Message-State: AOAM5311qg1xpWz3mfkh+JwNQiDSuxOAYiy5yiPws+YIjsco2IKOQrBi
 ucWx/wz8kxHk8oeYdCixUiNUAA==
X-Google-Smtp-Source: ABdhPJz1K4RcHoXb5h3ejfnw3JXA7K/U2Us0McmDN8DHGAgTVJCVKgei85RthlNzIzQuklbuqL+guQ==
X-Received: by 2002:a65:5209:: with SMTP id o9mr7287799pgp.34.1612419028078;
 Wed, 03 Feb 2021 22:10:28 -0800 (PST)
Received: from [192.168.4.200]
 (107-196-182-50.lightspeed.sntcca.sbcglobal.net. [107.196.182.50])
 by smtp.gmail.com with ESMTPSA id a204sm4521463pfa.49.2021.02.03.22.10.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Feb 2021 22:10:27 -0800 (PST)
Subject: Re: [PATCH v2] ath11k: Update tx descriptor search index properly
To: Karthikeyan Periyasamy <periyasa@codeaurora.org>,
 ath11k@lists.infradead.org
References: <1612410960-9120-1-git-send-email-periyasa@codeaurora.org>
From: Peter Oh <peter.oh@eero.com>
Message-ID: <e6d1aaea-8410-3cfb-3308-4722ca8e91ea@eero.com>
Date: Wed, 3 Feb 2021 22:10:26 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1612410960-9120-1-git-send-email-periyasa@codeaurora.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_011030_604759_9A0CC0CE 
X-CRM114-Status: UNSURE (   9.89  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Cc: linux-wireless@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org


On 2/3/21 7:56 PM, Karthikeyan Periyasamy wrote:
> Tx descriptor search index field should be updated with hw peer id
> and not by AST Hash as per the HW/FW recommendation. Incorrect search
> index causes throughput degradation in all scenario for all the
> platforms. so updated the search index field with hw peer id, which
> is a common change applicable for all the platforms. Also no need of these
> configuration for non station type. seen 10% throughput increase in WDS
> traffic with this change.
>
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-01492-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>

Thank you for the details.

Peter


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
