Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC2DCFC27B
	for <ath11k@archiver.kernel.org>; Fri, 21 Nov 2025 13:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4E4qgWLZbJvc0nks66Kf2sl/KD3LP6StGpvCGYDfDXY=; b=E9N/ZoJlbH2tkte3xYduQC5uF4
	NYCX2G6juFNotypRxDpWRgx54ztLbM2AHpKJ4bIeXBpvqkMEBpTJABvdKH9Kw1a7Up6Pau50PiCs9
	i5neZBUXj5pF30U29jDMxw24hCU7bpD0EW8UuDHna4zi6xI7ZmYws9bXZF0guJTZdN+wL21RFl98W
	KipUDFRLO3ktfQKg2WleZRulMbVpRhgJJKBNNf0OrZBNDgf+N2n+mvWt6CqQzPH/aTOU9GgTkz1hG
	OqtbveSrZqq5NR6Bxp+UcCcDtFttkB5lzrbyM9oe7dkYlIlP5q40EJMQJGbrGSY+yWYRlNrpExHca
	wRZbEFkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMRCL-00000008PcM-3s0e;
	Fri, 21 Nov 2025 13:29:13 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMRCJ-00000008PbO-0AhX
	for ath11k@lists.infradead.org;
	Fri, 21 Nov 2025 13:29:12 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-b73875aa527so321321166b.3
        for <ath11k@lists.infradead.org>; Fri, 21 Nov 2025 05:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763731749; x=1764336549; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4E4qgWLZbJvc0nks66Kf2sl/KD3LP6StGpvCGYDfDXY=;
        b=AWolaUjX4sYRdipBZzETXgd4PZKzgXltuCuHTEMtwZBPutkMcVj1DuFQaqEeVJE7X2
         Py3Z8P18LQWaRS/V+O7V6/TvA9EEYPrL8q3ZQ4EeknHuvyIWjnvLcigCdnh5KPL+DOZu
         wh8qsxql/AVqCobSqLkd8Irw73lHJfob6hWZV4l2ZLSsKJ29FuTWkQO7pL2c9zZ04MQ8
         zv3vWjud1POG/zzCttSJ6hQpLZYbanqDiNKLPqsMqXTh5BLOjZ945CQSmX4hHBRGGzPU
         rn4ob8qrQU4qHaDEbRWZTK9dWMfK/hGVYHX2tL71Z3I0bfJK6CEBCFwNxINwMFqK3mb7
         S96A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763731749; x=1764336549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4E4qgWLZbJvc0nks66Kf2sl/KD3LP6StGpvCGYDfDXY=;
        b=JKXlafV29q3KHZjm0jsAf9ozcTLRUC6hggb5EMM+2ObciiMhmULRz3+HWCaMc3MA4e
         oOdvqik8+OGqtABT9XratZPQ9lFUQtORVA/dhIl06gL4neif7ySxChJhR205AsLBhcmB
         fWJqy88CBYg/myqlJCPAKE/UetwYygJyN60isja/9lUsYIn2VKQHbujd8ecaP2KYQWkH
         Mx9tAH/lykFT0aOlA2NP2yvX6HbBFWKVcZZw5TGe7by2dVjpzz1gQovoIA6p61zbK0lA
         wjORuhgtesRNy8M/FWNgGX6U8qFKoM2FRmCvyLWfTJqD5XiAFib2LE/vIx0AW4+uOGEH
         hEhA==
X-Forwarded-Encrypted: i=1; AJvYcCU6kkPs6ogj3+PE0++eW0Cl82ECL+YKhnhAUVJydN6W5u2kf+tuQ/vGSdCsI/6Og6oTr2wvqWI=@lists.infradead.org
X-Gm-Message-State: AOJu0YyD9Jo6L8YXBJwpVVRL/kH0Kd9ViJJPJiytVZFEZVxumeQg0ILN
	AokY09lQ3Vur9P1B9P+UuY93kWI2yzKXGO4vzEHLMhr8ucwWnRnKXUA=
X-Gm-Gg: ASbGncsHMDn6UMlS8PCINPXMqPfn8ntDc5TZ7ie+SUydz6n9fwcGY+QkvQtcFMzXuGL
	YwKicd+7ZTRXSvlD7U+CRoiK2JjCxaDDhMqe8TNkV5xxBbN/V37rv7w84BUfVJNf9Uu3bfGqdam
	9zfbfUvvv670c4euGowMjVL2Yi+CGaReublmH9ePTM1S1aN8wEbAYW/805gVELnIxnyaP4PLwKx
	eisSGELjRED50p/21ni5LfTgOg9r1d2/kO9je3AVEc4L2yeFSjoyJDwShZ44sBPNK1GRahz/l97
	iXEpsAeqLrcYmeTzeOUnFV26OS9x/G1IuLOySFxJbTHVj6xL4nKY0iBa/SOW7hp6Da3U5E8bTq7
	mmZsxZ13p4nbY2hBRFGuXX8B4BjqcM2kP85sKEXmsDWBXLrW/YRaUENtMyb5v+M3lq18lWStRtP
	oHvAPiazmq0kDyM18lWrpUBoO0/ErH87LlwF+0dzOhmiNEGCU=
X-Google-Smtp-Source: AGHT+IF+fRHUXtIbFHexbW+bX7vS6xhtJysRXvMNTGrbcAbQOhcG/TSSGP78YliQlRoGmwcWofF6oQ==
X-Received: by 2002:a17:907:da4:b0:b73:3ced:2f66 with SMTP id a640c23a62f3a-b767159eea3mr272040066b.14.1763731748949;
        Fri, 21 Nov 2025 05:29:08 -0800 (PST)
Received: from frutis-latitude7490 (public-gprs376887.centertel.pl. [37.47.103.120])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-b7654cefe53sm459963266b.13.2025.11.21.05.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 05:29:08 -0800 (PST)
From: =?UTF-8?q?Pawe=C5=82=20Owoc?= <frut3k7@gmail.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: =?UTF-8?q?Pawe=C5=82=20Owoc?= <frut3k7@gmail.com>,
	ath10k <ath10k@lists.infradead.org>,
	ath11k <ath11k@lists.infradead.org>,
	ath12k <ath12k@lists.infradead.org>,
	linux-wireless <linux-wireless@vger.kernel.org>,
	Kalle Valo <quic_kvalo@quicinc.com>
Subject: Re: New staging repos for ath1*k firmware
Date: Fri, 21 Nov 2025 14:28:25 +0100
Message-ID: <20251121132825.1663248-1-frut3k7@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <bac97f31-4a70-4c4c-8179-4ede0b32f869@quicinc.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_052911_107435_A9A516D9 
X-CRM114-Status: UNSURE (   5.35  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Hi, is it possible to release the new firmware version (2.12) for the IPQ8074?
There's a problem with the latest ath11k driver on version 2.9:
https://lore.kernel.org/linux-wireless/CAKEyCaD8RMqPvwZOxgwAT4G=h-M94ToxoSdYwCjfvZMiM8mB-g@mail.gmail.com/

Regards,

