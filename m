Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2D71C369AB
	for <ath11k@archiver.kernel.org>; Thu, 24 Apr 2025 09:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z5MyafENlEpco95TpBaUFshFsw1OM1QNr9nB8iGntOQ=; b=WnRTy3ojY4PqWHa1jNEbcjlFEE
	c7Ygqhnd6mhShUXnvhGxiqwKWF6daulyNVZ2fHGD+39lrWmhu9lFL5+bmMi0aFOiP7jSs5Ny9On8E
	/ccLhCtJOW4npNaeDkPc9+v+wXOZiXnxq4BzLTALaHXK4HjG3TGDs8Orah2WrWoHCuBno3NDMsX0L
	VZ++DW1ilF4l9CLiy8wkFGVoYt5wLLiaYokhMRoh/DqBkxNdkkt+ZME8pT1gVtAqvy9D9iq9x6wGI
	Nk9jcJT+8EDgZo2i60QvbNP0/AvZ86DWoZyCuEx2iPsh2YnAUj6ENd9i1kcVcT6gVjIWPkwtU2y3J
	g86ZvBJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7tJs-0000000DaWs-0H4x;
	Thu, 24 Apr 2025 09:56:36 +0000
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7sqm-0000000DUr6-1zC9
	for ath11k@lists.infradead.org;
	Thu, 24 Apr 2025 09:26:34 +0000
Received: by mail-vk1-xa2e.google.com with SMTP id 71dfb90a1353d-5290be1aedcso2137753e0c.1
        for <ath11k@lists.infradead.org>; Thu, 24 Apr 2025 02:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=moment-tech.20230601.gappssmtp.com; s=20230601; t=1745486790; x=1746091590; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Z5MyafENlEpco95TpBaUFshFsw1OM1QNr9nB8iGntOQ=;
        b=YE2T3v/+GnqEpBUabb+zHeqqS4CAAWMv6p1/5a+9jsUtYczTdKmG4ow5msFnYFGUYR
         TBviEFRTTYCsgbDzimfrhLZYaMhEiihs6iu7hLrfsmxkU2HBo1hF+ztmBzNxYfGMOASb
         H+TPgKuvgmEShKbfRpZag/K5ESYa3rSn9xYVvkbw5wjtuDKQqsy2uLGjpBa4wntFLRla
         3RURmT/ZJ+vAQZQ72TMb9YMcU4KdxDDEizIAAdF49gUhKWp9wuqdK2V2KGi6O7FpLanz
         KywOczKvnw3eG4FpNzQfmntcsOlwY0EN62RwWylDQaNPJvBhn2SASpT9n8ybPGbasWn4
         5OfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745486790; x=1746091590;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z5MyafENlEpco95TpBaUFshFsw1OM1QNr9nB8iGntOQ=;
        b=iRArnkSAeRhBejH0WPhQwVKG6nm8OMwsKXnRYllOnIvxhpysd5xb5mJQ61MdnqVnOM
         qK30/mU+acX1Fs6rhQ+Kdt6FfeCrXsOVM1nf2lOvM+v6nw6uKIo8Y4xikQ5klpos/Mn3
         lRvSvyQjci8cYJyJEwB4+Rbv/nCyefTB9xOl+A10+nMtcFyVoWidQ3kL+c4q7qF8zRAI
         Tdd0XEZLdUVsq7rVOJNfHT7u1kL4idh+X+eA/LTRuXMgjTPDcW6KfHq7V5y9T8RfeCpc
         6MjchNYahPE3UnXOzQFFyQV1uJkwCS/ziO7/3zE7i1WamvD2pAjzYiX9OERNmZMrL8YB
         vpdg==
X-Forwarded-Encrypted: i=1; AJvYcCUglVCSTQ1uVVH4p6LYBGRuFC9lHEIgnxVE2i7Jc2OZJVApWtz+dh+eHewMb8XQyvTbBPvEg/g=@lists.infradead.org
X-Gm-Message-State: AOJu0YwjSHJ4Z/I4FSTABKWHNK/6QCYtST9YIg6QmSSkf3PVrhGfAzej
	paAc0YE0dD1X/ZiVqz1iUtY6UTqp+3RDMoZUyUKFOnlGDIWw2nej0Acths4QQFr87Wu9TjY9Q9u
	CwagDQecMcbPHyIMW9r3vAEDa7hhll4RCjJS280Rn1oLgq3Uvq4oBeg==
X-Gm-Gg: ASbGncvXJ30VeDnFQCZ2IBRPy3936pyjl9iRbHQlF/ScyMedwWArLB5t7ljJlVpKqKi
	eHUoRylXb+UZG9Tofx2HifuglYVAgva/o1z5tpzHguOZM06EgHH9hVBFVVd7cacfph4cyMXh2e6
	GwgeIW8TRCejqEj6YAp4HXi/gA
X-Google-Smtp-Source: AGHT+IHyRB1i0g5fWywav0cOEieN+e4nUaQszBAhGxbwm/VUdLeZHQSkjvE5yHBUJoZv0utbFB+4Woyyfi+XwG64SUU=
X-Received: by 2002:a05:6122:238d:b0:527:b804:ff78 with SMTP id
 71dfb90a1353d-52a79cecf47mr761229e0c.1.1745486790456; Thu, 24 Apr 2025
 02:26:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250416100939.282481-1-balsam.chihi@moment.tech>
 <0e129e2a-67fc-48cc-9773-efbea3f7391d@quicinc.com> <fa16bad6-305f-77c1-3f56-703564e2dfee@quicinc.com>
In-Reply-To: <fa16bad6-305f-77c1-3f56-703564e2dfee@quicinc.com>
From: Balsam Chihi <balsam.chihi@moment.tech>
Date: Thu, 24 Apr 2025 11:25:54 +0200
X-Gm-Features: ATxdqUG_WrsQh_EY6ExiehuPKJDvXkH23pwheICaehGHv3febMevGIvKvu1CnIY
Message-ID: <CAONkfw6m9O_6FZHBrPYdpv+=AxSgsbh1T7+GaS+U+bnjyVVJvQ@mail.gmail.com>
Subject: Re: [PATCH] wifi: ath11k: pci: Fix msi_irq crash on driver unload
 with QCN9074 PCIe WiFi 6 modules
To: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>
Cc: Baochen Qiang <quic_bqiang@quicinc.com>, jjohnson@kernel.org, 
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_022632_730825_07C23241 
X-CRM114-Status: UNSURE (   6.40  )
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

Hello,

@Baochen Qiang,
Thank you for your feedback.
I tested unloading and reloading the driver and it is enumerated,
detected and operating correctly.
And I understand your concern about other chips, and certainly it is
not the best way to implement such a fix.
I will continue debugging to determine the root cause of the
synchronous external abort.
So this patch is now just a workaround to fix the kernel crash when
rmmod the driver and reboot the system,
that i wanted to share with you to attract your attention to the
problem, and seek for help.

@Vasanthakumar Thiagarajan,
Thank you too for your feedback.
Yes, I understand.
I will enable the debug_mask and check the logs, like you said.

I'm wondering if anyone else has the same problem with ath11k_pci.

I will keep you updated.

Balsam.

