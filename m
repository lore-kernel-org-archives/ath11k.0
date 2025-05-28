Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DE04C5AE59
	for <ath11k@archiver.kernel.org>; Wed, 28 May 2025 06:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BJf2emHEfq/X781Clwbr6MSwesl5vhnwmA7nNE86Ctg=; b=fRcCqcZMfidnIYrWVT8mjpb38E
	W0N7RMw7v7Q6PRfuYtbnH6vvhoxBuVZzDVayZZDkSd04eResUH/IhTmHagf2xwPUAaRj6U952z2eg
	cKySknQWLhyf1AN2BSa9KEgB+thAGu/Zyq9fMuN7stGwrKnsSmgFvdH4YzsFxjB/A7LOdPCbxjmFf
	l1gPC0mB760sEHttj2ruDuph4a+1XjQGxrlkU0nZrnJbqbe3zMPGQeGL7PAFnecBAPrv1y2rD39pT
	MRUYDUA/ljun79mGe7eAPp766RAe/hlgwMEXQw/4PDcEt07UHsElcu1Ie3FEgERHgM+KOHnn3EUEO
	BzBFnP2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKAkv-0000000CNZu-0n8r;
	Wed, 28 May 2025 06:59:17 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKAj4-0000000CNFs-1Os6
	for ath11k@lists.infradead.org;
	Wed, 28 May 2025 06:57:23 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-234b440afa7so9949365ad.0
        for <ath11k@lists.infradead.org>; Tue, 27 May 2025 23:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1748415441; x=1749020241; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BJf2emHEfq/X781Clwbr6MSwesl5vhnwmA7nNE86Ctg=;
        b=B0W7v+gs1cj2CtGsYVe/8z66khk7YsC+Av+yDz9Pw8LiP6OrcBU+Kh5XT5UHoDKfg5
         Ps84ZGsIrg4BdMlZlGLMOUYAJvB3Fi4V378AjWtD8phagw/L/KpYvUnQeRfbw/RJQzAb
         wH8eQCnkEhPvp+X0m31ZVFWQQtLVnAIdBTQHo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748415441; x=1749020241;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BJf2emHEfq/X781Clwbr6MSwesl5vhnwmA7nNE86Ctg=;
        b=rDx+w1Vo/BgWDDdYsd9tY+jUcoBlxCP+7damnwox7L/H15+/s2hkc2aWo5YZbTlVS0
         XYcc4Lv+XXdHoab9N3g1ovR+t0gDeqgozRUfseeqcJhzPxjV23vnMJJCkxagh7DKhpsw
         53WOno//f+zhRFC8J1Q/BQcD3yRS6cKcmWjlH9VGpcrtFhgJN35O8L/zfnvmZDALurHw
         6oGt7zpwSljusUXDb91T6UyZpuszYe7L3od1fgWF3WauCYHAMxfAOUA6opYAdIQ8uR0o
         oRqBA0oEWMXmWfsWEMgKBk9V5On7QZeZipU+Bh/CblVrtY4T7yC9QGusUKJFT/syd3Ts
         nkDA==
X-Forwarded-Encrypted: i=1; AJvYcCW/TH9leoFJJRm+2/qsTIUxrltIVwSOiRrex0no4305hK6x9wtbklRMjVswWfI6JD7xF2tUv/A=@lists.infradead.org
X-Gm-Message-State: AOJu0YzLFcAKnZnE03EknXvTnJ6eUUCl0KynDg0CjiXboCHsqvQmn1vX
	3FfVQH2eqZ7Lz2ITq1wusvRgXukgXUm83DCRCO4I2HQ/MqcAPx8mP692XWDHMnr58Q==
X-Gm-Gg: ASbGnctRrP0CLMVq6GbAcI6ZcVL3YFzpGbyaVxTrRLvs5QcMvi34IKhUAb1QMgWyemu
	ILA2OWkLkGyOfyJYLfHccxEAIhZWLdgH2sWPlcjp52s1CN1WoERETKLMZXQbLmndl3uOb8z0jQ0
	ic7qULlNL7MlSFPNKx9FygFoQ/c63+P688B9a5hGgHTmJwPm/HLpO/NXEiQUL4frnaMq+vJz1dx
	lVrpg7Swj+80BEWnzcIbDiip+tNVI6gRH3AxKKJZAtDWj6UQg8GJ/a1sxlOm4AjpkP/eNN7LSaP
	L+Df8GvxNnh9g9JDF5ccsCHjYjLYyGg9vZc6oVS097d/6TcxDWZK
X-Google-Smtp-Source: AGHT+IErFYP5ybzDLBUxNWWiAUfzYAgptPpNppOu82TA1YA5H9SJxLXCw5ie4h2NIJ0vK76PvvWdCA==
X-Received: by 2002:a17:903:185:b0:21f:35fd:1b7b with SMTP id d9443c01a7336-2341500bbcemr205484905ad.50.1748415441191;
        Tue, 27 May 2025 23:57:21 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:88fd:67f2:b90d:8b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-234d2fe186asm5332355ad.59.2025.05.27.23.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 23:57:20 -0700 (PDT)
Date: Wed, 28 May 2025 15:57:17 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org, 
	ath11k@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] wifi: ath11k: mark reset srng lists as initialized
Message-ID: <utofrwmlblop7re2ak24ni3wmlc4i4xx4jwwtd4dpg2gsvrpxy@prbr3vjl4qsu>
References: <20250528065510.2790649-1-senozhatsky@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528065510.2790649-1-senozhatsky@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_235722_370144_C20C5B35 
X-CRM114-Status: UNSURE (   6.60  )
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

On (25/05/28 15:54), Sergey Senozhatsky wrote:
> ath11k_hal_srng_deinit() frees rdp and wrp which are used
> by srng lists.  Mark srng lists as not-initialized.

The subject was supposed to spell "uninitialized" instead of "initialized".

