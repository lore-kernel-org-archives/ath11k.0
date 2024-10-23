Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8C91D2E01E
	for <ath11k@archiver.kernel.org>; Wed, 23 Oct 2024 07:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pRJ+GZAFwtn0kOSMat8djdxy5/xbVF1GRGV31Fs/Szs=; b=cWrqWTeUriINhlPAO5jLgvHKcq
	RVY2FV0s3J8DW0o7R6LqisXRbgTSkR1nWy36OkQQglfA1nYQI7s13qwsRp2orX53ExagX/eLxymtz
	Ohbe1O+EYEBMSFUPEE91U4aX4yOCBQxPEiS2mJL0VSMXbmRFI3c50QEVQFNKY0woI42NtZeSVcuE6
	jJNnsPWAakkD3SZL1WD8VteELVF7ChlRkqGvXvSiykmTjXa0yx8Hki4zje1N4pi3t/0pHemE/DD/T
	EOH0s510vgIKDaTl/gjcb8EXycPFvubk0wzVEHlBfpI8MPcUio35IbX9AUQGc7zb2RUZM1UaJ48GB
	hEqqELqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Vtc-0000000DPIe-0GS5;
	Wed, 23 Oct 2024 07:35:08 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3VZl-0000000DLPW-194U
	for ath11k@lists.infradead.org;
	Wed, 23 Oct 2024 07:14:38 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-2e2a999b287so4969492a91.0
        for <ath11k@lists.infradead.org>; Wed, 23 Oct 2024 00:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1729667676; x=1730272476; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pRJ+GZAFwtn0kOSMat8djdxy5/xbVF1GRGV31Fs/Szs=;
        b=OiZuMp9+VisALQZDP2WnMnsaok6lB/HInhRY0NLXcMLfoCyzWiDnrrSdkBgUyerzQe
         d9wwwkQezejqbJZADt3tgqxrHyeS0a7FTFNoInqf1BF9REhIqvyijrXH2NCunTEAuAAm
         b2LvqTcgD1BKFEwTuU8hPW1SgGwNBF9egEU6c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729667676; x=1730272476;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pRJ+GZAFwtn0kOSMat8djdxy5/xbVF1GRGV31Fs/Szs=;
        b=bVR/lIURYsE5YZthuOmXAt2FYoIBr+6tgZ74W5ahIF+N0vQ5Ok7aSpVE0+ImP3eQl/
         jDhZXcW0E9/dxjsH8RdRKsLTyOCHfGnTPm5vM4zSYF1QyHgY4YnJaoXeTp9Bny0Dr4hq
         cJ0mTcYSIDDXtJ+Nyhx6h7CcqW8wTh/6DaMd4vookO/SznxIq727f1mkI6JJZJyRf51D
         ldgt3xATjQXMA4eeXTTTUHvt4nJU2VvnRPuk0yDCpcVyDP7Xe7V/6uy3Lhu1i3jol9qF
         slrsjC3E7aYzOqx8BwwAIEdh601U72xiXUqcH82xYEe9Z+q0gkiHSAr02uZ0T850WYm6
         JL+g==
X-Forwarded-Encrypted: i=1; AJvYcCVJAHQnNg7+5z8aU0EaR2gRDmCTlSW/yrQmdB3u8GOEgN0OGTeIF22d/QTe4A4309N/O/ANxzQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YxVFe+4IJdJSKqGnssOENN7SvHAQSEUAI89fjwSYAIRtqqQlQoG
	tvpXN0qSl8Y2c48fkipWmIHoQoSxRVVtKrP9fh7+OL0TqyqyMReQJY82U8OhvRKue/Vz9miRS75
	yYIuo5SIwq0xqtoUDimgsGtvmWzw9PRP1855g4g==
X-Google-Smtp-Source: AGHT+IHqoz5Q36gQyrAvK8SX4cX+RPO+EX7ZovOrR0jzMjiF+ZHWDFdkTc2ecsYzD01ehe9Oze4H1hAqq851/7V/Wf4=
X-Received: by 2002:a17:90a:7347:b0:2d8:7561:db71 with SMTP id
 98e67ed59e1d1-2e76b6e80edmr1585422a91.25.1729667675570; Wed, 23 Oct 2024
 00:14:35 -0700 (PDT)
