Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D0C9C44501
	for <ath11k@archiver.kernel.org>; Sat, 11 Jul 2026 15:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=klSAWJ+LyVat8IJ5fTR83Bg1CYUQhCsmSF+iDHUXRZU=; b=we68oKNNiXibp1GbrI1fNY+qO8
	4mgmCJuHtLtGVaZE+pZ2mTP6jk5bEue1+AUp9UGtWAW9r+OmQ36YFw2kYjyWRjiAgJIrYuNPVriDj
	RQ5dULSmomYy9RByO9QoLoydOfqFF0Ha0+qjTntDr/0s7LT0P+67eWBIFdFv9MBuFI3JPVZ2+HPOU
	CJOznglg7L52JIqtt91AMUNNJ3//OBCca9NesySqmKD/HNFsogZngPHmfOGHZyQmJPdjkOoexet3E
	WK7vOxcuDj+g3a9tvjh/EzjLxysy/GFOwmc0a/FX04RSNnlRevMVlHGzjo3qNsDywesYntZcP0e8p
	cODsesWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiZi8-00000006ewU-0UCs;
	Sat, 11 Jul 2026 15:33:48 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiZi5-00000006evp-0OPo
	for ath11k@lists.infradead.org;
	Sat, 11 Jul 2026 15:33:46 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2cace91f112so15258875ad.0
        for <ath11k@lists.infradead.org>; Sat, 11 Jul 2026 08:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783784024; x=1784388824; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=klSAWJ+LyVat8IJ5fTR83Bg1CYUQhCsmSF+iDHUXRZU=;
        b=cE/VpUvKJPnGLS4nAMJa4ipMXkIQq65zWoGddHplvX+Ef0JaJlJoGB/C9U9wKrZBtT
         QSdC3GhI8W1X0PqQjVEqGsxs1KL1k+tk1Ljrz0wtZWOAwvGqlJqtLb0G4d/QjQXkUWbO
         f3Zcg9++IhWMkmbYnx+qMvD32zzBdPdr6B6POPZh1gpN0sIM1jmr/Ev85TdP7IRe27vi
         zihlF77mR6Y8RUy4hrf9WV702iMsqXXqI0wzFrt0zydTJ3IkTaT0MUEUhc/CH4SXjLrA
         B0UGImYslBrJz0LMm6/jXARFtvukX6e9tlPDcxVEkV/XSu75vvJmaAHmeuies8nrTy9L
         2Twg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783784024; x=1784388824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=klSAWJ+LyVat8IJ5fTR83Bg1CYUQhCsmSF+iDHUXRZU=;
        b=i5mYZGQA7hzA7K4bvQ/lDSuc1wt9J7oo7XOd8bFBxQyIMBwjvLIH+Clyg2jbbe6r5F
         YblL9HE4iQUgD961UsdlYSCiQGEEAps5Gt+2oGcdajj5adM5fZRRM/dXSgE+cMu/pS/8
         JmtypZ4OXkdFneTCc53cyikn9nKbsHwcyVNYsI1LayaVKQ80ovYQ231UfzOa1llZsEcE
         w1L4QG0aS60JFFeiY2Ek1oKGjdBnlJkSd4gOqQpAhCTqM0vC/+vrpscDXAbqdd1Lvwy8
         bf+8jfYpG/CiibiIw0bdvEcJUVuE484c4XxjAU7OdhuNHZ0sGmOoZwBEl+4N4ZQVO1RU
         O7Gw==
X-Gm-Message-State: AOJu0Yz2fqctFJdhie6nh2bZL/R2VDNDk9aP5997Km1UrceAVI/340vp
	WNho3EHlAsQAj6Y6nM+CqFa9Zwe6oqm4Nfyy4SIoNPXW5ME4BKXIhz4N
X-Gm-Gg: AfdE7ckn1JOny7XJ6FS7aEwg7am0DskXtmodZIyllttA99JrnnlwQO+E8UCo8qLt7KM
	EuDyQyXSyVXhLzzWXx5pPIY9WH4cZ9GXmH3gskpQu8kEkcpyptflEilFILFODYOhnXA3FAEmIqk
	WkY+yj87Z/hPbC8QYv2/TedjBGLky/lCQ+1kHVtra0L+oSbrWU/Ny7WwvRpKiEgBTtL9nEEbkLP
	g7IxUAUQdA9zPGa4PL7mRMCSlVj9NNA89UZiTOGsPApIgQEo1xp8GlpIaVPYGiQUFLwGoel5z13
	InQT+4Qm1UedxfOph1CqJXQEFPNbKBqS/DNIPhp/F2zYRmtqodfhnAFgzaxAjfuhu8NlZDIJBnA
	lh1rOXdPV99MxRgkkMcl4FBdM0/ZPKtqDXFnyugckMxvV4cy/m/vdti9jFeAMUEIzP0P8gBhU7H
	K6WmN1pwLOgaVE3Ds1me+hcgGo9T54Dnuf0M30kgHMpwt8DkGc65DFnyCK7LmFxXIK
X-Received: by 2002:a17:903:b08:b0:2c6:a172:55a6 with SMTP id d9443c01a7336-2ce9e7a5d20mr32200805ad.9.1783784024060;
        Sat, 11 Jul 2026 08:33:44 -0700 (PDT)
Received: from DESKTOP-VNSSJ2S.lan (59-127-145-64.hinet-ip.hinet.net. [59.127.145.64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ce95e001b1sm18256645ad.66.2026.07.11.08.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 08:33:43 -0700 (PDT)
From: Zhi-Jun You <hujy652@gmail.com>
To: jtornosm@redhat.com
Cc: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	jjohnson@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	hujy652@gmail.com
Subject: [PATCH 1/2] wifi: ath11k: implement custom wake_tx_queue with flow control
Date: Sat, 11 Jul 2026 23:33:36 +0800
Message-ID: <20260711153336.542-1-hujy652@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260710155443.1761760-2-jtornosm@redhat.com>
References: <20260710155443.1761760-2-jtornosm@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260711_083345_133519_D9612114 
X-CRM114-Status: UNSURE (   4.45  )
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

Hi Jose,

In wake_tx_queue:
ring_id = txq->ac % ar->ab->hw_params.hal_params->num_tx_rings;

In ath11k_dp_tx which is called by ath11k_mac_op_tx:
ring_selector = ab->hw_params.hw_ops->get_ring_selector(skb);
ti.ring_id = ring_selector % num_tx_rings;

Are you sure ring_id will be the same?
Also mgmt frames use a different path.

Best regards,
Zhi-Jun

