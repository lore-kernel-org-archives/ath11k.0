Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2593CA5FA5
	for <ath11k@archiver.kernel.org>; Tue, 29 Sep 2026 09:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Y/oFOa1oxhQ1GdKVJmuNjJ216LwSgeUy79De2Uv5lM=; b=oCDDCMr4OjqFk7X7/ttPSHQ7hr
	+AlyIPSLC6Duj84G0gZJKtS/nP0S5hpBTBqpnEt5JHbb2PiGxwqD6MxvMgKjvABd0+zJFHyiE352q
	3Eb4IAOTWUtsLURPH5i0AtTrMF4mBAmIObtSm64qt1DUmZkwasNwnSWYhsb5ZWyE1M3hfpzGHhNBk
	rhgZhQ5aJIY1QPzCay2vOmuyyZsRgy3GU+p3ivX4Krzk9+E6oSIuljZsy1z7MY5KalrnzP21eaM/A
	N41eHanvYkoanqhUVjkOcPNUmZTAr6QlJRfXPVtYTqucOu9fghVO3/dxlLh1SuHGRVm5W8l7AZjFC
	XHywIC8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTgw-00000002uFO-0Yhc;
	Tue, 29 Sep 2026 09:00:02 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTgs-00000002uE8-1HBi
	for ath11k@lists.infradead.org;
	Tue, 29 Sep 2026 09:00:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790672395;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/Y/oFOa1oxhQ1GdKVJmuNjJ216LwSgeUy79De2Uv5lM=;
	b=GAEVk6MUdaHD+woVWLegCArPhmc6TU7XFHJSFRwb6Sm9MztxdCzguw66O+CnASyOJ/PPGv
	w38SD/4POIKlc0Ew6WLqclG3CTuGFBoJ3Ty5azM15bc3GHjsPAxeJm1u2y+AelZ17Zh+tu
	nHw6cPhRLu2trkcRV3InP5GOKMqat3M=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-675-MPKBn1FkNpypwdtaCrHxAQ-1; Tue, 29 Sep 2026 04:59:53 -0400
X-MC-Unique: MPKBn1FkNpypwdtaCrHxAQ-1
X-Mimecast-MFC-AGG-ID: MPKBn1FkNpypwdtaCrHxAQ_1790672393
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49fcc575709so39479755e9.3
        for <ath11k@lists.infradead.org>; Tue, 29 Sep 2026 01:59:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790672392; x=1791277192;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/Y/oFOa1oxhQ1GdKVJmuNjJ216LwSgeUy79De2Uv5lM=;
        b=p5p7WSTgBm2JWaser26hqGi/HUuucvEkmsVeikjwO6ifiGx4gxJOIr5WgJPZTqjMw7
         s2cOAby23ivYi1bSymaxmOH3XRdRnpurfc7ORCFQ8evHIY309Q8hEzGoP9h8KsxSChHS
         Q+VN1B8PdA5xh9c9weejusGR0YUvGSKZ/bIGRzd/rmRRF02oPpODnXoD39cUL/uKPsKM
         VBCtWHcKG2fW6bHJfSD1jdhs8HOPRhWoO7OsLUvwZqbUYj2vDM191qWSU8b9FItOrn0b
         FA5TQtouD8MhNUtQP63v+jmXUvfkfgG8SrpxRpVG1flT2cu6pQOtciNyVHqLV5AMUDJ5
         6AFw==
X-Forwarded-Encrypted: i=1; AKwUvByr/tJ22x0bKznlzJmxyNxUJ4mct0bbGjfJtWxWYqsFV8GdAIB2bNIjHP6mkLAjNOg/1p7UJv0=@lists.infradead.org
X-Gm-Message-State: AFuF++kk6m6z2wWXmRj6S5gZKWZLsNFlYweohK/ykrx9mM8FdUm3thQu
	ac4aClZkDucGIS183A9sYozxRLtbGnhkwEtsGr8SJjymxOUoSQHZbWh64wYW5oS3WAKWtcg56TT
	SYkfphJ2MGfxg/Uee0lAeOfblEuMBGD1DFQODbf3tsd7+hmF6XBABRl9L6P612eg=
