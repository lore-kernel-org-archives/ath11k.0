Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF8CCD15DA5
	for <ath11k@archiver.kernel.org>; Mon, 21 Oct 2024 14:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xXcNGCx8R/h6DnznmoiuyzzGuU08XBAyXTEE1fx+zDs=; b=q8USzfak4YnGP6YGvulJKTcanw
	ffGKwYt4NUtbyDDyk0af6XNMqwcx80/9lJnUEFzU4+auP9H6FVqyVL3YQFTkVpGO/etmKVu/5ieam
	wj/UbhEAVbptKR//E44o84q5IfOqLU15oRx5vvQgA+KkKwtft5rdIhQaYjKGEqfvKr3l3q+fi/cYN
	e0YqVsHWcqG2C/CoWej8qxwVedaeBVLV5U4cNiXQw1kqcYYO/xeuJAgqDsg5tz9tK3/NJAOlN8BE3
	O3f9AB/u0RRyctj776djXwOhQsGEfr3DspSbV4qaW/RlgXtfcHLOOjDM38ANwryUupdR6X3speqXJ
	1zjM3idA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2trw-00000007hXt-3Z3h;
	Mon, 21 Oct 2024 14:58:52 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2tTO-00000007dCF-2uvd
	for ath11k@lists.infradead.org;
	Mon, 21 Oct 2024 14:33:32 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-20cd76c513cso38105625ad.3
        for <ath11k@lists.infradead.org>; Mon, 21 Oct 2024 07:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729521209; x=1730126009; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xXcNGCx8R/h6DnznmoiuyzzGuU08XBAyXTEE1fx+zDs=;
        b=lF2El4s4UKv1/lnTLBIjEMYZRMfTH1RiyuoFgl7AS4XZNW/Hdy+9NlwIz0AcC+HSXJ
         XxVUqEkA4RDPv5lbQ3wI7+Rvk49GERXiPmG3ROxcO2zRbvnfrL2nRDx/3TCWq5YnZv5Z
         eRFf/AX4HWYa0fDzq6MQTRoimaxxXW/tixoZb1Y9v+uVHz7Dyb6vcaZ1Sev5XDebYVTR
         5jrEfUEDFxfeybSzupPM2raSj6+aJngvmIYlwerdCOoCooCRJQY5Y9kSdUcuiwO94MYQ
         zPQEsTVL+ftUTkJtEmKvSXtuQe1R3ZhXIL6ykHko2/p8vThzydOWFUQygm0Y8NqWwaRX
         ksSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729521209; x=1730126009;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xXcNGCx8R/h6DnznmoiuyzzGuU08XBAyXTEE1fx+zDs=;
        b=G6cxOPcB3xsIyGEY13xdrhUhVhWjDsiYLtQxehgBTIW3CTko0r85byigI+moGpZ2mk
         FNCihHOXv/da8D3Oy5BIzwgLO8Z9XcpYhOmbZ3vNKsP3kapHTVq3C5Bb+8GpIzz5wCi1
         Oixjo7Yfo8C1Igk7MV/pNqZnffsJbEKrIaF7CqiePH4l/bVByqaxGHfXbl6OaXEOUXbw
         ncJBgUg2n7ly0/NB4vpD6rlfnxfhiSy5DGacfciVa397v5vgvKh3JaZ9IOrpW4cIV0la
         7ysnrnhN8l3vJ2LufOPSE3r808DH7ONbnLdgSQvIROk9AoR/zy49r3VwKhDiYvWD738m
         QlXA==
X-Gm-Message-State: AOJu0YzFUY8CW0leQ7UHAwCQ+K4wI4YuCP9iOkhyC46qJ59BEsdkGPy6
	Hru+l1NQSLOCUgB7IDmO0yDsLgSmRcf392ygsctLCsZv0UZ1pHuQQ20o0j6E
X-Google-Smtp-Source: AGHT+IERko4J5g3Y5FtrovF6cjPJHBQn4RMxKj0/W17G1UwZDrfbNyImPvvVaXIFrVV4lt0+B1NWsA==
X-Received: by 2002:a17:902:d50c:b0:20c:5533:36da with SMTP id d9443c01a7336-20e9492fc14mr2005185ad.42.1729521209120;
        Mon, 21 Oct 2024 07:33:29 -0700 (PDT)
Received: from localhost.localdomain ([103.149.249.231])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7eee62c2sm26680625ad.20.2024.10.21.07.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 07:33:28 -0700 (PDT)
Date: Mon, 21 Oct 2024 22:33:28 +0800
From: Jianhua Lu <lujianhua000@gmail.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: ath11k@lists.infradead.org,
	linux-wireless <linux-wireless@vger.kernel.org>
Subject: Re: ath11k-firmware: QCA6390 hw2.0: Add bdf for Xiaomi Pad 5 Pro
Message-ID: <ZxZmODYOgdQ3CHUG@localhost.localdomain>
References: <ZwR1hu-B0bGe4zG7@localhost.localdomain>
 <bba049d4-39f2-491b-a5e5-ebae0a77fe45@quicinc.com>
 <dc92b42f-a71d-4ca9-bde2-92c3ed30718a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dc92b42f-a71d-4ca9-bde2-92c3ed30718a@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_073330_754885_4B8A7413 
X-CRM114-Status: UNSURE (   7.05  )
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

On Mon, Oct 21, 2024 at 07:23:59AM -0700, Jeff Johnson wrote:
> On 10/21/2024 7:21 AM, Jeff Johnson wrote:
> > On 10/7/2024 4:57 PM, Jianhua Lu wrote:
[..] 
> sigh, correct link:
> https://git.codelinaro.org/clo/ath-firmware/ath11k-firmware/-/commit/4c8ae2fb2b78d5b0bebed63fe8b0f348f9fbc33e

Thank you!

