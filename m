Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF2FFCE7AFD
	for <ath11k@archiver.kernel.org>; Fri,  6 Sep 2024 10:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=conazCNmwKwRZFKszCtH4D3K4/XIDaOm770X7uvpF+c=; b=iVgCcNHtsxu0tfJ9QF0wExK6b1
	9WKmea52Nk3mp3Pc8MxLhol08cJArwghFtRqi4zJstfTYRt6Gltj4nJtD0qfvePj8aMeC5fCgRi1x
	WoM5exUk18z6Q1TBaY4Kyrl7hEK/gTEuDqDfqVtmymY382JOXfWuDFeuAOS4WC2g/9246y65t9sNV
	sUJLkCcaAqUGToqIuTump5nHl1E5ijAnl3JMoVL38EVapdoi/AFbhDavHJl46v0QTtZDQ762qpRma
	RjB3MLbJ1pqVs7+/qlurfRZM6GXMEvxHz4ExRmnVUsDt9oN6D1Pc5mV7tyz5NiC4pl28WU6SBQgPG
	RsiQnRXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smW4y-0000000BisQ-2HJH;
	Fri, 06 Sep 2024 10:20:36 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smVpe-0000000BfhZ-1tYq
	for ath11k@lists.infradead.org;
	Fri, 06 Sep 2024 10:04:47 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2f504652853so20720451fa.0
        for <ath11k@lists.infradead.org>; Fri, 06 Sep 2024 03:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725617084; x=1726221884; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=conazCNmwKwRZFKszCtH4D3K4/XIDaOm770X7uvpF+c=;
        b=B6zENDpf5agmr+mHlf+5w44I8jRKX5wjUuiB3npZjV9nSld9vRdyJhjIFddnGwrZFM
         e/3YKTgOeLgJIXdwJuQeWShHZMSCNuFCU7feSCJHsDSZJkqqwqlAKdsj2z/6v3Xh0yMM
         EyU3HQTZaA1tvOV5AuWwZ+yOOctQHgFEh7a2b3yzvJXQv1B3hQSDY52uuVMX8zVxxo9y
         tGQVVt4xPx6wm9f1jZC1lN9aiFvje6JY1jrUfvvzFi5QD541bgJ0zAVeC9smIL9OgQfG
         XrLHyUxKYTWd6ImV2/A4X9AIwZ7LttI+rbzVShVPkcYVNe+vHgPTGrRpbNgQRiYUto3q
         Nmog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725617084; x=1726221884;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=conazCNmwKwRZFKszCtH4D3K4/XIDaOm770X7uvpF+c=;
        b=icH4sTt5+/KofmFNXcpJDRp2s7grh7Ad9wDpPCeoA3ATxLS/Bb5TGfXGecw7aeTOOK
         zsCeit0LAU6b5vpGi83MwS8cNG2rnnoXxxn/RlO3Hae+Zo2JTyaMvpAZn02ZPDhEBP9E
         8Z17yYXbu7Zw5UagK3G6/hAJ1bpJR5mJCTSIbn8KX7JUNY+bEAtlO1pvhRuvf/3ox3+q
         y06t4DNlidj5CtUkbo+flAdljM3dyI4jUmyd7hWh/EsXxLqU4N93wcT6mQt3uuj+o+s9
         wZO/LP4JRExD4+G3a+nreXdfe0eONmG6+xzM8pajVx7bE2jdYLn63CEq1wjmWZTpUHIy
         El1g==
X-Forwarded-Encrypted: i=1; AJvYcCXt+kXb2YYQwxzBPllcfYVaYIeyeAYg//HVDbeEpqU+XwLneqTfxOJE1hlUalRiAG5O308QLwA=@lists.infradead.org
X-Gm-Message-State: AOJu0YzXbs0JIgfHIZ6hAkVflBMT3QZsUMSNCfE9o5RfK5X7A9XukfKt
	nmAFPqLdSOiBtySt1b5wSbFzxrMZVLSK8xix1ezNv4kKD9webbH5U/NLuARoTvw=
