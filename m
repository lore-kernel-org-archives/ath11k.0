Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68226C7619A
	for <ath11k@archiver.kernel.org>; Wed, 12 Apr 2023 09:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+mVHkroaXL7XsnKqyonHqXBFDOUMtZ1zqFfwg0Ecl0M=; b=A0XM71XT4CW/ly
	8D+brJNKp7wKKlRMafaBpsijV9MZFlkz6orboWn79LN/S8bTyod2itOhJnlCYADoRwPXFFwnLp3Fo
	dsjPuo1hDdcgxFV6ukveyxLqOltEgIQGClDr+HfUI6QeanhB4LVUfKQUz76MSGdeBzesms0+B0IGI
	iqIGemUowxu+pYmEpVFW1OJOMXGZDMpLyYGOE0FzYWFvCtJWe3h0VXZZ/F3k+uhNsIOgfgcgfkgBG
	YLW6rwES8rVSZpfjo14/hgVsop9ZbRhuFWonpfXn4yJEn7X7Ty61mHrYKBnYWpqghZp8IlYADXjog
	g/N3+0wBsqxh6/ec8Egw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmX3b-002SSg-0Q;
	Wed, 12 Apr 2023 09:46:27 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmX3Y-002SRB-0m
	for ath11k@lists.infradead.org;
	Wed, 12 Apr 2023 09:46:26 +0000
Received: by mail-yb1-xb36.google.com with SMTP id d204so2636282ybh.6
        for <ath11k@lists.infradead.org>; Wed, 12 Apr 2023 02:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681292782; x=1683884782;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZNuVbYyBnP1BcaPopnX8lztKblurkV7/rLoacjW6Njs=;
        b=yAaY1KHIpqwcoP5byyGOts6dHMQUhWaW8lZyTtgdsRUUgDlaAHH395rOIxlekGq55a
         bAxYgNjrF5/lwJqeiX2SZRIlVk2wO1odlGdLhDv9ZjZ2OumLC3qfrIiMQFHTAFqR25OA
         Tq4XhZxEjZAvYzp36dH5BRB6SW2vYxt8LosNPecG+dyOaNI09RB5a/JtDX8MusxhsSzW
         Byn8erPSpBIlhHXnSrZzqjRlaYIdmdM+8LkwtNvqrZmqhF8RoY5A57vLjejbupdPrGyj
         Win6bDULj8RGrz7JGPWkwlJEv6Gygsn0CLc+x8I+UaVtZentrbTSPAYiXwEANqQ3N8ED
         beMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681292782; x=1683884782;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZNuVbYyBnP1BcaPopnX8lztKblurkV7/rLoacjW6Njs=;
        b=ejXUDeFhSXtDnJGtPD45eMhjKTsNV5KitivQeyZRluwSpz6MYur3JFmbKnEYTV6kQb
         j8Zc0bjwogtSNWCvq1W1ggzfrxUt4zft3lulcNZIyxH3dHOfcKk7hgS4tdwBqAOcV7E+
         vYH8q6ZkXH6UZtUlInvzd1Lk19CcDOoJt3qI0xbqJg3qzKThyPhgyTQbR52MyEzdInwh
         VWPB+unL/K5iTBT8ePyWH6hWIaL545IRMDpNk7rYYFW41DAHJpW6Glju09xoBNdfMhhy
         JhIurTNMqMsbMU+21Qo0QEbMXl8Z33ec8YtKNixwVtkrsDSsXT6GoTM1JfoSmAgHeopf
         4dgA==
X-Gm-Message-State: AAQBX9em8AmEP4VK/9ZX5igw17vF36o9vEJRGAV0x5xD5VfLdSe4yqD8
	FzXVgdrMo8aKivbS3n+QrK/mMf0VhXSVJIzcIE5gnQ==
X-Google-Smtp-Source: AKy350bOIfX5NAzv6KgxUT2B1YGM2RvsdUbOEM86g0uqawtzMv77LJ92an89N0cSH4dLXjtnO5ExgpcLpL6DNZjWOTY=
X-Received: by 2002:a25:da8e:0:b0:b8f:3647:d753 with SMTP id
 n136-20020a25da8e000000b00b8f3647d753mr1197484ybf.9.1681292782236; Wed, 12
 Apr 2023 02:46:22 -0700 (PDT)
MIME-Version: 1.0
References: <87cz4ia35m.fsf@kernel.org> <8ceeee1e-8828-69a9-facb-20c3787207bd@linaro.org>
 <87jzyh8mrw.fsf@kernel.org>
In-Reply-To: <87jzyh8mrw.fsf@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 12 Apr 2023 12:46:11 +0300
Message-ID: <CAA8EJpotq5KjbUAU+exR5uU9-9erFhdxPn_OTUJ58MrXM-Pngw@mail.gmail.com>
Subject: Re: [PULL linux-firmware] ath10k & ath11k firmware 20230405
To: Kalle Valo <kvalo@kernel.org>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org, 
	ath10k@lists.infradead.org, ath11k@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_024624_292762_715D754F 
X-CRM114-Status: GOOD (  13.59  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On Wed, 12 Apr 2023 at 12:36, Kalle Valo <kvalo@kernel.org> wrote:
>
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
>
> > Hi Kalle,
> >
> > On 05/04/2023 16:07, Kalle Valo wrote:
> >> Hi,
> >>
> >> Here's a pull request for ath10k and ath11k. For ath10k we have lots of
> >> board file updates in multiple hardware families. For ath11k we have new
> >> firmware branches for QCN9074, IPQ6018 and IPQ8074. WCN6750 also got a
> >> firmware update and WCN6855 has board file updates.
> >>
> >> Please let me know if there are any problems.
> >>
> >> Kalle
> >
> > Excuse me, a gentle reminder regarding WCN3990 board-2.bin. It was not
> > included into this pull request.
>
> Oh man, sorry about that. I guess my installation script was buggy and
> missed it somehow, I'll look at it later and make sure WCN3990 is not
> skipped anymore.

No problem, thanks a lot!


-- 
With best wishes
Dmitry

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
