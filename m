Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 121A0D3901B
	for <ath11k@archiver.kernel.org>; Wed, 14 Jan 2026 21:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Pcz4WIDueT+6V6+NVL3CX0OqluBuGMzBiT0dhMMZoM=; b=1yFWdonJwtBzMkxfXWv3OKIl2u
	rWFFQ0xj4UKtbQeMTVIY6RIctAnIH9SjC12ShR82TlvCSMGwGEsEQMhZsb7fb0d2H0d7FuyKWUwEM
	KyHaf2o/O3RVWZcTzEXNYzEoWPDWMNbPHyJbgl/afSWzuJay4jg4FZbu7IK0Er81drDPt7mQ+9NBY
	joO3uC72khGmzxEYOyj0iVsoKvAO8UCjpeRnHEY/5hBF1KuSIUeM1h6z7Bjp+6eJgWj6aSKGHrSbh
	b+uKmSqLmrvZUBNGpsUnE2fhpWThBQX2lmFSU2ZXWbhos5hpK0kXhYsXP9lpdKTjknZ1xWFf8MFzt
	8BiLrP/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg8RE-0000000Amj7-1HDL;
	Wed, 14 Jan 2026 21:30:00 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg8RC-0000000AmiS-0Bua
	for ath11k@lists.infradead.org;
	Wed, 14 Jan 2026 21:29:59 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-7cfd139645cso161789a34.0
        for <ath11k@lists.infradead.org>; Wed, 14 Jan 2026 13:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768426196; x=1769030996; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Pcz4WIDueT+6V6+NVL3CX0OqluBuGMzBiT0dhMMZoM=;
        b=jFPWV3sRVrp1yOWwXTen5erZvGPz5K7UaQvDd60VeYfd14mpgsziR40tR/7Atw1Gyi
         M6ZgbrSSgLPgiFfslrKG0iYSUXxC5AJsP379iajyIjpaOxLGBrotjwTfPcgVJCbz29fJ
         tfU90DR/qxN3x5U1fqHFpghfZ4qMrKtTRfu1Qa2BoCiRniPlNpmNr89ulIeBr/aTiLqP
         MhEzsqcckZtI4mUnVe+T5lOOnQ/87AMM33XvqtRwq5nr0+jb9pALFFp0KqEkbk1r9wOt
         PwkntKv2PMgGFx+/v9QxMT6/9fKyUWAHVmDRZY8oChjUVf1/AkE2qgO8sGLiXft/iaqn
         gtRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768426196; x=1769030996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1Pcz4WIDueT+6V6+NVL3CX0OqluBuGMzBiT0dhMMZoM=;
        b=WBNczPcOcFyF2/bTf7YjpxCdnM4GmopYwHKMqtK74oaQz58pU17jKV3aunca4ROpPZ
         YeWHFKljoFY3S36maXVQPlpC8x5MeqNAG2tEm+jqo5iWccZqzq13FWKkMd+9klntThY2
         KT0WeyCZzeVRmDv5Pds0hhgAzkUnj1YR/JFQYZgPoOCjrCnI/GHJkRfS22TavM7WeH+V
         lm0ufMF8sv10xGyu5ctDWmR7muEffI0bD4yTYXoCrMQAFLvqlTiYUAvVUpTkAVed9c51
         oNOq2unRCAGz3RxVRm7Hel1yeVhP+mSuauyhzJ+b41ZG+ePEvgvq3/VtiFpXvzG7WjUm
         WNpQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3ZKaIM0QrpCtS1uXdZeYwpc04ucOz4sy6kfwPM/1MSg4gqzCey+oQlAi5qi8ADvk2pKpFe7M=@lists.infradead.org
X-Gm-Message-State: AOJu0YxgulSSj3kqFBtArD8pOaHpBIc9nJNh7SzMRvSZtnqvvHVRUqWH
	SUGco0lk0EDi3SrOrRNjqa/NO8RZqMDR6QW1nAa/FaIXGxXEiHVkJM8hEx/Hnw==