X-Google-Smtp-Source: AGHT+IGeyzqs6kME051X1HodS6OUcEVd1fJmzfHiaYvknClUVHClFoyo1i9WvELf/ZjGHo9rc3d5qA==
X-Received: by 2002:a05:651c:198e:b0:2f4:f279:36d3 with SMTP id 38308e7fff4ca-2f751eaecf8mr12374031fa.4.1725617083891;
        Fri, 06 Sep 2024 03:04:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f65e893563sm6351791fa.4.2024.09.06.03.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 03:04:43 -0700 (PDT)
Date: Fri, 6 Sep 2024 13:04:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Cc: Caleb Connolly <caleb.connolly@linaro.org>, 
	Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>, linux-arm-msm@vger.kernel.org, 
	ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Subject: Re: [PATCH] ath11k: allow missing memory-regions
Message-ID: <w6c22o7j7bv4j3jkcvt5cwdnatsm4lzqtmchh62xm6vqsdv4hs@k46fzmeoyfrt>
References: <20240904095815.1572186-2-caleb.connolly@linaro.org>
 <8f64a4ab-abf5-4afe-bc4f-725fc89d27ec@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8f64a4ab-abf5-4afe-bc4f-725fc89d27ec@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_030446_526989_1750F9D5 
X-CRM114-Status: GOOD (  26.93  )
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

On Fri, Sep 06, 2024 at 12:47:31PM GMT, Raj Kumar Bhagat wrote:
> On 9/4/2024 3:27 PM, Caleb Connolly wrote:
> > On SC7280 platforms which are running with TrustZone, it is not
> > necessary to manually map the memory regions used by the wifi hardware.
> > However, ath11k will currently fail to load unless both memory regions
> > are specified.
> > 
> > This breaks wifi on the rb3gen2 which only specifies the firmware memory
> > region and does not use the CE region.
> > 
> > Adjust the order of operations in ath11k_ahb_fw_resources_init() to
> > check for the wifi-firmware subnode before attempting to parse the
> > memory regions.
> > 
> > Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
> > ---
> > Cc: linux-arm-msm@vger.kernel.org
> > ---
> >  drivers/net/wireless/ath/ath11k/ahb.c | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
> > index 634d385fd9ad..e24f8da565db 100644
> > --- a/drivers/net/wireless/ath/ath11k/ahb.c
> > +++ b/drivers/net/wireless/ath/ath11k/ahb.c
> > @@ -999,20 +999,20 @@ static int ath11k_ahb_fw_resources_init(struct ath11k_base *ab)
> >  	 */
> >  	if (!ab->hw_params.fixed_fw_mem)
> >  		return 0;
> >  
> > -	ret = ath11k_ahb_setup_msa_resources(ab);
> > -	if (ret) {
> > -		ath11k_err(ab, "failed to setup msa resources\n");
> > -		return ret;
> > -	}
> > -
> >  	node = of_get_child_by_name(host_dev->of_node, "wifi-firmware");
> >  	if (!node) {
> >  		ab_ahb->fw.use_tz = true;
> >  		return 0;
> >  	}
> >  
> > +	ret = ath11k_ahb_setup_msa_resources(ab);
> > +	if (ret) {
> > +		ath11k_err(ab, "failed to setup msa resources\n");
> > +		return ret;
> > +	}
> > +
> >  	info.fwnode = &node->fwnode;
> >  	info.parent = host_dev;
> >  	info.name = node->name;
> >  	info.dma_mask = DMA_BIT_MASK(32);
> 
> 
> ath11k_ahb_setup_msa_resources(ab), will only read the device-tree and
> save the memory addresses/size form device-tree to ab_ahb->fw.
> These saved address, only used if "wifi-firmware" node is defined.
> This the node "wifi-firmware" is not defined it is considered to be
> running with TrustZone, and saved addresses are not of use.
> 
> This changes looks fine.

If this is a 'Reviewed-by' then please state so in your message by
adding corresponding line with the tag name, your name and email.
Maintainers and patch management systems will pick it up to reflect your
contribution to the upstream process.

-- 
With best wishes
Dmitry

