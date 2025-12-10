Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FEBDD3C92C
	for <ath11k@archiver.kernel.org>; Wed, 10 Dec 2025 16:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NJZYQknDSHLvDKguXhtEKNArlWtBipldxLRZyU8kGAA=; b=kVtyg77sCyywy8Kqlp8keoRhgM
	Dtlyf6FaW1Xtr/EA67+vhoczwMkLeRbMk//s+t4w6CU0K9D03DW9lS2UHAY3ulMc9q3vPkiNgntcF
	fHbLZMYSJ+0wDMadRdfiTlTSyvUx770owfCT/uVq+rijev0Xp2rem+ERpKy5H8PpNMRu3oheGd//K
	JW6KcRw0xt3Popx0WQmsjUrFs1+PZaohlZ7oROBtjLwVHQtLSUGcyud8F4f/BDM2NECkheEreeiFR
	s6GpO3+HTBOR5d+RMZG8mww31l4FnxdbmbFy5WX4OK4Gk+mBe4TLGW92FJ40g3Lq2aMUs5EJlUR6Z
	XAHtS7bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTN3L-0000000Fe0Q-28Jr;
	Wed, 10 Dec 2025 16:28:35 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTN3J-0000000Fdzo-1nP2
	for ath11k@lists.infradead.org;
	Wed, 10 Dec 2025 16:28:34 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-65b1f030a08so1322694eaf.1
        for <ath11k@lists.infradead.org>; Wed, 10 Dec 2025 08:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765384112; x=1765988912; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NJZYQknDSHLvDKguXhtEKNArlWtBipldxLRZyU8kGAA=;
        b=lm9fRjTB+UHarQ9bQDJjf/h4wcVdLNIQQ8cFFTIyMlgSn18XF5JXdYl6Mr41r+FIqn
         18myU15aNF7O6RKuZstKMF8DgS+7FG77SUbknGZQX6KF37trMzILVsj/CpVfY1yW0Bda
         Sd7jsviVfTGEF9Y01uWvdDE89mKW2wU1R8yOsfCKmtbWSgOQn3p1cyn1ND8rULTKQwBz
         bNF4Jgvrgr7tlCMqiIvafKcg+F6W9RcEBDneg8AjoDCPw4aMgaFccSAs41/E9nbSfm3N
         GIgIUBVthgCYKnjDjWFoeTo45jGAR6LMhYlYSuJpQGoKS+NQYA/XFNkz03JZ3hLLu/1V
         iftg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765384112; x=1765988912;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NJZYQknDSHLvDKguXhtEKNArlWtBipldxLRZyU8kGAA=;
        b=V0VIzhF93nf6bNPc+baowHq6EyTf8ALOVsw1Oqmkf5Sf5lO3/iSf9ABRTtKaKJm3Vw
         ccSz0e1Mc48w4XEIc0KoVeYAH7kjNFSLyW4l9hPyLS6iZfq/0WVdfBeCCazaVruUfaEG
         z+dZ7QX0NRyL4f20yogEmWjL98NiHo4NLDYgD6O5zWe8aFa2cpi0A0om+KHP/Icc9sh/
         lABiACbHjaQ8qGa5hv4A4ot+LcssnmPy2RTq9ys+OffV4ostfLK/hvO1rCTw5Dybn2rJ
         KDSPYU9NBhD0eWGnQHvGP8ikHT7EcH614eXJTTug4eUTbo+tqMG3qGdYF1KgSH6Busm0
         4F/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUm+LhnI9T9tNPwPDtNxjHmNXvi1Qqk3WWRiO8BYLl/c8ysNM2veoFios+um8d38oJwwNq4EFU=@lists.infradead.org
X-Gm-Message-State: AOJu0YwXl64/t6j7Nvz128lduGKJx0pwIrVrdqgxHiCuq13MeFWvtAOu
	aFhzh4sXiCH4LT3tMP+wZ3qH1osxkdjPRbZNN9qkmKIYlZ/Fox7YB8iY
