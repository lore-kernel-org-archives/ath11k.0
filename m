Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB7CCC369DC
	for <ath11k@archiver.kernel.org>; Mon, 28 Apr 2025 16:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/X7DF9Ew1Agm7nnrSqqFaK71CHWZV0baQc/jIlR9xZ4=; b=ChCJEeINzV9FIHXZD63HoFb11N
	lmXxHCp+Ow1kVGkI79fEyTENpasgCoVDc+Y7jGKU0NUr/SnaaUvVkcgCprfMvSJ4fpuTFfrx2JAhQ
	hW7PZSEWriDlNElCRHGlKqcbm8GXhMcvMQGq1R0MLZgqwgRXHCM8WrRGvajW+1PXf4DL282+6DSLW
	Lz36IeiZsLOazNBJeKjYo6H3sC1BsaMIuKser3zvjjqBSlYsxDyZA3a1qxdrWf7cW/JpRUwIVCu1q
	zybrije614ELODA/u2pOPHB8rhkFQ28NqvmmcRvChBHUHccZe+Wunuiw2G8l+qpUjHJsJ9fv+Ry++
	YbRTxhjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9QyL-00000006r1T-2JDt;
	Mon, 28 Apr 2025 16:04:45 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9QyJ-00000006r0v-0jxy
	for ath11k@lists.infradead.org;
	Mon, 28 Apr 2025 16:04:44 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-736bfa487c3so4156545b3a.1
        for <ath11k@lists.infradead.org>; Mon, 28 Apr 2025 09:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745856282; x=1746461082; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/X7DF9Ew1Agm7nnrSqqFaK71CHWZV0baQc/jIlR9xZ4=;
        b=ZbN4HsOiQi80OO7UCfjLTBe5fmFbIi7gDIQ9IcvcWjKPKjn88KFtAkoDgYHN6kcDdj
         ziByYXXLU6hpeNtv6MBBV09SW4+NsG88ubS/4e3VyIJlL3vogJQgXncE6zO1S5DzQAOE
         cTQRtYeW2kmMV21xcpb1meGq2iTgfKwwRxd3MiH3IQGFvLvrNgdpy8GH4FNeEYOxld+A
         tj3p93gb+Tmdwk/04UMavuIO+EbZTukjE2Wud0B2m9rp+dspkY7l6Zw7gJxDyDuMAvEY
         hoN/VKzbcaFpwVJXhmaQvUiTXqODWMCXNk952h6Z2GmL8Fsu8N5e11PwQmtJ9bUP8f6e
         7ksA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745856282; x=1746461082;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/X7DF9Ew1Agm7nnrSqqFaK71CHWZV0baQc/jIlR9xZ4=;
        b=gKsLlCqQQn81Ay3ywC112pNZrXn868rpLoYHOjpZPXqc3OcdxCRvC32ewsfAYjIoeg
         N1c0ZK0g3lUsKM04OlIZ5oBrQvayjMJRtMw3G2bbmjFybJeMISE8ZO410wnrLoRSMr0F
         rUZ9zzxPTPNXZFlddpKvLWeHn0epf+wRjF8qUr37joqiMb6mCzmEWqtrlE9VQU+vOKxK
         siqtxCirrxhsSQXtkNdtdINYJre0WTRPQvyaHph1J9gr4B10XI7zzO8T5IB75Xvl+GgK
         Jeg8Ws+egI6hdNI3Knq1yrcYO4CBjdrUdU/Us++oRGOXZZqdFh0fsUVXiEpCD0hP3FbV
         Ao+g==
X-Forwarded-Encrypted: i=1; AJvYcCUG9FKJYloMVjU60Y4buSS4qolUE+5HSC3nFnYTlbdUkp5Gpv+OJD2y23nC3pp7Vw+OYQGPc24=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0Eqxx3e6vCyxY7EkTWZnwcAhbAcAPNqIrC38byOLcqDcuoHuC
	0ioa+SWYg0DEBrQMAiYDLbcEPu9QZkNIFgmHNiGG/ZJf5xho4DeVBCvJwcdYmg==