MIME-Version: 1.0
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Wed, 23 Oct 2024 09:14:23 +0200
Message-ID: <CAOf5uwmxXvHNwycaOECkX5v7+zwHtpuvCKs3pJofuJJNe2Rwyw@mail.gmail.com>
Subject: ath11k_pci. wifi stop to work after long laptop suspend
To: Kalle Valo <kvalo@kernel.org>, ath11k@lists.infradead.org
Cc: Jeff Johnson <jjohnson@kernel.org>, 
	"open list:TI WILINK WIRELES..." <linux-wireless@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_001437_348490_0437F324 
X-CRM114-Status: UNSURE (   4.65  )
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

Hi all

I found this problem on several linux version and I will like to have
some hint to debug or fix:

[  205.690214] ath11k_pci 0000:02:00.0: fw_version 0x1106196e
fw_build_timestamp 2024-01-12 11:30 fw_build_id
WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.37
[  205.745065] ath11k_pci 0000:02:00.0: Last interrupt received for each CE:
[  205.745074] ath11k_pci 0000:02:00.0: CE_id 0 pipe_num 0 54750ms before
[  205.745078] ath11k_pci 0000:02:00.0: CE_id 1 pipe_num 1 36959ms before
[  205.745081] ath11k_pci 0000:02:00.0: CE_id 2 pipe_num 2 36912ms before
[  205.745084] ath11k_pci 0000:02:00.0: CE_id 3 pipe_num 3 36912ms before
[  205.745087] ath11k_pci 0000:02:00.0: CE_id 5 pipe_num 5 4294872919ms before
[  205.745091] ath11k_pci 0000:02:00.0: CE_id 7 pipe_num 7 4294872919ms before
[  205.745094] ath11k_pci 0000:02:00.0: CE_id 8 pipe_num 8 4294872919ms before
[  205.745097] ath11k_pci 0000:02:00.0:
               Last interrupt received for each group:
