Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80E81C4332F
	for <ath11k@archiver.kernel.org>; Tue, 12 Dec 2023 18:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WB88RFlP0qW+BEESRq4+6gcx4/r6x2h6TMxX17XTYEc=; b=zhDmT+KkcTks3cnytfVRfykafQ
	+gya6CskxIbcNT0WunKsd+minVaTLS/wQuBhrOJbI0LyX28pTPjwjAw8MJHXiILXDCAdxqwnOd+Tj
	xxnkzGReiAsrsSaG3boTMbRPW3eJc1j+W6zvAjMOVI3Ar7uOTdMTxjS328cgKUZwG7HM+Y7kUKIIa
	lh9PnlX2quCVx2skdSIXeg996IPXWaPgech1MRcZO2T5R0cqgH4wvh9kOpcFpnmi8FR0iW94Lr9ph
	eyWr231wzf7/23DIbETlVb+FpptlVYhQOlarJjZDUbYEU0c8nmobZlXJe009xGMgK3H5/7bGy11Bj
	7LWgtdGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rD7IF-00CTpk-2b;
	Tue, 12 Dec 2023 18:15:43 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rD7IB-00CTp7-1o
	for ath11k@lists.infradead.org;
	Tue, 12 Dec 2023 18:15:41 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2ca09601127so81060821fa.1
        for <ath11k@lists.infradead.org>; Tue, 12 Dec 2023 10:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702404936; x=1703009736; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WB88RFlP0qW+BEESRq4+6gcx4/r6x2h6TMxX17XTYEc=;
        b=nQjuWyR99wXApSL5ZFNlRAnjyIupvO6gRe9ks+W9TFB2epC3aoJU9s0I7mz0i+5a2D
         R0wHvubgAE5xgJFzPfKkyFMEsJS8KBDQiDfLl5bDKKWxng1o2kkkusYEM/PTV7X7kRvL
         MPp6fXg3FiWCLeeXGcomRyRkY7q82lk9pINXbHrenijdQjJx1OS62QS/v+82TW5YrfA8
         0ehSeBL1CDuAI4vaeg/Ci5xIJVKvA5lmTR9DCU3AxxyHiZlferqYfIAyONvoAsjCBpQB
         ID4Zm5VHzdd0wsAbNm5AL3EiKIkhmlfShlUuE3K3TE1fsx0rdAvIPAOxIQRJPrHWu7Fm
         y/mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702404936; x=1703009736;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WB88RFlP0qW+BEESRq4+6gcx4/r6x2h6TMxX17XTYEc=;
        b=SSuJALdrNVg5rlWHhV+b8yoOzqdsBoGRq8P4oSb8SLxa3KihXkcIzyiFgSetZQBl1V
         9XRaOfiCuXemFnwq93STWdBzIxix5ZGNezRTxKGxKQoBp0U5TFzRugObs/7WpL1/FYKC
         5TKxBjQJcSi2i2TIqPugggpj2fpgQK3qDA1yVO0vgLDLnITBLG3etmEE5nqL6HoxdsAg
         gz5HJQUgBllK95+ugn8J7B6A2Bql40PUqu7wdp5O1Hn+SbvzlQY+Lc9Of6z6kOOAXnLZ
         hw7CoFCFG1p4P9j4IrGHSvztkf5EpBxV4AZR39X1LkcT/Pg5fcphG/KEoDm3AUftNN06
         xGxg==
X-Gm-Message-State: AOJu0YyY7eVWTxXSf1BmGfAmCwzmFtv8tVrgixQxNGIBmQ7944fpY+X9
	I6T3N+D5JEZuvCRPbu0i4ntcAGWnbmdsv6MBuMwXOB8LVBs=
X-Google-Smtp-Source: AGHT+IGtTqDoB6c05nm/DSJj0I1caN/z3MOFrEx+JDWW3x55QN9PGHAH01B8W1hpZWrs4XiTOZFfITJJZKdMn4hAlUg=
X-Received: by 2002:a2e:9f49:0:b0:2c9:f6e2:41bb with SMTP id
 v9-20020a2e9f49000000b002c9f6e241bbmr3097499ljk.91.1702404936349; Tue, 12 Dec
 2023 10:15:36 -0800 (PST)
MIME-Version: 1.0
From: Yaroslav Isakov <yaroslav.isakov@gmail.com>
Date: Tue, 12 Dec 2023 19:15:25 +0100
Message-ID: <CADS+iDVE8GB_+H+1DAPwcwdpjddUqzsvRmnygtXv7yUxRwLTZQ@mail.gmail.com>
Subject: wcn6855 - stuck in 20Mhz on rx, but full 80mhz on tx
To: ath11k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_101539_603838_7CE22A6A 
X-CRM114-Status: UNSURE (   3.43  )
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

Hello! I found that my new laptop, Thinkpad T14 Gen 4 AMD, cannot use
80Mhz for rx - even though AP supports 80mhz, and tx shows full 80Mhz.
I reported it as https://bugzilla.kernel.org/show_bug.cgi?id=218246,
with all the details, but, there is no comments in it, so, sending it
for visibility.