X-Gm-Gg: AY/fxX6mJ1SGGJbXQ/dmlMjhzVtp41AIeebzhXtQPyLZ1ddSAVKedVuYnsQKUJMU9e6
	Zy04COAzsNJQbWg49Dqd84M0oFLBPfWvsFPUJ7dSD8MtUrv6vvatkurNmKPQ1n5HQ4oj+uVd9IR
	Fe8AH+Ok5NQux4H7zK59X9nK58wIf4e3uCO4NnW/DrFP4LhlXF9LeFuAsFLWBFgO4pZW+dEBw8p
	VAQvFRy5bZ7P6gu8oS5nqKPXU3rzJ2bTEMwaZjgIy5pAwrHTv6uPphA4EQ5t/AGyRN/XZOenRMk
	IIaqBqBDuHYPtFmLohFDeNpQlMwEr+Sp4caZxzrnHXkhcq2O/LBD6KIretbZYUBR/H3OpmT5mzt
	Z6RpW2RGiZ0C7aooxN9CsdzjpeoBdWGZPkxs3dR3c/pGUczUCV6vuX/dV/9m5vay246bsgdIQsw
	OTEToDk1sd6h4NGyqdDDA4/vX8PVzRbKXJdCVfQpYEQxAWNeHFNoR4i9HKKisahaqT4DOGvZQ6d
	O5aFoeEVuMpYkP+YSLecliAgtXtwoY=
X-Received: by 2002:a9d:7758:0:b0:7cf:cbff:85e6 with SMTP id 46e09a7af769-7cfd467608fmr502626a34.12.1768426196311;
        Wed, 14 Jan 2026 13:29:56 -0800 (PST)
Received: from nukework.gtech (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ce478af494sm18524978a34.17.2026.01.14.13.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 13:29:54 -0800 (PST)
From: "Alex G." <mr.nuke.me@gmail.com>
To: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
 jjohnson@kernel.org, ath11k@lists.infradead.org,
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: baochen.qiang@oss.qualcomm.com, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] wifi: ath11k: move .max_tx_ring to struct ath11k_hw_hal_params
Date: Wed, 14 Jan 2026 15:29:53 -0600
Message-ID: <5896283.e9J7NaK4W3@nukework.gtech>
In-Reply-To: <c8456b52-f14c-4bcf-9385-580e9607219d@oss.qualcomm.com>
References: <20251228151408.2116108-1-mr.nuke.me@gmail.com>
 <56c6471b-c878-4afd-8e8e-d56266ca9c64@oss.qualcomm.com>
 <c8456b52-f14c-4bcf-9385-580e9607219d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_132958_120411_37C4048D 
X-CRM114-Status: GOOD (  19.36  )
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

On Wednesday, January 14, 2026 11:24:19 AM CST Jeff Johnson wrote:
> On 1/12/2026 11:00 PM, Vasanthakumar Thiagarajan wrote:
> > On 12/28/2025 8:44 PM, Alexandru Gagniuc wrote:
> >> ".max_tx_ring" is an upper bounds to indexing ".tcl2wbm_rbm_map". It
> >> is initialized in, core.c, a different file than the array. This
> >> spaghetti-like relation is fragile and not obvious. Accidentally
> >> setting ".max_tx_ring" too high leads to a hard to track out-of-
> >> bounds access and memory corruption.
> >> 
> >> There is a small ambiguity on the meaning of "max_tx_ring":
> >>   - The highest ring, max=3 implies there are 4 rings (0, 1, 2, 3)
> >>   - The highest number to use for array indexing (there are 3 rings)
> >> 
> >> Clarify this dependency by moving ".max_tx_ring" adjacent to the array
> >> ".tcl2wbm_rbm_map", and name it "num_tx_rings". Use ARRAY_SIZE()
> >> instead of #defines to initialize the length field.
> >> 
> >> The ath11k_hw_hal_params_qca6390 uses fewer num_tx_rings than its map,
> >> so use a constant to express the correct value. Add a static_assert()
> >> to fail compilation if the constant is accidentally set too high.
> > 
> > Text related to static_assert to be removed accordingly.
>
Hi Jeff,

> I removed the last sentence in 'pending', please check:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=pendin
> g&id=26bb149b5e011b0f73f7b74421589cbd38e3304b

Re-reading the commit message, I think it makes sense to also remove the 
sentence "The ath11k_hw_hal_params_qca6390 uses fewer num_tx_rings than its 
map, so use a constant to express the correct value.". Do you think it's worth 
submitting a v4 with this minor change?

Alex

> >> The intent is to make the code easier to understand rather than fix
> >> an existing bug.
> >> 
> >> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> > 
> > With the above minor comment addressed.
> > 
> > Reviewed-by: Vasanthakumar Thiagarajan
> > <vasanthakumar.thiagarajan@oss.qualcomm.com>