X-Gm-Gg: AYBFou0XBcsHclHgxJRSKjruYLJo6BL2TQwh7RKQ6NVuAbhGDyxp7QANCoaAolg/ANB
	TuhzQKC6RWdYdcFL7Sad8AbicMMHo6+O2rex0I5nbXMNdcQgD2XVhXX9klw+vidpVa7j99uiVPF
	0HnMBAlv97POcE7FrHiZodML4ivNLf1X4cVhhikk2u1rNL9GcLItzDildED7FSPzjAeaxxyXJGs
	pmW4Oe6dB66zq/yFj+LtaAFpJX/7VCgZIvJTm28XUr6cXqWcbM+xdJgIIDITOtVEY4PamE89Pvl
	teC4whgOG49kNYthZOnSQ3hyU/qIB1mkCMhjUOHyJZBXYUL2s+2cLJ7cNLXgvi15BKJr/MUenMO
	cXXMIEstRS0IcxanU4vkAAY5xUX1K09pca2yK2ZgnnIwLligwDGkxYdcYRwKyDZNTdSlFSuKtCw
	==
X-Received: by 2002:a05:600c:8b33:b0:49f:f9fa:fcfe with SMTP id 5b1f17b1804b1-49ff9fafdccmr148517515e9.13.1790672392642;
        Tue, 29 Sep 2026 01:59:52 -0700 (PDT)
X-Received: by 2002:a05:600c:8b33:b0:49f:f9fa:fcfe with SMTP id 5b1f17b1804b1-49ff9fafdccmr148516975e9.13.1790672392160;
        Tue, 29 Sep 2026 01:59:52 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfec770sm65459555e9.8.2026.09.29.01.59.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 01:59:51 -0700 (PDT)
Message-ID: <4f03112d-e5c5-486b-8317-1ecc1aeb6636@redhat.com>
Date: Tue, 29 Sep 2026 10:59:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] net: qrtr: Add support for using identical MHI
 endpoint devices
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 Jeff Johnson <jjohnson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
 ath11k@lists.infradead.org, ath12k@lists.infradead.org,
 Bjorn Andersson <andersson@kernel.org>,
 Chris Lew <christopher.lew@oss.qualcomm.com>,
 Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
 Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
 Juha-Matti Tilli <juha-matti.tilli@iki.fi>,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
 Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
References: <20260922-qrtr-multi-ep-v3-0-c00831e88957@oss.qualcomm.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260922-qrtr-multi-ep-v3-0-c00831e88957@oss.qualcomm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uJi4m9w7GFvmIXDd_Cwn9GzAjCg-tKfzEaP7TsUW_Qg_1790672393
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_015958_425007_C22C0323 
X-CRM114-Status: GOOD (  16.52  )
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

On 9/22/26 15:41, Manivannan Sadhasivam wrote:
> This series reworks the QRTR driver to add support for using identical MHI
> endpoint devices at the same time. Currently, QRTR driver has a limitation on
> using more than one identical MHI endpoint devices like QCS6490 or any Qcom
> Endpoint device making use of QRTR at the same time. Because of the fact that
> these devices will have the identical QRTR node id, they cannot be used at the
> same time, on the same host machine.
> 
> This limitation is a blocker for running upstream kernel on devices like Qcom
> based routers as they often have multiple identical WLAN Endpoint devices
> connected to the Router SoC.
> 
> This series supersedes the following 2 series from Juha:
> https://lore.kernel.org/all/20260915054207.2513877-1-juha-matti.tilli@iki.fi
> https://lore.kernel.org/all/20260915074135.2567411-1-juha-matti.tilli@iki.fi
> 
> Compared to the series from Juha, this series simplifies the multi-endpoint
> support by computing a unique node id for each MHI endpoint and uses it for the
> internal QRTR book keeping. This ensures that even if the MHI endpoint devices
> have same node ids, the host QRTR will always use a unique node id for each one
> of them.
> 
> More details can be found in the individual patches.
> 
> Testing
> =======
> 
> Juha tested this series on multi ath11k/12k setup by backporting this series to
> 6.6 kernel.
> 
> Merge Strategy
> ==============
> 
> Since both QRTR and ath drivers are falling under the networking tree, the whole
> series can be merged through netdev tree.
IMHO doable, with Johannes/Jeff ack.

Anyhow the clashiko provided feedback looks relevant, please have a look.

Also please note you are supposed to react to such feedback proactively.

/P


