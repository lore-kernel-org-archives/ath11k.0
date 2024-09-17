Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 719E8C35FEE
	for <ath11k@archiver.kernel.org>; Tue, 17 Sep 2024 07:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hXw1lYT02+0Vf8ziiUOEHjvxWnQaB5EzNlXNmrfYuRs=; b=Cb+Bd7VOf6kbZT1SsArATXgfO4
	dD2DBor1Sqid8hthC70O08o8iAwL91VaBQU6Jfx5cZdZUMrs19dutVDEbNP9RVbOGUqhcdZ0X+80f
	bcg2GOnIvs0gm6DzYWNWdSG+3epIsgBp0fof9sqdjugve/tFARo6qzhSCFZn7dQ8wCh2EvgKbYCLJ
	JNYPD8W6ijoivPOQlHKxtmGTaQmYG0RLOiuPCaa7PoluKsEGM3VSQCy732c62wYbqjqhV92jUxtCZ
	4BKfMJcoFc3y6g0duexK32cBMt3Tiah5FUIr3p0PakPz48i81uurDRqDaAoOoj8O4CRgJpR6/1B6A
	jHGIRJVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqSkl-00000005bmG-0XjN;
	Tue, 17 Sep 2024 07:36:03 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqSki-00000005bkX-2AGc
	for ath11k@lists.infradead.org;
	Tue, 17 Sep 2024 07:36:02 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-710d5d9aac1so1979860a34.3
        for <ath11k@lists.infradead.org>; Tue, 17 Sep 2024 00:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google; t=1726558559; x=1727163359; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hXw1lYT02+0Vf8ziiUOEHjvxWnQaB5EzNlXNmrfYuRs=;
        b=a6XBWgjcbbTHVd1UX3exOMKyoCHAdrVo3b02sXKagSmhpSs+AummEIa2Npfxg+l65S
         EGv9ywuqonP4vsA6AYnROua+V912CiTSFe5NGvemNwhm1Lj4RSeRzAfgMFPAG1jI5KIJ
         xrkqZk5/U+1eiUqF6Ib4E5QILlD139x441oDfT2SuKcKbcL2lKOIYYYD0NpfAoeKRVI2
         0KcXR+i72CARHpwuF87HUHymZUlrlYfVN+Dcju7BZA3UYWCWqugWpq7uLSW5b6ZP4yyS
         Nn4hMWzWx5fkMNZsVpRx4cnmGRFh4jK/GAT/oMTYcMHQsbCKo0z/HqrKfzgm4l9v0u8y
         xR4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726558559; x=1727163359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hXw1lYT02+0Vf8ziiUOEHjvxWnQaB5EzNlXNmrfYuRs=;
        b=iKdNzB2/rZdTnAYFGhUjNJhtnL3ihDwlvkBLCw0dtMFuqclOs2pOI32qWZcww1yeOx
         U8M9qUBLwvhLWzhLedegnEwBHblk+XEHOOdJGrLLZZZuN3jtwQGLI/L28Z2l8ILGqgVG
         YFUfFQuxB9M8RMOdsOJh0xMBofPBTzBIG//nKqtl/atBijFMMEwIeQIZU5JKDqFhCAYN
         nDcxotSj0dx3aOvJL33EXtVhyVf1FZpBJfuYsCbjncSToc2XMljImS5h+KZd2UqcfWUa
         kFu9AFthGzspNhwSSbifEgMT7fJmq94kLMPeo5TjkWBkb0LgKJjMBRI+ki0eG7ndfgWk
         9x/A==
X-Gm-Message-State: AOJu0Yy/DPJqgsTSSeRDl1N6H1huQZdrEhp1xJG9DYDI/bTkAvJMhkbB
	NnDrN6AgOEfySXx8/Cf69JinlorGklc1cOJkquL2GbrJ6b460+wk4ltm+nd5QXA=
X-Google-Smtp-Source: AGHT+IEHp1vDwgtZRHoFKFLtTTznHVKZk9j9Bi+KqH9oQjhZyv/HzyXPI0TsB5c9yQz9Aw8c/pAT1g==
X-Received: by 2002:a05:6830:620b:b0:710:f287:7182 with SMTP id 46e09a7af769-711094fc683mr10497896a34.6.1726558558918;
        Tue, 17 Sep 2024 00:35:58 -0700 (PDT)
Received: from localhost (104-48-214-220.lightspeed.snantx.sbcglobal.net. [104.48.214.220])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-71239e9fee0sm1398011a34.30.2024.09.17.00.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2024 00:35:57 -0700 (PDT)
From: Steev Klimaszewski <steev@kali.org>
To: kvalo@kernel.org
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	quic_kangyang@quicinc.com,
	Steev Klimaszewski <steev@kali.org>
Subject: Re: [PATCH 0/2] wifi: ath11k: fix full monitor mode
Date: Tue, 17 Sep 2024 02:35:47 -0500
Message-ID: <20240917073547.99604-1-steev@kali.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <87ed5kaxxp.fsf@kernel.org>
References: <87ed5kaxxp.fsf@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_003600_761218_AE8FD98E 
X-CRM114-Status: UNSURE (   7.61  )
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

I would also like to know this.  I have a Thinkpad X13s with a WCN6855 in it,
and I've tried going back to the .30 firmware:

ath11k_pci 0006:01:00.0: fw_version 0x1106996e fw_build_timestamp 2023-10-13 07:30 fw_build_id WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30

and with your patchset applied, I'm still not able to create a monitor mode
interface.  Is there additional patching needed on top and this is just a fix
before that comes?

-- steev