X-Gm-Gg: ASbGncuKP/EOneyQ71azZ8IDhWVIVTlbyAga2RGAMnoYfVcqFyZi7v9mGypRTJJtVPQ
	tvmkeg+B3jb/v74/w8N96BaELgFWEOLHFXUsfGWAlEd/ZNxOuopV58eMv/KrK68/ehu1kEUrqYQ
	+CgAfJcjXCp8K0cJUdDxlGpAvUox8+LrkwDZDeKU8o8KWJPzSvouU79gljneTadzmCtZO/0no0x
	UiKyoSkmDdyBCVSu6dFgdqC7km+71fHRv7/9oI7tnWS1BVtmjuERTQPIBvI0g/EIi18wQJJgPDj
	HKnykzcU7/ReBOmWdtScZI8DdbsjJQ6W01UcbidVJensau/igA==
X-Google-Smtp-Source: AGHT+IGKCxoXxJthszuaQ0YIvxIpdqYl5iZVD54zK+MbWjkRhDGpgNCqL+JAneA3KnXAx0zTvsqeuQ==
X-Received: by 2002:a05:6a21:9984:b0:1f5:8d3b:e272 with SMTP id adf61e73a8af0-2046a404462mr11666596637.1.1745856282535;
        Mon, 28 Apr 2025 09:04:42 -0700 (PDT)
Received: from thinkpad ([120.60.72.74])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74002791fb3sm3928077b3a.70.2025.04.28.09.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 09:04:42 -0700 (PDT)
Date: Mon, 28 Apr 2025 21:34:37 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, quic_carlv@quicinc.com, 
	quic_thanson@quicinc.com, mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>, ath11k@lists.infradead.org, jjohnson@kernel.org, 
	quic_bqiang@quicinc.com
Subject: Re: [PATCH] bus: mhi: host: Allocate entire MHI control config once
Message-ID: <szphluirfkwx2na7o5y4wax6icezxv5scnwofma7la7v4kz2kg@bgplpwnsabkt>
References: <20250328165913.3380933-1-jeff.hugo@oss.qualcomm.com>
 <pgr6u3onrlf4mvldqn7cxlqkh3krduv542jqgjcy5c535ys6hm@dujbvax4b56s>
 <07cc4ee2-4a13-495c-bc4d-8837d6b54414@oss.qualcomm.com>
 <qhoirbfx5p23542hhi3kk7ftwtptsnoxgtewddbh322d74rgb2@xbupxi3ix7sx>
 <ea4d081c-185b-4715-9b64-da1347dab28b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ea4d081c-185b-4715-9b64-da1347dab28b@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_090443_218022_A9332755 
X-CRM114-Status: GOOD (  18.11  )
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

On Fri, Apr 25, 2025 at 09:56:05AM -0700, Jeff Johnson wrote:
> On 4/24/2025 10:37 PM, Manivannan Sadhasivam wrote:
> > I was confused by the fact that ath11k driver adds an offset of 0x1000000 to the
> > reserved region for the iova_start:
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/wireless/ath/ath11k/mhi.c?h=v6.15-rc3#n331
> 
> This predates my role as maintainer.
> I was an internal reviewer, but in internal review (as well as the public v1)
> the code was using dedicated 'qcom' DT entries and did not have an offset.
> 
> So I looked at the entire patch history:
> https://lore.kernel.org/linux-wireless/?q=s%3A%22ath11k%3A+Use+reserved+host+DDR+addresses+from+DT+for+PCI+devices%22
> 
> The offset was added in v2.
> 
> There is nothing that describes why the offset was added, and nobody
> questioned it.
> 

Hmm. I'm not sure how this works in the firmware. If firmware uses iova_start as
the start address for the ATU mapping of the MHI data structures, then it won't
be able to access the structures allocated prior to this offset (which would be
very likely).

So the fact that the firmware still works with this offset means it doesn't use
iova at all. But it would be good to remove this offset from the code anyway.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

