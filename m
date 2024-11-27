Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17161D66BAE
	for <ath11k@archiver.kernel.org>; Wed, 27 Nov 2024 03:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EXkezjBItwFS84EsFcYZBkVvSdJtp9PC1f5y3QrDEwE=; b=n4tHubLY0M7hxwRpyAoaVk686N
	T2adfvVeTfwnutYDnvwb/ffalzj1Lri/t2VcneuA/Ba7ebsOZqQP3SNu7CEWASRhkEV3/dRQ/JqdM
	xRmK4mXrWBhJB6QrokEJbezKmLcsnAUB/T23qqskQT8lyRK9n1oQ4hyZmt1vSunwr36T+yShHgfOE
	Y4OQAPNaJfvIk3f/x8K3nt8Pa5U3GjHrduQLPscD9v8G9wQdHxbSnSIJCMoZNYi5BN9hzdktnQtbY
	AC/CuljqFfJOllAVX9i6hc2GuM+y7u9+03HT8xquFLy6pzhdnn+tBmSR3SjE17GIb7CywhL36bwrx
	W0WXN/Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tG8jc-0000000C9WI-2oOw;
	Wed, 27 Nov 2024 03:29:00 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tG8ja-0000000C9Vz-0l24
	for ath11k@lists.infradead.org;
	Wed, 27 Nov 2024 03:28:59 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-71d47201b3fso1426241a34.2
        for <ath11k@lists.infradead.org>; Tue, 26 Nov 2024 19:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732678136; x=1733282936; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EXkezjBItwFS84EsFcYZBkVvSdJtp9PC1f5y3QrDEwE=;
        b=lnLzeJ/MoOgt+KezxotAzq1JM6Yvg/EqShHG6PQtSNRulKN/8stboraOu3iMK/Y32b
         MJAwvNqbzf/fZXmXl3TraRYcOtM7q4gFPLXbsxILKUMMqqmvuzWJRo8FoZalH9NeIsyR
         GuIZbFMLqWq6bsz7a1QtRzEerslP758pghRTB2d6/7dfZ6VR5S3iZgs3pxd5/NHvfj83
         Y/TRCCREPkECA9thVHNsdsmfaa9ooGz5pjEo5gAJLWPiTQk030SVwhgFHiPN5831/kIw
         2m71s7JefPXjSHVpzqJG/2UMNyd4QeGbSKYBcA0z5oENYHCRHlIHDO+ZHbF7XOwEmrsZ
         bw6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732678136; x=1733282936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EXkezjBItwFS84EsFcYZBkVvSdJtp9PC1f5y3QrDEwE=;
        b=XoRBmhEnWhdbQH3nH+FpO7ZXmDLUD6tMDA4NpFmWTvcH3k4qhaXjBTusEnlPUcHmQd
         MEGMpqj0QN/FSQ5AXc9cYZgQktdMYz56CuD8ghBm95nGskGfrzCbyrMa9wNPm/+1FfIY
         1NOSkwueJTPKWseF+YRqdLbu3dIZALmE0Jqwsc5zt0UCwjqLNlOWf1dhCXt106zfTgRG
         CdQ66xA1VuFKghwXEPYINK4i1bEDE2KjmXiOpuVRVGD7YuTayUjQvkF8Gv2qJh/6M5oY
         usbvK03YCOMCkXuY4ppMzsv18KERypl05Gk9taGPxE7hBgPybfWXt18SR5ZB03xS/uAT
         x6Ew==
X-Gm-Message-State: AOJu0Yzt+1b/oPZPdvCc+AHUVzmNz9d6yC6GCbNMYrDuAxTuzjaj3KLD
	h4jkklvIiIsYDSWWhra9knpLA7OJgaMV7qQ0W4rtj2mtil5VaN4/
X-Gm-Gg: ASbGncvHM+pdzc3evbXWgzf8wrGvaH1mKK8ucthnaqmld+ShOu8kVLqpWVC8fqc325K
	ipDRoN1GLB/gIw96rFNu34kUSLIa9Dbd++LptLgUKpq3gJCiEiH/8tyiQ4Q7ZIEhdg7/kwTSwWF
	yKSwSEl2Fr2a5VvP/b+7sWjmyXnmuqMvUGD+XoFyQm5CQTj6EWkBFlOSkakHNchaIUMmS/hbckd
	Mm6Qq2FkfdWyUIekPht17RDLPLAv347bHPGdQeKXc3ZXtTdZvh9cl2q
X-Google-Smtp-Source: AGHT+IG+5uTiwcOWjsWrsStnJeepttuhfxKuCGJ7NLB7+bGxe8Bt9UDRSsvgK1Ld4hoxOBhmASKnsA==
X-Received: by 2002:a05:6830:6e99:b0:71d:62bc:85ec with SMTP id 46e09a7af769-71d65caea6dmr1506440a34.13.1732678136236;
        Tue, 26 Nov 2024 19:28:56 -0800 (PST)
Received: from LAPTOP-SQ5KB8RN.lan ([222.249.179.118])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fbcc3dee7asm9562849a12.61.2024.11.26.19.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 19:28:55 -0800 (PST)
From: zgBCQ <zghbqbc@gmail.com>
X-Google-Original-From: zgBCQ <hbczqbc@163.com>
To: markus.elfring@web.de
Cc: ath11k@lists.infradead.org,
	jjohnson@kernel.org,
	kvalo@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	zghbqbc@gmail.com
Subject: Re: Re: [PATCH] wifi: ath11k: Fix NULL pointer check in ath11k_ce_rx_post_pipe()
Date: Wed, 27 Nov 2024 11:28:21 +0800
Message-Id: <20241127032821.57468-1-hbczqbc@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <a9ccc947-20b2-4322-84e5-c96aaa604e63@web.de>
References: <a9ccc947-20b2-4322-84e5-c96aaa604e63@web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_192858_219904_AA700C06 
X-CRM114-Status: UNSURE (   6.21  )
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

thanks for your reply

> Is there a need to reconsider also such a return value?

According to the current code (commit d5c65159f289) of 
this function, this function should be terminated directly
after checking the null pointer, the return value may be 
meaningless.

Baichuan Qi

