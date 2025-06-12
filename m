Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B21C71136
	for <ath11k@archiver.kernel.org>; Thu, 12 Jun 2025 07:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qr8kVjHr7X/135AkQtdC+yfxTrVr7FzRufaMrCUufQI=; b=UW8FofeqTPzvtbDv+a+7hbRLFP
	1RUm+dyW6wKp6Rv6ISKWBnYmyDs8m1SrCDi1N1zgoHJ9SyEX3GkSQEUcaOpC+YmJR3PewioS7sX5q
	P59IFLh7gjzvtVRrHh2WQ7+GBh5FQ4vhxeYgJuftNjL4zzvCcafYDzIN+KsFWNH21JtrNtaMwM2rf
	dtYhxD95FISisOADr45Et00eCVlQHcyWh+tioAimZoh5mcPQjAxanQIon6MPCqfLzbj9k05ADn6Ep
	XP712JNFkIGFS3Ey3Q/NRG5X9+CT7yQtkSubzREoGYGy9O5Re8MlUxS+JN8q4Kci07/DTOjA55giZ
	wFhUxVgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPbzI-0000000COX9-0nvx;
	Thu, 12 Jun 2025 07:04:36 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPbxK-0000000COGh-27VB
	for ath11k@lists.infradead.org;
	Thu, 12 Jun 2025 07:02:35 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-7399a2dc13fso885559b3a.2
        for <ath11k@lists.infradead.org>; Thu, 12 Jun 2025 00:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749711754; x=1750316554; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qr8kVjHr7X/135AkQtdC+yfxTrVr7FzRufaMrCUufQI=;
        b=Gi0/1BDoDCW8ptoUb5BokqN11iu6lsOPfhQ/UEjqZ59ETk08VBdn00R7HySJF3TY5V
         AvFNpXaQJIZ6a7Nu22gf1XCAW57I04xzcghmptRt4pijnfrYgHtYsJ7hsGfeaH+o9M4j
         K8em6RaFBepUzfQqB9oIi8opo7gWKX5oU+kyk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749711754; x=1750316554;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qr8kVjHr7X/135AkQtdC+yfxTrVr7FzRufaMrCUufQI=;
        b=NpoH8QBmmpOyMWkwAbLo2kSzpvliaC/Cd8UhGCh8kX3PblYBE9TyczO7tIOcwTILiw
         2/H5ly2wS7Xwbxmxi7IghQQkL0cjy4Od1jLqrZMX3Qlbt+QyjzaKzGJX9Wod1hn9vE+P
         +LoZjchjsWDL2F+KcD81x5Cn5AmaBLWuUEMtPLpBByneLKESQla8XhKa69WOJ+QVfGoE
         tzP9GxkMokQQ1vsRd8CVXIg+POaCDNkXU35ghsMr4Mv5eBvIJBCRKMIqLc8D+u+yo/7h
         lmXCapWCa5OtjmmHWyv1WbZpSbXeyPuzW4d9sDmzXqCh3joemrklyTwuxl1ItMskqsxy
         hAPA==
X-Forwarded-Encrypted: i=1; AJvYcCXzGin5Ori6pabbHqGihJvTqgzOT0JSI172Wa/bWl9s/QMpp/bjTZUxjmjbLUEe6M+DwtSQX/Q=@lists.infradead.org
X-Gm-Message-State: AOJu0YzJRovJ5IQ6h4wCkIxITuKRH5JJoZd6xZ9KlJjqfGrz8P0Ezs/j
	BzgW4pjS5pBpGc5noYqrNL4NySyq1VkFH6ALsn4u6EiZoQabv0VFXMUl8j5mE4fJRw==
X-Gm-Gg: ASbGncvL4ANz8B0hG4krG4poyKtoTFa006enrQK9qVboZLZDREg3k9OzaVd4ApL/RHE
	gYIF298+XEaECozejO0bCXOY6yG8iknW7DBH87k//LtpB5sIWPBBaVRh0xFKwEYjTIRHyrjqiVh
	Fy31rCp5EDVrkH7rP7jF1Qj10ojugPAI1TcLfy0Z15clUEqx/aE1bwZVH7WwISsEXt/8zLiOBIB
	Xeit00LJ6Myw0liJLkJ0UjTakBDJ9bAg1yQWIhfEdHJpdppDQC/7j70k6RY6HkUPUBE3wQ/uHWq
	65HQLqt0NB5vrquaObHJitrILr2F6R+3/zh1FyxkuSjG1b7bHHwKHtrf4N/rh/Gr