[  205.745099] ath11k_pci 0000:02:00.0: group_id 0 4294872919ms before
[  205.745103] ath11k_pci 0000:02:00.0: group_id 1 4294872919ms before
[  205.745106] ath11k_pci 0000:02:00.0: group_id 2 4294872919ms before
[  205.745109] ath11k_pci 0000:02:00.0: group_id 3 4294872919ms before
[  205.745112] ath11k_pci 0000:02:00.0: group_id 4 45367ms before
[  205.745115] ath11k_pci 0000:02:00.0: group_id 5 45367ms before
[  205.745118] ath11k_pci 0000:02:00.0: group_id 6 4294872919ms before
[  205.745121] ath11k_pci 0000:02:00.0: group_id 7 4294872919ms before
[  205.745124] ath11k_pci 0000:02:00.0: group_id 8 4294872919ms before
[  205.745127] ath11k_pci 0000:02:00.0: group_id 9 4294872919ms before
[  205.745129] ath11k_pci 0000:02:00.0: group_id 10 4294872919ms before
[  205.745133] ath11k_pci 0000:02:00.0: dst srng id 0 tp 0, cur hp 0,
cached hp 0 last hp 0 napi processed before 4294872919ms
[  205.745137] ath11k_pci 0000:02:00.0: dst srng id 1 tp 0, cur hp 0,
cached hp 0 last hp 0 napi processed before 4294872919ms
[  205.745140] ath11k_pci 0000:02:00.0: dst srng id 2 tp 0, cur hp 0,
cached hp 0 last hp 0 napi processed before 4294872919ms
[  205.745143] ath11k_pci 0000:02:00.0: dst srng id 3 tp 0, cur hp 0,
cached hp 0 last hp 0 napi processed before 4294872919ms
[  205.745147] ath11k_pci 0000:02:00.0: dst srng id 4 tp 0, cur hp 0,
cached hp 0 last hp 0 napi processed before 4294872919ms
[  205.745150] ath11k_pci 0000:02:00.0: src srng id 5 hp 0, reap_hp
248, cur tp 0, cached tp 0 last tp 0 napi processed before
4294872919ms
[  205.745154] ath11k_pci 0000:02:00.0: src srng id 8 hp 170, reap_hp
170, cur tp 0, cached tp 0 last tp 0 napi processed before 21825ms
[  205.745158] ath11k_pci 0000:02:00.0: dst srng id 9 tp 0, cur hp 0,
cached hp 0 last hp 0 napi processed before 4294872919ms
[  205.745161] ath11k_pci 0000:02:00.0: src srng id 16 hp 0, reap_hp
4088, cur tp 0, cached tp 0 last tp 0 napi processed before
4294872919ms
[  205.745165] ath11k_pci 0000:02:00.0: src srng id 24 hp 0, reap_hp
248, cur tp 0, cached tp 0 last tp 0 napi processed before
4294872919ms
[  205.745169] ath11k_pci 0000:02:00.0: dst srng id 25 tp 0, cur hp 0,
cached hp 0 last hp 0 napi processed before 4294872919ms
[  205.745172] ath11k_pci 0000:02:00.0: src srng id 32 hp 12, reap_hp
8, cur tp 12, cached tp 12 last tp 8 napi processed before 54750ms
[  205.745176] ath11k_pci 0000:02:00.0: src srng id 35 hp 120, reap_hp
116, cur tp 120, cached tp 120 last tp 116 napi processed before
36912ms
[  205.745180] ath11k_pci 0000:02:00.0: src srng id 36 hp 48, reap_hp
44, cur tp 48, cached tp 48 last tp 40 napi processed before 45394ms
[  205.745184] ath11k_pci 0000:02:00.0: src srng id 39 hp 0, reap_hp
124, cur tp 0, cached tp 0 last tp 0 napi processed before
4294872919ms
[  205.745188] ath11k_pci 0000:02:00.0: src srng id 57 hp 0, reap_hp
0, cur tp 4, cached tp 4 last tp 4 napi processed before 36959ms
[  205.745191] ath11k_pci 0000:02:00.0: src srng id 58 hp 160, reap_hp
160, cur tp 164, cached tp 164 last tp 164 napi processed before
36912ms
[  205.745195] ath11k_pci 0000:02:00.0: src srng id 61 hp 1020,
reap_hp 1020, cur tp 0, cached tp 0 last tp 0 napi processed before
54751ms
[  205.745199] ath11k_pci 0000:02:00.0: dst srng id 81 tp 8, cur hp 8,
cached hp 8 last hp 8 napi processed before 36959ms
[  205.745202] ath11k_pci 0000:02:00.0: dst srng id 82 tp 328, cur hp
328, cached hp 328 last hp 328 napi processed before 36912ms
[  205.745206] ath11k_pci 0000:02:00.0: dst srng id 85 tp 0, cur hp 0,
cached hp 0 last hp 0 napi processed before 4294872919ms
[  205.745210] ath11k_pci 0000:02:00.0: src srng id 104 hp 65532,
reap_hp 65532, cur tp 0, cached tp 0 last tp 0 napi processed before
54753ms
[  205.745213] ath11k_pci 0000:02:00.0: src srng id 105 hp 0, reap_hp
504, cur tp 0, cached tp 0 last tp 0 napi processed before
4294872919ms
[  205.745217] ath11k_pci 0000:02:00.0: dst srng id 106 tp 0, cur hp
0, cached hp 0 last hp 0 napi processed before 4294872919ms
[  205.745220] ath11k_pci 0000:02:00.0: dst srng id 109 tp 0, cur hp
0, cached hp 0 last hp 0 napi processed before 4294872919ms
[  205.745224] ath11k_pci 0000:02:00.0: src srng id 128 hp 8190,
reap_hp 8190, cur tp 4156, cached tp 0 last tp 0 napi processed before
54500ms
[  205.745228] ath11k_pci 0000:02:00.0: src srng id 129 hp 0, reap_hp
2046, cur tp 0, cached tp 0 last tp 0 napi processed before
4294872919ms
[  205.745232] ath11k_pci 0000:02:00.0: src srng id 132 hp 20, reap_hp
20, cur tp 22, cached tp 22 last tp 22 napi processed before 6ms
[  205.745235] ath11k_pci 0000:02:00.0: dst srng id 133 tp 0, cur hp
0, cached hp 0 last hp 0 napi processed before 4294872919ms
[  205.745239] ath11k_pci 0000:02:00.0: src srng id 144 hp 0, reap_hp
2046, cur tp 0, cached tp 0 last tp 0 napi processed before
4294872919ms
[  205.745242] ath11k_pci 0000:02:00.0: src srng id 147 hp 4, reap_hp
4, cur tp 6, cached tp 6 last tp 6 napi processed before 6ms
[  205.745246] ath11k_pci 0000:02:00.0: dst srng id 148 tp 0, cur hp
0, cached hp 0 last hp 0 napi processed before 4294872919ms

This happens for now on some specific access point but after it
happens the only way to reconnect is restart the access point.

Any hint?

Michael

--
Michael Nazzareno Trimarchi
Co-Founder & Chief Executive Officer
M. +39 347 913 2170
michael@amarulasolutions.com
__________________________________

Amarula Solutions BV
Joop Geesinkweg 125, 1114 AB, Amsterdam, NL
T. +31 (0)85 111 9172
info@amarulasolutions.com
www.amarulasolutions.com

