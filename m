Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF86AC43334
	for <ath11k@archiver.kernel.org>; Mon, 27 Jun 2022 10:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1BWhwfrkZ1zruEbfMaxBTyNZa2+0+hIZJulXp+4NdyI=; b=jLRE+h5/Ots/42
	7LMzQiOOtISwdz7AbKjLvZLA2DxSDuf/bXoiYeknch9ycTjnN2Cg7ghAvbPnSaDF1YbESMcGhxLZ7
	LqV1XYI/H81l3+6sHv0FYHfqTAEAG7EMo3N2SjXVzqmT2LmiWfN+8yiMW5wBC3L008vnz1TL3Kw1o
	5NEfr8ixex/GzB/J/IvEm73YG9Ec23lGK3uCq1L/1hTNUr/2Yec0+hWqaLKMTr69Kcaf3v5ppxiT8
	Hfw3oszKxsr0aS9KfvT3hbrVewuAPNdZ6OQVS8q4jdlyo+1hAXDCfa3yAShIQ12x0wZCnoOlXLjK0
	K+2ChVO2vZhNNjhHNnzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5m0w-0007z1-Ae; Mon, 27 Jun 2022 10:30:42 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5m0u-0007yC-8s
	for ath11k@lists.infradead.org; Mon, 27 Jun 2022 10:30:41 +0000
Received: by mail-qv1-xf35.google.com with SMTP id y14so14031176qvs.10
        for <ath11k@lists.infradead.org>; Mon, 27 Jun 2022 03:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cZfAPaEvqTx34DnDPzb0WJHLTgfejH45gbcwnO/wivg=;
        b=G2l+hKTC3b/3VUqvEpG03cbAWnBPUCxVt0TElZyrlXe9sLwg2fGZr+Xbz7KNps23gX
         FUHqn/6nL6V+5PnjpOPvbU4+0MmRB82Um2XU44C0uYkdL/cw5EC6nUECFdLsKTNCSEIL
         TYiO7Zif4ZqUm3feIrFdS5VmRvbQcaaCtvnT2zdYqNg6RoAbf/rb6RLjUw4wzHMJvJJo
         FmbQ93mhlFAyaXF901/8R+aOozJuguPprdQpTYaYCVaftU/st+gZ+DjZ4DzPsSSYEcVo
         KBQi1zWKuk77SiLYtPDPK8cAa3OTSPMfBFrqeaP0+noIs6TO5oysc1G4glI+yYaHj6nx
         GIvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cZfAPaEvqTx34DnDPzb0WJHLTgfejH45gbcwnO/wivg=;
        b=1ihHZcmrRCel32Ef5SlZJ3fwFs664RROFdoeHRlGHOe8ZgqMQKiEWL5J4XOBnC0yQg
         8SJMJXJVw1KLW0LqqfUe9m6HKHUhrLqvexWJ4inAqCZqgEKGZxh65R0ta2JW7UH10WeU
         qxfk7hVaxMw0hcdIcXwARvweViSEYekUorzL4MGLr2/LOExsnMexukKurBDtHnpjvMrJ
         whU6aKpdkLqMx7+mI/lEKNBBh23LJnFivIMc7Q4IRkcMHUn9qnzzUPbaPDzw25TXUzhz
         PA0fbS0ZBBiftEmFTV5qM6GEQT3/jWWCMhRPxXqQEJ4XWdZ5anWabi0ZcJfbOp5DyfYq
         hLfA==
X-Gm-Message-State: AJIora+EWB04GEn0wYKfAlwXKWQy0aXf/DSUsUCKp7V6aupo06rwy/Ad
	vRfJ6H4bnhVfzq4B8oJ4akZZMqZGpvOAxU71HbEturfUQbI=
X-Google-Smtp-Source: AGRyM1voIwXZ4dMPnpLAqnCx3C8loYQQRTztZqdu3BPiOLJoENjZC+j0T+13kENmWdRQC8XyE5oler0toFCdYmPZk3w=
X-Received: by 2002:a05:622a:1791:b0:317:76d8:d17f with SMTP id
 s17-20020a05622a179100b0031776d8d17fmr8667214qtk.82.1656325838358; Mon, 27
 Jun 2022 03:30:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220621135339.1269409-1-robimarko@gmail.com> <87o7yeo104.fsf@kernel.org>
In-Reply-To: <87o7yeo104.fsf@kernel.org>
From: Robert Marko <robimarko@gmail.com>
Date: Mon, 27 Jun 2022 12:30:27 +0200
Message-ID: <CAOX2RU4G-009qYZF7-LcCT9SCeAmj=v9Hdk+NU-nebq=fGdjBQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: net: wireless: ath11k: add new DT entry
 for board ID
To: Kalle Valo <kvalo@kernel.org>
Cc: davem@davemloft.net, Eric Dumazet <edumazet@google.com>, kuba@kernel.org, 
	pabeni@redhat.com, Rob Herring <robh+dt@kernel.org>, krzysztof.kozlowski+dt@linaro.org, 
	ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, 
	netdev@vger.kernel.org, Devicetree List <devicetree@vger.kernel.org>, 
	open list <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_033040_366581_9D582962 
X-CRM114-Status: GOOD (  15.44  )
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

On Mon, 27 Jun 2022 at 12:27, Kalle Valo <kvalo@kernel.org> wrote:
>
> Robert Marko <robimarko@gmail.com> writes:
>
> > bus + qmi-chip-id + qmi-board-id and optionally the variant are currently
> > used for identifying the correct board data file.
> >
> > This however is sometimes not enough as all of the IPQ8074 boards that I
> > have access to dont have the qmi-board-id properly fused and simply return
> > the default value of 0xFF.
> >
> > So, to provide the correct qmi-board-id add a new DT property that allows
> > the qmi-board-id to be overridden from DTS in cases where its not set.
> > This is what vendors have been doing in the stock firmwares that were
> > shipped on boards I have.
>
> What's wrong with using 0xff? Ie. something like this:
>
> bus=ahb,qmi-chip-id=0,qmi-board-id=255,variant=foo
>
> Or maybe even just skip qmi-board-id entirely if it's not supported? So
> that the board file string would be something like:
>
> bus=ahb,qmi-chip-id=0,variant=foo
>
> I really would like to avoid adding more DT properties unless it's
> absolutely critical.

Well, I suppose that due to the variant property we can avoid "correcting" the
qmi-board-id

Regards,
Robert
>
> --
> https://patchwork.kernel.org/project/linux-wireless/list/
>
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