X-Gm-Gg: ASbGncv49bvAuhkgoYE4uJzcjScSS4V8VhbOAFjtdJF/TiIYey6/BktdU3kHWGahEyV
	JV1MsrrrX++jtkw8WFET1A8hkkdiZGV5O2y7k9dTV3ZE3HQAJvdKCRVJC2ac0pwJEpjA2bnIjAa
	bQOno1MoLTTwnZKBhRWJu/jEJMI2ZHYz+bUgcLyY2HCxCvdCw0L216oF1yfPb2Gd/pVABCkIBwC
	MIc74lwnYuLYEfq4uUJOYH5Ns16NilSjZF11ghAUG9rNwSmw2c2bndONnfH+DC13ncw+a40QI9M
	HW+Cmghk8pCrcskpNNImkmojQuiot4SuOcyqryhsPegmciasrmsFZ5ZrDs0IlobMRIj6VRx90o1
	+nO/k7HskxMu/NT5SLC+yUzIs7TZWFKoHQybYr/iPGApc+WRlCaSkQpASSesTEzFjUuqhJcaiyS
	vwb434h8tRQYAtNqsJBOiUJe2HfcdjQQVOnoILSOvcxbZ5ljtyTBv3wO0dvMWL+vIw1F49CGFJW
	Q0qciFv3u6nrw3ld9USHbWnrNTBHV0p0Q==
X-Google-Smtp-Source: AGHT+IEOTURGJY/7tDFDiPk6IetB2YEaM3bd1RUuyhbKckdTVmeWFHurgRgim5ZWERL+/J6iWhH4nQ==
X-Received: by 2002:a05:6820:f021:b0:659:9a49:9059 with SMTP id 006d021491bc7-65b2ac652bcmr2158121eaf.36.1765384112012;
        Wed, 10 Dec 2025 08:28:32 -0800 (PST)
Received: from [192.168.7.203] (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6597ec61d03sm9487131eaf.8.2025.12.10.08.28.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Dec 2025 08:28:31 -0800 (PST)
Message-ID: <16e02bce-18c3-42e4-a51d-60c4bdf8a763@gmail.com>
Date: Wed, 10 Dec 2025 10:28:30 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: move .max_tx_ring to struct
 ath11k_hw_hal_params
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
 ath11k@lists.infradead.org, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251210024036.3965135-1-mr.nuke.me@gmail.com>
 <5a5b4961-904c-45e6-aca6-b58a122e2134@oss.qualcomm.com>
Content-Language: en-US
From: mr.nuke.me@gmail.com
In-Reply-To: <5a5b4961-904c-45e6-aca6-b58a122e2134@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_082833_478173_C72BDB6E 
X-CRM114-Status: GOOD (  15.65  )
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

On 12/10/25 12:46 AM, Baochen Qiang wrote:
> 
> 
> On 12/10/2025 10:40 AM, Alexandru Gagniuc wrote:
>> ".max_tx_ring" is an upper bounds to indexing ".tcl2wbm_rbm_map". It
>> is initialized in, core.c, a different file than the array init. This
>> spaghetti-like relation is fragile and not obvious. Accidentally
>> setting ".max_tx_ring" too high leads to a hard to track out-of-
>> bounds access and memory corruption.
>>
>> Clarify this dependency by moving ".max_tx_ring" adjacent to the array
>> ".tcl2wbm_rbm_map". Use ARRAY_SIZE() instead of #defines to initialize
>> the length field. Remove DP_TCL_NUM_RING_MAX_QCA6390, as it is no
>> longer required.
>>
>> The intent is to make the code easier to understand rather than fix
>> an existing bug.
>>
> 
> Even the code chane works, I am not sure whether we should do this. Because, logically
> max_tx_ring represents hardware capability which is static. However the change actually
> implies max_tx_ring varies on tcl2wbm_rbm_map definition.

I see what you mean, although tcl2wbm_rbm_map is const. More details below.


> If we are going to add something to avoid the potential out-of-bound access or to improve
> code readability, how about something like
> 
> 	ASSERT(hw_params.max_tx_ring <= ARRAR_SIZE(tcl2wbm_rbm_map))
A static assert might be a good solution. I don't know how to do that.
By the time we have hw_params.max_tx_ring and tcl2wbm_rbm_map, the
latter is a pointer, so we can't use ARRAY_SIZE(). We could try to do
it dynamically, but I feel that's spaghetti code:

	if (tcl2wbm_rbm_map == &ath11k_hw_hal_params_ipq8074)
		ASSERT(hw_params.max_tx_ring <= ARRAY_SIZE(ath11k_hw_hal_params_ipq8074));
	else if (...)
		...

Alternatively, I can take the suggestion from your other email, and
keep the "max_tx_ring", or "num_tx_rings" name. Because it is part of
the hw_params struct (via .hal_params), it still describes the
hardware. While the value is derived from a constant array, instead
of being hardcoded, it remains an immutable quantity, consistent with
a static hardware descriptor, would you agree?

Alex


