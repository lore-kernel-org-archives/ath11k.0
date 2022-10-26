Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83D77C433FE
	for <ath11k@archiver.kernel.org>; Wed, 26 Oct 2022 19:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ag2aH4fSY17TvnBVbGBlQxrSUnAPZmrz+ywy0oYmhA0=; b=H7Dcnjkh4yWlgE
	xYWI2Y1z94WCP+ffKIs8VmXFf57P/HYqbGOkpyXshC5CrAtF7k+y2cavcWJ2bvyL8r3e9HKE3CtSc
	9jBhwv/mOSBP/Q1R/USpIT7r9UsYvYOc4QWXWz7382xEq79elxVF82d2mWwFJ28t6flYdFBoBd07D
	6wyDYUV7rAnJ7dOGUgyiL0cgk5UNkinbNSWg/4QCZmlKh/Sa8Hy0NwTF6Z8hh/lwI8DvhrYCXXHG8
	seiZwkHfvGZq6ll6Ejq2mwk+1RexMyxQNJHGXJ8AMVC+Y1D6GaauehKYNMZYSElH7pDyyGCfCySET
	gjtptpfKlkJIdXjO+wCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onmO8-00ArRB-ED; Wed, 26 Oct 2022 19:48:32 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onmMe-00AqhO-5x
	for ath11k@lists.infradead.org; Wed, 26 Oct 2022 19:47:01 +0000
Received: by mail-qt1-x832.google.com with SMTP id hh9so10777170qtb.13
        for <ath11k@lists.infradead.org>; Wed, 26 Oct 2022 12:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=az4DdZ94Dcv40kwLv8X5NX9K3iXjRUb2dsWj/gPdqHQ=;
        b=N5kLECUnBb6pDE43XjC/Gw7V9ViDgHZzsNNs2xeEl7OXrnjODcce7Myo2o1tuuyyk0
         tIO7TGDNgcRHd0EzOhh6q78shbOfLEj928+QYhAxPJIFLtt59LPJrxFB9v//GUnOPCmB
         T5gNPVjP4k1xJUGThI42/i7MuBi8IPBeyYByc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=az4DdZ94Dcv40kwLv8X5NX9K3iXjRUb2dsWj/gPdqHQ=;
        b=eIup3xRlrdL30pkXMxUjHGySzDczIjohQs65gCkqhKXjiGGAeLdWL6VHdA8a9CXD+L
         VHlhHxs2qRa91toIAy28v9Qk0MC0xgSs+zkfAT6+72QvO6tz+y0DBqS/RCsHjLMGiphF
         uv9OC2XddVOK8MfgU381rB1UfBgci98/9Ig/zJZTVhOQTRCipMv3r3APm3uOggxoS2Di
         S23qBMX/Vvm6G1QbmEl+J+Wu6R8WQGGq0wSUDICdes9UfjxMzaEhDlWbzI39lWmqWXIy
         q0ihJ8xtDHEHr10sg/wUIUxXQe2vPQfyKeJQmTLV/ztBubbhJyuzrDv1t1Nwwz0ZOKkU
         XGbg==
X-Gm-Message-State: ACrzQf0qhZTzMccgq+TI4cnLjFsrQZeZApfNKFPqYWuGrBstP4gidH0T
	h15p1icbVdJITSGczHNCSAG3Hw==
X-Google-Smtp-Source: AMsMyM6PxMzcqUDq5edhDI3ioET1luoXMBS9ESrY3qqmO1rmgtFuQ3WSpmXPx7e9btL3FoG2B30u3A==
X-Received: by 2002:a05:622a:407:b0:39a:836:acfe with SMTP id n7-20020a05622a040700b0039a0836acfemr37547982qtx.133.1666813617696;
        Wed, 26 Oct 2022 12:46:57 -0700 (PDT)
Received: from ?IPV6:2600:1700:9770:4850:2cd3:5b9:e84b:3a69? ([2600:1700:9770:4850:2cd3:5b9:e84b:3a69])
        by smtp.gmail.com with ESMTPSA id q13-20020a05620a0d8d00b006dfa0891397sm4471464qkl.32.2022.10.26.12.46.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Oct 2022 12:46:57 -0700 (PDT)
Message-ID: <11e005c2-2363-d63f-9f3f-3ca811737231@chromium.org>
Date: Wed, 26 Oct 2022 12:46:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH] wifi: ath11k: Fix qmi_msg_handler data structure
 initialization
To: Rahul Bhattacharjee <quic_rbhattac@quicinc.com>,
 ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20221021090126.28626-1-quic_rbhattac@quicinc.com>
Content-Language: en-US
From: "Joseph S. Barrera III" <joebar@chromium.org>
In-Reply-To: <20221021090126.28626-1-quic_rbhattac@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221026_124700_270291_4718B8D4 
X-CRM114-Status: UNSURE (   7.76  )
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

On 10/21/22 2:01 AM, Rahul Bhattacharjee wrote:

>   	},
> +	{/* end of list */}
>   };

Do you want to add a comma after that last list element?

Actually, I normally see the last list element simply being

 > +	{},

... with no comment necessary.



-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