X-Google-Smtp-Source: AGHT+IHval7kzOTw8xt75tWclw0C5/vtH8Ex8hhouxzzQKZOiM32UWpl93/0+/Xgn6u1sHUzijj+fQ==
X-Received: by 2002:a05:6a00:8cb:b0:736:5664:53f3 with SMTP id d2e1a72fcca58-7487c31bda1mr2941155b3a.15.1749711753751;
        Thu, 12 Jun 2025 00:02:33 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:fcb5:79e0:99d6:8d5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7488087e769sm755732b3a.11.2025.06.12.00.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 00:02:33 -0700 (PDT)
Date: Thu, 12 Jun 2025 16:02:28 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCHv2] wifi: ath11k: mark reset srng lists as uninitialized
Message-ID: <xr3n5pbohquhaloonctfqvpb2r3eu6fi5jly7ms4pgcotqmqzh@msrgbaawafsj>
References: <20250529035708.3136232-1-senozhatsky@chromium.org>
 <5857380e-ced9-4118-b9a0-ce926b25c11c@quicinc.com>
 <rxaibpgtf37w3th5lnt3w574w443yononqjoglyfktlcxe26qg@jpmtkckrotzp>
 <2f77045c-6763-4fc4-bf09-50fd9b76a394@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2f77045c-6763-4fc4-bf09-50fd9b76a394@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_000234_569193_CF64369C 
X-CRM114-Status: GOOD (  17.52  )
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

On (25/06/12 13:47), Baochen Qiang wrote:
> > [..]
> >>> diff --git a/drivers/net/wireless/ath/ath11k/hal.c b/drivers/net/wireless/ath/ath11k/hal.c
> >>> index 8cb1505a5a0c..cab11a35f911 100644
> >>> --- a/drivers/net/wireless/ath/ath11k/hal.c
> >>> +++ b/drivers/net/wireless/ath/ath11k/hal.c
> >>> @@ -1346,6 +1346,10 @@ EXPORT_SYMBOL(ath11k_hal_srng_init);
> >>>  void ath11k_hal_srng_deinit(struct ath11k_base *ab)
> >>>  {
> >>>  	struct ath11k_hal *hal = &ab->hal;
> >>> +	int i;
> >>> +
> >>> +	for (i = 0; i < HAL_SRNG_RING_ID_MAX; i++)
> >>> +		ab->hal.srng_list[i].initialized = 0;
> >>
> >> With this flag reset, srng stats would not be dumped in ath11k_hal_dump_srng_stats().
> > 
> > I think un-initialized lists should not be dumped.
> > 
> > ath11k_hal_srng_deinit() releases wrp.vaddr and rdp.vaddr, which are
> > accessed, as far as I understand it, in ath11k_hal_dump_srng_stats()
> > as *srng->u.src_ring.tp_addr and *srng->u.dst_ring.hp_addr, presumably,
> > causing things like:
> 
> But ath11k_hal_dump_srng_stats() is called before ath11k_hal_srng_deinit(), right?
> 
> The sequence is ath11k_hal_dump_srng_stats() is called in reset process, then restart_work
> is queued and in ath11k_core_restart() we call ath11k_core_reconfigure_on_crash(), there
> ath11k_hal_srng_deinit() is called, right?

My understanding is that the driver first fails to reconfigure

<4>[163874.555825] ath11k_pci 0000:01:00.0: already resetting count 2
<4>[163884.606490] ath11k_pci 0000:01:00.0: failed to wait wlan mode request (mode 4): -110
<4>[163884.606508] ath11k_pci 0000:01:00.0: qmi failed to send wlan mode off: -110
<3>[163884.606550] ath11k_pci 0000:01:00.0: failed to reconfigure driver on crash recovery

so ath11k_core_reconfigure_on_crash() calls ath11k_hal_srng_deinit(),
which destroys the srng lists, but leaves the stale initialized flag.
So next time ath11k_hal_dump_srng_stats() is called everything looks ok,
but in fact everything is not quite ok.

Regardless of that, I do think that resetting the initialized flag
when srng list is de-initialized/destroyed is the right thing to do.

