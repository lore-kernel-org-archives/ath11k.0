Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76C53C021B8
	for <ath11k@archiver.kernel.org>; Tue,  4 Mar 2025 06:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0L9jk7jDl4R7Tch+PFoZUAPpOUQGpTxhl+ZUFKtbat4=; b=g8YB5uNOvhUk7wf358uz2taEn2
	kbhvDAxRGDnQHlCkLmdM+wje9nukTmN2LfILHYkeQSLYHtl99FhgLgcwqHo+1Islg1xwZ+zxJP8uz
	IBDrmIVRhlUECv+XxxWruWEuUxf07Aq8mFa0nb2Q8m3wvjjpTKGSCZxZjnHvF2TNkCgSdYBcTxfFG
	SNW/3t3Eruf2LjEkDFzlw+HFYbXQQLTNObbw02E72uf5j18fNTsLvsZmwGRQBeQbLAjFs0JsOdOcm
	fuxtLCniddWrLFZZSK3QoQ7nwE0GH3lYcmd8sA0ukf3shTrG8w/xtzYRtctjMgOzzlAh88uOoHizD
	DTTBY2UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpM2s-00000003KrS-24Us;
	Tue, 04 Mar 2025 06:46:26 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpLqP-00000003IBB-3mjR
	for ath11k@lists.infradead.org;
	Tue, 04 Mar 2025 06:33:35 +0000
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-3f67b111bf2so212389b6e.2
        for <ath11k@lists.infradead.org>; Mon, 03 Mar 2025 22:33:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google; t=1741070012; x=1741674812; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0L9jk7jDl4R7Tch+PFoZUAPpOUQGpTxhl+ZUFKtbat4=;
        b=ToJ4eFNLbZF23yoQl1y6szesyHYDkzg2/q3j076knqhL9Fcr31PJb5yQjglOKi74/q
         bL6lFpmtHr77/6Zhg6AjktegcM575L/Y/Ia12SjKqKcT0j+u4VyzQwidf/g4vybxouhj
         OE6N5DsLwpUCoWaKW8ZSN8Bi+OjXo1B6HMEux5Hs0dgBif8YfO67Rh1Xm39+igpfoeHJ
         U4akhVGRi0zZydvJ2p6eNMK8E1QOZugWPJDc5dG9g1p+yRwijL+3jGZKxeE9wTP1qvBh
         socdbM1wLo3cnnE/4W694PwXJBFjyT3MQQI0BT16BEqYLvUMYt3udW0JFtL5xR0jeaCA
         QxwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741070012; x=1741674812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0L9jk7jDl4R7Tch+PFoZUAPpOUQGpTxhl+ZUFKtbat4=;
        b=dx6Q+P5ZHX/2QmUl41ng5+t0CWw3m6Hb5Fj6uAxvQtaqyMNOXeAtwuo4CjUcHlFuwH
         TuNAcF/RTcV3Y66YnWmiZrtnPCGZ/9N9uxRovKV4jZ4vKCB6VZ1GGdobFzVUwk7wp3fF
         2UEWIRuz6cPP+W8i/IPCGmXJ7b7/bh18nXcoXEfXRx9LtZqT+IRL4ZC/hZ9rsWyUsaZ8
         ln5zFv0stmJTMonSkwXYcVGoOI3tPRTIKZXI3/gZJyh8Ku/cWcUU9Pn/pBV9RA8H30Tl
         NfH2dYVrV7ftvxp15s4/LNWEgudXAcklNE4vN8guIBZCzgxryFicE4ZKFvew0KwmevyG
         n0wQ==
X-Gm-Message-State: AOJu0YxI+uCjaWjjVmACnyQe3avy7q6JY9jEf3w5ltUa9Q1nW9rzhOMF
	XtLP6fYM99IiF4sXdNGh1XK0/f8xrTNEJwAmoLZrRmgtWGt8HRbt97i6L9NSPxI=
X-Gm-Gg: ASbGnctFuYOYF6InrrFnbiWkwm7OSiFswQrFltKxX+vtYUIzrKAhoFoW7gCFedQTeBJ
	/XlUnOlE3SsvXc+yNXRzrrTSCDnli0+Sr2wRc2DXKq3e5duW41wtzttgG7SuBQdZUW3zOXojUnf
	vgIKuQvKfBAzhl13oI+DICzvcwz8JeD00sWCDAlUUbxJG2uOBQSQO+pY75q7he+6uwRtbflf9D+
	EfIXhhP5molbnnMCNmT3wBkxAsSDq6fLZWPXE10k7CP60HBIwx+O8qrYOUFwtqSmboU2emeWUNu
	s+fLeM9N8MKijxCBH34mJwf6FIqZnaFk0gdViU4A8ElvP+yfC8Cce5YQDAAl+tCFBg/2d0ATdCQ
	qlzXPZ5+6HGTR
X-Google-Smtp-Source: AGHT+IF836u3HRurnaD3JNQQMkTOVJFkdb7saaYaAdjJKb8CcB9Uh6cD4rojnwwaZzpJu95yORRjaw==
X-Received: by 2002:a05:6808:2e96:b0:3eb:3b69:8ff4 with SMTP id 5614622812f47-3f5585254ffmr10749480b6e.15.1741070011245;
        Mon, 03 Mar 2025 22:33:31 -0800 (PST)
Received: from localhost (104-48-214-220.lightspeed.snantx.sbcglobal.net. [104.48.214.220])
        by smtp.gmail.com with UTF8SMTPSA id 5614622812f47-3f66e8449f6sm539684b6e.1.2025.03.03.22.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 22:33:29 -0800 (PST)
From: Steev Klimaszewski <steev@kali.org>
To: hzyitc@outlook.com
Cc: ath11k@lists.infradead.org,
	jjohnson@kernel.org,
	johannes@sipsolutions.net,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org
Subject: Re: [PATCH 1/1] wifi: ath11k: pcic: make memory access more readable
Date: Tue,  4 Mar 2025 00:33:28 -0600
Message-ID: <20250304063328.33762-1-steev@kali.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <TYZPR01MB55566065525ADA7F71F516D4C9C92@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
References: <TYZPR01MB55566065525ADA7F71F516D4C9C92@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_223333_951399_A3B9D2FC 
X-CRM114-Status: UNSURE (   6.38  )
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

Hi Ziyang,

With this patch applied, on the Thinkpad X13s which has an ath11k, I am seeing
the following:

 ath11k_pci 0006:01:00.0: chip_id 0x2 chip_family 0xb board_id 0x8c soc_id 0x400c0210
 ath11k_pci 0006:01:00.0: fw_version 0x11088c35 fw_build_timestamp 2024-04-17 08:34 fw_build_id WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.41
 ath11k_pci 0006:01:00.0: firmware crashed: MHI_CB_EE_RDDM
 ath11k_pci 0006:01:00.0: ignore reset dev flags 0xc800
 ath11k_pci 0006:01:00.0: failed to receive control response completion, polling..
 ath11k_pci 0006:01:00.0: ctl_resp never came in (-110)
 ath11k_pci 0006:01:00.0: failed to connect to HTC: -110
 ath11k_pci 0006:01:00.0: failed to start core: -110
 failed to send QMI message
 ath11k_pci 0006:01:00.0: failed to send wlan mode request (mode 4): -5
 ath11k_pci 0006:01:00.0: qmi failed to send wlan mode off: -5

I'm pretty sure this isn't supposed to happen?

--steev

