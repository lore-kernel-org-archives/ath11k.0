Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AFE5D3EE6A
	for <ath11k@archiver.kernel.org>; Thu, 22 Jan 2026 14:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bzjStokDxQhdkHggmyC2zUbAPWDuf5AcT2iZZVjDG14=; b=Snr0uH/6ifcTmu0WOBiwscphvu
	xrib7WLFsJunszpVPmxqkLnkh3Xd6zYqzcY/6Gak1cPn6Lnbonn8eFXKZ876FyrARE/sGA7Q3kHPy
	YnAGxYlmcmm2B6uIEp5Q6j6wdDWsqZ1TkZYjUpXCRix9cBBrHnqjQKEYiHP6WFffsZlycFJrceTLl
	43u6AbRYvM+kqsQuQPDU/78DWsoKvqPtfH+CLMP2l1NlEieBSW48hiegLnM+ONxwYBztz+495Fl1z
	nh5ympXDtilVaT+HdxWn0pbXzbjPcIWEkVgaMpgNfR6ugmVHPwxFK3JxM9Mui+LR9FPtqRlh8itXm
	AZyarEqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vivGs-00000007CMt-2Ev0;
	Thu, 22 Jan 2026 14:02:50 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vivGp-00000007CMB-3CvU
	for ath11k@lists.infradead.org;
	Thu, 22 Jan 2026 14:02:49 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4801c1ad878so9811695e9.1
        for <ath11k@lists.infradead.org>; Thu, 22 Jan 2026 06:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769090564; x=1769695364; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bzjStokDxQhdkHggmyC2zUbAPWDuf5AcT2iZZVjDG14=;
        b=E4GVew4gZ6wj7HhWawAm3EgSUEe7obx8m5scbszlw2GQEYZHE7H/4AjMNivATJvLMn
         NeF8DAmubQs9Jb52RNtr0ptiCD4AR2270sffXj5YOraVkhPuPIOQXJdA3c5VIamvvfTZ
         n0Yk8IHko+PC2oQma3yjwdEoG3y5NbfftM63KLnL9GH3Z4cbpcAKaik6cdXuLD7Zd8B5
         cVHEb7Yyk+iuHdIHj7XfgcAb3+T8GGMKzDkCRyxnRVbe5D8KVXbGIxBCNrBW3Gzzb4NH
         uU5GBcckCWLYTIgNylYGiabVmsYgo/6LIngUUBW9aOTTd39KzZZZg9BbHJfH3xyYixLw
         0eoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769090564; x=1769695364;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bzjStokDxQhdkHggmyC2zUbAPWDuf5AcT2iZZVjDG14=;
        b=FiZoOa/41VUQl+p/mRtffvqONvw0tuE0m646EUSwL8sI7cX/UEzM+EF19rXBO/k+Bp
         NwRSa3d3jbcxcRv111PukhCAifKJZqMcr0HSdlZRZ2nEs3G54xGImxX87HfuOSKuVzL4
         LHQvN/6UIMS3n/UaHz+ekQJQ0CM0pJhKQ+yeUG3DrrBPvie6esgz32jlATCt+Mh4yAJ9
         S4tgm8OzXV0g1pjnQHgnTRN7ojtziIX1tvEUWpSOIZkEnXh8ZZvlg82IdZQcI91yIlH6
         o1G/baYNct2pFX3GglC12h3KChGU5rWShHzD9D4TWT3hMMiuILn+sQjtp22E4YMytXDm
         Uy+A==
X-Forwarded-Encrypted: i=1; AJvYcCXxkWYZAmAgegcU5VwZlwPJH9hKx1JlQgOtzKB5cJn/Veb5On1pwJ+jf7QMAStjv2zk7U+b/xA=@lists.infradead.org
X-Gm-Message-State: AOJu0YxbbR+b0fSPtaoiFunCuaN977cPsFD5GgYtd9vMnvLuMl9T9ZZk
	HoKNH16v+PmIIk/6+Fc/nSt2eZKqIjhyPhiD62/q8wM+/C8wbHh7MLxc
X-Gm-Gg: AZuq6aKt2dAfmAmO8DXI+J2ApWwO6fyLKRolWS4peS2+B3BL6rLVVKuWmzz6YvkNAWY
	T2OjoqtGIkHbqnWSVwDIL4sqkUd7lCE7afGDo9szzRpCleDifRpke4sXbgHAvW9uLKIm6ch8MGi
	/qv0+SyvbsfChsafHsBM4+7I9YJPRSpWDIWERwNHZ2Kb0XUdnngmZvkBqXzkbQHvxaMUSoZhYhR
	p0LYjeREJmE4YVg2wPJ0pIryVShTNgn4CMwEq9tU28GMmjDNWBMGA58EmI/+KBpnJ32yHbolwg+
	1So3VS8M8grgfcIj4jywDkakqDDaeoGfwYUAdjHYhMl7Q9Ree5m9lorUqVjYCOPEL0vbzJ4UFGo
	xqmbJ7Av2RK1PePrNQj7t667FmJbgZ1F4k+8WS+9W3FSsVxYwaf92Nu13CRlsvf86JzmNR7rJdJ
	mkG0eLgnakdd3I+AEMSIMle8oXVPpLTA==
X-Received: by 2002:a05:600c:5246:b0:471:13dd:bae7 with SMTP id 5b1f17b1804b1-4803e7f1b66mr123740895e9.30.1769090564171;
        Thu, 22 Jan 2026 06:02:44 -0800 (PST)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569921f6esm44595333f8f.4.2026.01.22.06.02.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 06:02:43 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 22 Jan 2026 15:02:43 +0100
Message-Id: <DFV69L2EXL7Z.2ELUVCHR6LP1J@gmail.com>
Cc: <linux-wireless@vger.kernel.org>, "Florian Maurer" <f.maurer@outlook.de>
Subject: Re: [RFC PATCH] ath11k: add ath11k_mac_op_flush_sta to properly
 flush pending packets
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Jeff Johnson" <jeff.johnson@oss.qualcomm.com>,
 <ath11k@lists.infradead.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <GV1P250MB14333A5BF24623C4753A10E1E8E0A@GV1P250MB1433.EURP250.PROD.OUTLOOK.COM> <29a30250-137e-429f-91fb-1f509a55746f@oss.qualcomm.com>
In-Reply-To: <29a30250-137e-429f-91fb-1f509a55746f@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_060247_832160_335C5EFD 
X-CRM114-Status: UNSURE (   6.46  )
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

On Tue Oct 7, 2025 at 4:29 PM CEST, Jeff Johnson wrote:
[...]
> These are just cosmetic comments. I've asked both the infrastructure and =
the
> mobile teams to validate this proposal for technical correctness.
>
> /jeff

Hello Jeff,

Just to check if you got any of your guys to check this subject. The final =
patch
here [0] seems to not have been accepted yet. And the "issue" is also there=
 in
ath12k, so if we could fix it for both driver that would be a plus.

[0]: https://lore.kernel.org/linux-wireless/GV1P250MB1433E723AF90A69AEBB696=
DAE8CBA@GV1P250MB1433.EURP250.PROD.OUTLOOK.COM/#t

Thanks,

